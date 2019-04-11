//
//  main.swift
//  kies
//
//  Created by Thomas Billiet on 08/04/2019.
//  Copyright © 2019 Thomas Billiet. All rights reserved.
//

import Foundation
import Cocoa

class AppDelegate: NSObject, NSApplicationDelegate {
    
    var window: Window!
    var dataSource: DataSource!
    var promptText: PromptText!
    var inputField: InputField!
    var tableView: TableView!
    var scrollView: NSScrollView!
    
    func applicationDidBecomeActive(_ notification: Notification) {
        
    }
    
    func applicationDidResignActive(_ notification: Notification) {
        cancel();
    }
    
    func applicationDidFinishLaunching(_ notification: Notification)
    {
        print(CommandLine.arguments)
        window = Window()
        dataSource = DataSource()
        dataSource.updateItems(items: ["Olivia", "Amelia", "Isla", "Emily", "Ava", "Lily", "Mia", "Sophia", "Isabella", "Grace", "Oliver", "Harry", "Jack", "George", "Noah", "Charlie", "Jacob", "Alfie"])
        
        setupPromptText()
        setupInputField()
        setupList()
    
        app.activate(ignoringOtherApps: true)
        window.showWindow()
    }
    
    func setupPromptText() {
        let text = "kies iets:"
        promptText = PromptText(text: text)
        window.contentView!.addSubview(promptText)
    }
    
    func setupInputField() {
        inputField = InputField(width: window.frame.width - promptText.bounds.width, offsetY: promptText.bounds.width, appDelegate: self);
        window.contentView!.addSubview(inputField)
        window.makeFirstResponder(inputField)
    }
    
    func handleInputChange(input: String) {
        dataSource.updateSort(query: input)
        tableView.reloadData()
    }
    
    func handleMoveUp() {
        tableView.selectRowAbove()
    }
    
    func handleMoveDown() {
        tableView.selectRowBelow()
    }
    
    func handleSelect() {
        let value = dataSource.sortedItems[tableView.selectedRow]
        print(value)
        cancel()
    }
    
    func setupList() {
        scrollView = NSScrollView(frame: LIST_RECT)
        tableView = TableView(dataSource: dataSource)
        
        scrollView.horizontalScrollElasticity = .none
        scrollView.verticalScrollElasticity = .none
        scrollView.hasVerticalScroller = false
        scrollView.hasHorizontalScroller = false
        scrollView.drawsBackground = false
        scrollView.autoresizingMask = [NSView.AutoresizingMask.width, NSView.AutoresizingMask.height]
        scrollView.documentView = tableView
        scrollView.automaticallyAdjustsContentInsets = false
        window.contentView!.addSubview(scrollView)
    }
    
    func cancel() {
        exit(0)
    }
}


let app = NSApplication.shared
app.setActivationPolicy(.accessory)
let delegate = AppDelegate()
app.delegate = delegate

_ = NSApplicationMain(CommandLine.argc, CommandLine.unsafeArgv)
