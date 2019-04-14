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
    var items = [String]()
    var sortedItems = [String]()
    var matches = [String: String]()
    var scores = [String: Float]()
    
    func updateItems(_ items: [String]) {
        self.items = items
        self.sortedItems = items
    }
    
    func updateSort(query: String) {
        for item in items {
            let match = item.lowercased().longestCommonSubsequence(query.lowercased())
            matches[item] = match
            scores[item] = Float(match.count) / Float(query.count)
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
