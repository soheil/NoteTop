//
//  AppDelegate.swift
//  NoteTop
//
//  Created by marrynoname on 1/28/21.
//

import Cocoa

@main
class AppDelegate: NSObject, NSApplicationDelegate, NSTextFieldDelegate {


    var hidden: Bool = false
    var statusBarItem: NSStatusItem!
    @IBOutlet weak var application: NSApplication!
    

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
//        inputField.delegate = self
        self.statusBarItem = NSStatusBar.system.statusItem(withLength: CGFloat(NSStatusItem.variableLength))
        
        let menu = NSMenu()
        menu.addItem(NSMenuItem.separator())
        menu.addItem(NSMenuItem(title: "Hide", action: #selector(togglePopover), keyEquivalent: "w"))
        menu.addItem(NSMenuItem(title: "Quit", action: #selector(NSApplication.terminate(_:)), keyEquivalent: "q"))
        
//        self.statusBarItem.menu = menu
        if let button = self.statusBarItem.button {
             button.image = NSImage(named: "icon1")
             button.action = #selector(togglePopover)
        }

    }
    
    @objc func togglePopover() {
        hidden = !hidden
        application.windows.first!.windowController?.contentViewController?.view.superview?.isHidden = hidden
//        self.statusBarItem.menu?.items[1].title = hidden ? "Show" : "Hide"
    }
    
    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }


}

