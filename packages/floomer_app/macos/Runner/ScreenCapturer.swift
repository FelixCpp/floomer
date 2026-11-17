import AppKit
import ScreenCaptureKit

enum ScreenCaptureError: Error {
  case permissionDenied
  case noDisplay
  case conversionFailed
}

/// A captured screen image together with its metadata.
struct ScreenCapture {
  /// Raw, premultiplied BGRA8888 pixels — matches Flutter's
  /// `PixelFormat.bgra8888`, so Dart can hand them to `decodeImageFromPixels`
  /// without decoding anything.
  let pixels: Data
  /// Width of the image in pixels.
  let width: Int
  /// Height of the image in pixels.
  let height: Int
  /// Number of bytes per pixel row. Not necessarily `width * 4`, so Dart has to
  /// pass this along as `rowBytes`.
  let bytesPerRow: Int
  /// Backing scale factor of the captured display, so the pixel dimensions can
  /// be converted back to points.
  let scale: Double
}

/// Captures the screen through ScreenCaptureKit.
///
/// floomer's own windows are excluded from the capture, so the resulting image
/// is correct regardless of whether our window happens to be on screen already.
enum ScreenCapturer {
  /// Captures the display the mouse cursor currently sits on.
  static func captureDisplayUnderCursor() async throws -> ScreenCapture {
    guard CGPreflightScreenCaptureAccess() else {
      // Shows the system prompt. The permission only takes effect after a
      // relaunch, so this attempt still has to fail.
      CGRequestScreenCaptureAccess()
      throw ScreenCaptureError.permissionDenied
    }

    let content = try await SCShareableContent.excludingDesktopWindows(
      false,
      onScreenWindowsOnly: true
    )

    guard let display = displayUnderCursor(among: content.displays) else {
      throw ScreenCaptureError.noDisplay
    }

    let ownApplication = content.applications.first {
      $0.processID == ProcessInfo.processInfo.processIdentifier
    }
    let filter = SCContentFilter(
      display: display,
      excludingApplications: ownApplication.map { [$0] } ?? [],
      exceptingWindows: []
    )

    let scale = backingScaleFactor(for: display.displayID)
    let configuration = SCStreamConfiguration()
    configuration.width = Int(Double(display.width) * scale)
    configuration.height = Int(Double(display.height) * scale)
    configuration.captureResolution = .best
    configuration.showsCursor = false

    let image = try await SCScreenshotManager.captureImage(
      contentFilter: filter,
      configuration: configuration
    )

    let (pixels, bytesPerRow) = try bgraPixels(from: image)
    return ScreenCapture(
      pixels: pixels,
      width: image.width,
      height: image.height,
      bytesPerRow: bytesPerRow,
      scale: scale
    )
  }

  private static func displayUnderCursor(among displays: [SCDisplay]) -> SCDisplay? {
    let cursor = NSEvent.mouseLocation
    let screen = NSScreen.screens.first { $0.frame.contains(cursor) } ?? NSScreen.main
    guard let displayID = screen?.displayID else { return displays.first }
    return displays.first { $0.displayID == displayID } ?? displays.first
  }

  private static func backingScaleFactor(for displayID: CGDirectDisplayID) -> Double {
    let screen = NSScreen.screens.first { $0.displayID == displayID }
    return Double(screen?.backingScaleFactor ?? 1)
  }

  /// Redraws `image` into a buffer with a known layout instead of trusting the
  /// format ScreenCaptureKit happened to produce.
  ///
  /// The capture is flattened to sRGB here, which is what Flutter assumes for
  /// raw pixel data. On wide-gamut displays that clamps colors outside sRGB.
  private static func bgraPixels(from image: CGImage) throws -> (Data, Int) {
    let bytesPerRow = image.width * 4
    var buffer = Data(count: bytesPerRow * image.height)

    let drawn = buffer.withUnsafeMutableBytes { raw -> Bool in
      guard
        let colorSpace = CGColorSpace(name: CGColorSpace.sRGB),
        let context = CGContext(
          data: raw.baseAddress,
          width: image.width,
          height: image.height,
          bitsPerComponent: 8,
          bytesPerRow: bytesPerRow,
          space: colorSpace,
          bitmapInfo: CGImageAlphaInfo.premultipliedFirst.rawValue
            | CGBitmapInfo.byteOrder32Little.rawValue
        )
      else {
        return false
      }

      context.draw(
        image,
        in: CGRect(x: 0, y: 0, width: image.width, height: image.height)
      )
      return true
    }

    guard drawn else { throw ScreenCaptureError.conversionFailed }
    return (buffer, bytesPerRow)
  }
}

extension NSScreen {
  fileprivate var displayID: CGDirectDisplayID? {
    deviceDescription[NSDeviceDescriptionKey("NSScreenNumber")] as? CGDirectDisplayID
  }
}
