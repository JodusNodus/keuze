//
//  Sorter.swift
//  kies
//
//  Created by Thomas Billiet on 11/04/2019.
//  Copyright © 2019 Thomas Billiet. All rights reserved.
//

import Foundation
import Cocoa


class DataSource: NSObject, NSTableViewDataSource {
    var items: [String] = []
    var sortedItems: [String] = []
    
    func updateItems(items: [String]) {
        self.items = items
        self.sortedItems = items
    }
    
    func updateSort(query: String) {
        if (query.count < 0) {
            sortedItems = items
            return
        }
        var scores = [String: Float]()
        for item in items {
            scores[item] = Float(item.lowercased().longestCommonSubsequence(query.lowercased()).count) / Float(query.count)
        }
        
        sortedItems = items.sorted(by: { (a, b) -> Bool in
            scores[a]! > scores[b]!
        })
    }
    
    func numberOfRows(in tableView: NSTableView) -> Int {
        return sortedItems.count
    }
    
    func tableView(_ tableView: NSTableView, objectValueFor tableColumn: NSTableColumn?, row: Int) -> Any? {
        return sortedItems[row]
    }
    
}
