//
//  AppDelegate.swift
//  AppKit-50
//
//  Created by KOSUKE SAKURAI on 2025/07/04.
//

import Cocoa

class AppDelegate: NSObject, NSApplicationDelegate {
    var window: NSWindow!

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        window = NSWindow(
            contentRect: NSMakeRect(0, 0, 600, 400),
            styleMask: [.titled, .closable, .resizable],
            backing: .buffered,
            defer: false
        )
        window.center()
        window.title = "No Storyboards Here!!!"
        let vc = ViewController()
        window.contentView = vc.view
        window.makeKeyAndOrderFront(nil)
    }
}

