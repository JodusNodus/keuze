//
//  Constants.swift
//  kies
//
//  Created by Thomas Billiet on 08/04/2019.
//  Copyright © 2019 Thomas Billiet. All rights reserved.
//

import Foundation
import Cocoa

let WINDOW_TITLE = "Kies"
let FONT_SIZE: CGFloat = 12;
let FONT = NSFont(name: "Monaco", size: FONT_SIZE)!
let FONT_HEIGHT = FONT.boundingRectForFont.height

let WINDOW_RECT = NSMakeRect(0, 0, 500, 300)
let HEADER_RECT = NSMakeRect(0, WINDOW_RECT.height - FONT_HEIGHT, WINDOW_RECT.width, FONT_HEIGHT)
let LIST_RECT = NSMakeRect(0, 0, WINDOW_RECT.width, WINDOW_RECT.height - HEADER_RECT.height)
let LIST_ROW_HEIGHT = FONT_HEIGHT

let LIST_COL_ID = NSUserInterfaceItemIdentifier(rawValue: "column");
