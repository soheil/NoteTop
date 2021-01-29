//
//  ViewController.swift
//  NoteTop
//
//  Created by marrynoname on 1/28/21.
//

import Cocoa
import AppKit

class ViewController: NSViewController, NSTextViewDelegate {
    
    @IBOutlet weak var inputField: NSTextView!

    override func viewDidLoad() {
        super.viewDidLoad()
        inputField.delegate = self
        inputField.font = NSFont.systemFont(ofSize: 13.5)
        inputField.textColor = NSColor.init(srgbRed: 189/256, green: 195/256, blue: 199/256, alpha: 1.0)
        
        inputField.string = ""
        
        do {
            let fileURL = FileManager.default.homeDirectoryForCurrentUser.appendingPathComponent(".note_top")
            inputField.string  = try String(contentsOf: fileURL, encoding: .utf8)
        } catch {
            print(error)
        }
    }
    
    func textDidChange(_ notification: Notification) {
        do {
            let writePath = FileManager.default.homeDirectoryForCurrentUser
            try FileManager.default.createDirectory(atPath: writePath.path, withIntermediateDirectories: true)
            try inputField.string.write(to: writePath.appendingPathComponent(".note_top"), atomically: false, encoding: .utf8)
        } catch {
            print(error)
        }
    }

    override func viewDidAppear() {
        view.window?.level = .floating
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

