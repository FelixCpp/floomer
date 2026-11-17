import Cocoa
import FlutterMacOS

class MainFlutterWindow: NSWindow {
  override func awakeFromNib() {
    let flutterViewController = FlutterViewController()
    let windowFrame = self.frame
    self.contentViewController = flutterViewController
    self.setFrame(windowFrame, display: true)

    // Start out invisible so the screenshot can be taken before anything of
    // floomer is on screen. The window is still ordered in, which keeps the
    // engine's display link running and frames being produced; only
    // `show_window` makes it actually visible.
    self.alphaValue = 0

    RegisterGeneratedPlugins(registry: flutterViewController)
    NativeBridge.register(with: flutterViewController, window: self)

    super.awakeFromNib()
  }
}
