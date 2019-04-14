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
        headerView = nil
        allowsEmptySelection = false
        allowsMultipleSelection = false
        allowsTypeSelect = false
        selectionHighlightStyle = .none
        delegate = self
        backgroundColor = .clear
        
        column.isEditable = false
        column.width = layouts.listRect.width
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
        let c = cell as! NSTextFieldCell
        let value = c.stringValue
        c.font = settings.font
        c.usesSingleLineMode = true
        if (row == selectedRow) {
            c.backgroundColor = .alternateSelectedControlColor
            c.textColor = .alternateSelectedControlTextColor
            c.drawsBackground = true
        } else {
            c.drawsBackground = false
            c.textColor = .textColor
        }
        let match = (dataSource as! DataSource).matches[value]
        if (match != nil && !match!.isEmpty) {
            let range = (value.lowercased() as NSString).range(of: match!)
            let attribute = NSMutableAttributedString.init(string: value)
            attribute.addAttribute(NSAttributedString.Key.underlineStyle, value: NSUnderlineStyle.single.rawValue , range: range)
            c.attributedStringValue = attribute
        }

    }

    func tableViewSelectionDidChange(_ notification: Notification) {
    }

}
