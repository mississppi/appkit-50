//
//  ViewController.swift
//  AppKit-50
//
//  Created by KOSUKE SAKURAI on 2025/07/04.
//

import Cocoa

class ViewController: NSViewController {

    override func loadView() {
        self.view = NSView()
        self.view.frame = NSRect(x: 0, y: 0, width: 200, height: 200)
        self.view.wantsLayer = true
        self.view.layer?.backgroundColor = NSColor.red.cgColor
    }

}

