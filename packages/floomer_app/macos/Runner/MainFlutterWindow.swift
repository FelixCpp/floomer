import Cocoa
import FlutterMacOS

class MainFlutterWindow: NSWindow {
  override func awakeFromNib() {
    let flutterViewController = FlutterViewController()
    self.contentViewController = flutterViewController

    // Borderless overlay above the menu bar and dock. Its frame is set to the
    // captured screen in `show_window`.
    self.styleMask = .borderless
    self.level = .mainMenu + 1
    self.collectionBehavior = [.canJoinAllSpaces, .fullScreenAuxiliary, .stationary, .ignoresCycle]
    self.hasShadow = false
    self.isOpaque = true
    self.backgroundColor = .black
    self.isMovable = false
    self.animationBehavior = .none
    self.isRestorable = false

    // Start out invisible so the screenshot can be taken before anything of
    // floomer is on screen. The window is still ordered in, which keeps the
    // engine's display link running and frames being produced; only
    // `show_window` makes it actually visible.
    self.alphaValue = 0

    RegisterGeneratedPlugins(registry: flutterViewController)
    NativeBridge.register(with: flutterViewController, window: self)

    super.awakeFromNib()
  }

  // Borderless windows can't become key by default, which would swallow all
  // keyboard input (e.g. Escape to close).
  override var canBecomeKey: Bool { true }
  override var canBecomeMain: Bool { true }
}
