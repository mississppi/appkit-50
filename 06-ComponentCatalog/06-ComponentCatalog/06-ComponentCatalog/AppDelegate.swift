import Cocoa

class AppDelegate: NSObject, NSApplicationDelegate {
    var window: NSWindow!

    func applicationDidFinishLaunching(_ notification: Notification) {
        let viewController = CatalogViewController()
        window = NSWindow(
            contentRect: NSMakeRect(0, 0, 1000, 700),
            styleMask: [.titled, .closable, .resizable],
            backing: .buffered,
            defer: false
        )
        window.contentViewController = viewController
        // 🚨 ここでフレームサイズを強制指定
        let frame = NSRect(x: 0, y: 0, width: 1000, height: 700)
        window.setFrame(frame, display: true)
        window.center()
        window.title = "Blank Window"
        window.makeKeyAndOrderFront(nil)
    }

    func applicationShouldTerminateAfterLastWindowClosed(_ sender: NSApplication) -> Bool {
        return true
    }
}
