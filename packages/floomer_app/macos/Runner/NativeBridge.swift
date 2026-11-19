import Cocoa
import FlutterMacOS

/// Exposes the native capabilities floomer needs during startup to Dart.
///
/// The window starts out fully transparent (see `MainFlutterWindow`), so the
/// expected call order is `capture_screenshot` first, then `show_window` once
/// Dart has rendered the capture.
///
/// `capture_screenshot` answers with a map of `pixels` (raw BGRA8888),
/// `width`, `height`, `bytesPerRow` (all in pixels/bytes) and `scale`.
enum NativeBridge {
  static let channelName = "com.example.floomer/native"

  /// Deep link into the Screen Recording section of System Settings.
  private static let screenRecordingSettingsURL = URL(
    string: "x-apple.systempreferences:com.apple.preference.security?Privacy_ScreenCapture"
  )

  static func register(with controller: FlutterViewController, window: NSWindow) {
    let channel = FlutterMethodChannel(
      name: channelName,
      binaryMessenger: controller.engine.binaryMessenger
    )

    channel.setMethodCallHandler { [weak window] call, result in
      switch call.method {
      case "capture_screenshot":
        captureScreenshot(result: result)
      case "show_window":
        showWindow(window, result: result)
      case "open_screen_recording_settings":
        openScreenRecordingSettings(result: result)
      case "close_app":
        NSApplication.shared.terminate(nil)
        result(nil)
      default:
        result(FlutterMethodNotImplemented)
      }
    }
  }

  private static func captureScreenshot(result: @escaping FlutterResult) {
    Task {
      do {
        let capture = try await ScreenCapturer.captureDisplayUnderCursor()
        let payload: [String: Any] = [
          "pixels": FlutterStandardTypedData(bytes: capture.pixels),
          "width": capture.width,
          "height": capture.height,
          "bytesPerRow": capture.bytesPerRow,
          "scale": capture.scale,
        ]
        await MainActor.run { result(payload) }
      } catch {
        await MainActor.run { result(captureError(for: error)) }
      }
    }
  }

  private static func showWindow(_ window: NSWindow?, result: @escaping FlutterResult) {
    guard let window else {
      result(
        FlutterError(
          code: "no_window",
          message: "The main window is no longer available.",
          details: nil
        )
      )
      return
    }

    // Cover the display that was just captured, so the screenshot lines up 1:1
    // with the real desktop. Resize before revealing to avoid a visible jump.
    if let screen = NSScreen.underCursor {
      window.setFrame(screen.frame, display: true)
    }
    window.alphaValue = 1
    window.makeKeyAndOrderFront(nil)
    NSApplication.shared.activate(ignoringOtherApps: true)
    result(nil)
  }

  private static func openScreenRecordingSettings(result: @escaping FlutterResult) {
    guard let url = screenRecordingSettingsURL, NSWorkspace.shared.open(url) else {
      result(
        FlutterError(
          code: "open_settings_failed",
          message: "System Settings could not be opened.",
          details: nil
        )
      )
      return
    }
    result(nil)
  }

  private static func captureError(for error: Error) -> FlutterError {
    switch error {
    case ScreenCaptureError.permissionDenied:
      return FlutterError(
        code: "permission_denied",
        message: "floomer is not allowed to record the screen.",
        details: nil
      )
    case ScreenCaptureError.noDisplay:
      return FlutterError(
        code: "no_display",
        message: "No capturable display was found.",
        details: nil
      )
    case ScreenCaptureError.conversionFailed:
      return FlutterError(
        code: "conversion_failed",
        message: "The captured image could not be converted to BGRA pixels.",
        details: nil
      )
    default:
      return FlutterError(
        code: "capture_failed",
        message: error.localizedDescription,
        details: nil
      )
    }
  }
}
