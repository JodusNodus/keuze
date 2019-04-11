//
//  KiesTableView.swift
//  kies
//
//  Created by Thomas Billiet on 08/04/2019.
//  Copyright © 2019 Thomas Billiet. All rights reserved.
//

import Foundation
import Cocoa

class TableView: NSTableView, NSTableViewDelegate {
    
    let column = NSTableColumn(identifier: LIST_COL_ID)
    
    init(dataSource: DataSource) {
        super.init(frame: .zero)
        self.dataSource = dataSource
        rowSizeStyle = .custom
        backgroundColor = .clear
        headerView = nil
        allowsEmptySelection = false
        allowsMultipleSelection = false
        allowsTypeSelect = false
        rowHeight = FONT_HEIGHT
        selectionHighlightStyle = .sourceList
        delegate = self
        usesAlternatingRowBackgroundColors = true
        
        column.isEditable = false
        addTableColumn(column)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func reloadData() {
        super.reloadData()
        scrollToBeginningOfDocument(self)
        selectRow(0)
    }
    
    func selectRow(_ row: Int) {
        let indexSet = IndexSet(integer: row)
        selectRowIndexes(indexSet, byExtendingSelection: false)
    }
    
    func selectRowAbove() {
        let row = selectedRow - 1
        if (row >= 0) {
            selectRow(row)
            scrollRowToVisible(row)
        }
    }
    
    func selectRowBelow() {
        let row = selectedRow + 1
        if (row < numberOfRows) {
            selectRow(row)
            scrollRowToVisible(row)
        }
    }
    
    func tableView(_ tableView: NSTableView, willDisplayCell cell: Any, for tableColumn: NSTableColumn?, row: Int) {
        let c = cell as? NSCell
        c?.font = FONT
        c?.usesSingleLineMode = true
    }

    func tableViewSelectionDidChange(_ notification: Notification) {
    }

}
