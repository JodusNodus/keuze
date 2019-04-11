//
//  KiesTableView.swift
//  kies
//
//  Created by Thomas Billiet on 08/04/2019.
//  Copyright © 2019 Thomas Billiet. All rights reserved.
//

import Foundation
import Cocoa

class TableView: NSTableView, NSTableViewDelegate, NSTableViewDataSource {
    
    let column = NSTableColumn(identifier: LIST_COL_ID)
    var items = ["hello world", "sicko mode", "boi", "yeet", "skrr skrr"]
    
    init() {
        super.init(frame: LIST_RECT)
        rowSizeStyle = .large
        backgroundColor = .clear
        headerView = nil
        allowsEmptySelection = false
        allowsMultipleSelection = false
        allowsTypeSelect = false
        rowHeight = FONT_HEIGHT
        selectionHighlightStyle = .none
        dataSource = self
        delegate = self
        
        cell?.font = FONT
        
        column.isEditable = false
        column.width = LIST_RECT.width
        addTableColumn(column)
        
        sortItems(input: "test", items: items);
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        
    }
    
    func sortItems(input: String, items: [String]) -> [String] {
//        let results = fuse.search(input, in: items)
//        results.forEach { item in
//            print("index: \(item.index)")
//            print("score: \(item.score)")
//            print("ranges: \(item.ranges)")
//        }
        return items
    }
    
    func numberOfRows(in tableView: NSTableView) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: NSTableView, objectValueFor tableColumn: NSTableColumn?, row: Int) -> Any? {
        return items[row]
    }
    
    func tableView(_ tableView: NSTableView, willDisplayCell cell: Any, for tableColumn: NSTableColumn?, row: Int) {
        
    }

    func tableViewSelectionDidChange(_ notification: Notification) {
        print("selected")
    }

}
