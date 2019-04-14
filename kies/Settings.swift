//
//  Settings.swift
//  keuze
//
//  Created by Thomas Billiet on 14/04/2019.
//  Copyright © 2019 Thomas Billiet. All rights reserved.
//

import Foundation
import Cocoa

class Settings {
    
    var promptText: String? {
        var prompt = UserDefaults.standard.string(forKey: "p")
        if (prompt != nil) {
            prompt = prompt! + ":"
        }
        return prompt
    }
    
    var font: NSFont? {
        let fn = UserDefaults.standard.string(forKey: "fn")
        let fs = UserDefaults.standard.integer(forKey: "fs")
        let fontSize = fs == 0 ? 14 : CGFloat(fs)
        if (fn == nil) {
            return NSFont.systemFont(ofSize: fontSize)
        }
        return NSFont(name: fn!, size: fontSize)
    }
    
    var windowPadding: CGFloat {
        let val = UserDefaults.standard.integer(forKey: "pd")
        return val == 0 ? 12 : CGFloat(val)
    }
    
    var windowHeight: CGFloat {
        let val = UserDefaults.standard.integer(forKey: "h")
        return val == 0 ? 310 : CGFloat(val)
    }
    
    var windowWidth: CGFloat {
        let val = UserDefaults.standard.integer(forKey: "w")
        return val == 0 ? 500 : CGFloat(val)
    }
}

let settings = Settings()
