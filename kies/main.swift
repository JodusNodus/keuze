//
//  main.swift
//  kies
//
//  Created by Thomas Billiet on 08/04/2019.
//  Copyright © 2019 Thomas Billiet. All rights reserved.
//

import Foundation
import Cocoa
import AppKit


class AppDelegate: NSObject, NSApplicationDelegate {
    
    var window: Window!
    var promptText: PromptText!
    var inputField: InputField!
    var tableView: TableView!
    
    
    func applicationDidBecomeActive(_ notification: Notification) {
        
    }
    
    func applicationDidResignActive(_ notification: Notification) {
        exit(0);
    }
    
    func applicationDidFinishLaunching(_ notification: Notification)
    {
        window = Window()
        
        addPromptText()
        addInputField()
        addList()
    
        app.activate(ignoringOtherApps: true)
        window.showWindow()
    }
    
    func addPromptText() {
        let text = "kies iets:"
        promptText = PromptText(text: text)
        window.contentView!.addSubview(promptText)
    }
    
    func addInputField() {
        inputField = InputField(width: window.frame.width - promptText.bounds.width, offsetY: promptText.bounds.width);
        window.contentView!.addSubview(inputField)
        window.makeFirstResponder(inputField)
    }
    
    func addList() {
        let scrollView = NSScrollView(frame: LIST_RECT)
        tableView = TableView()
        
        scrollView.verticalScrollElasticity = .none
        scrollView.hasVerticalScroller = true
        scrollView.hasVerticalRuler = true
        scrollView.drawsBackground = false
        scrollView.autoresizingMask = [NSView.AutoresizingMask.width, NSView.AutoresizingMask.height]
        scrollView.documentView = tableView
        scrollView.automaticallyAdjustsContentInsets = false
        
        window.contentView!.addSubview(scrollView)
    }
}


let app = NSApplication.shared
app.setActivationPolicy(.accessory)
let delegate = AppDelegate()
app.delegate = delegate

_ = NSApplicationMain(CommandLine.argc, CommandLine.unsafeArgv)
