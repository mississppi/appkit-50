import Cocoa

class AppDelegate: NSObject, NSApplicationDelegate {
    var window: NSWindow!

    func applicationDidFinishLaunching(_ notification: Notification) {
        let viewController = HelloWorldViewController()
        
        window = NSWindow(
            contentRect: NSMakeRect(0, 0, 400, 300),
            styleMask: [.titled, .closable, .resizable],
            backing: .buffered,
            defer: false
        )
        window.title = "02-HelloWorld"
        window.center()
        window.contentViewController = viewController
        window.makeKeyAndOrderFront(nil)
        print("hello")
    }

    func applicationShouldTerminateAfterLastWindowClosed(_ sender: NSApplication) -> Bool {
        return true
    }
}
