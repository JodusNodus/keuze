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
let FONT_SIZE: CGFloat = 14
let FONT = NSFont.systemFont(ofSize: FONT_SIZE)
let FONT_HEIGHT = FONT.boundingRectForFont.height

let WINDOW_RECT = NSMakeRect(0, 0, 500, 300)
let WINDOW_PADDING: CGFloat = 10

let CONTAINER_RECT = NSMakeRect(WINDOW_PADDING, WINDOW_PADDING, WINDOW_RECT.width - WINDOW_PADDING * 2, WINDOW_RECT.height - WINDOW_PADDING * 2)

let HEADER_HEIGHT: CGFloat = FONT_HEIGHT

let LIST_RECT = NSMakeRect(CONTAINER_RECT.minX, CONTAINER_RECT.minY, CONTAINER_RECT.width, CONTAINER_RECT.height - HEADER_HEIGHT - DIVIDER_PADDING * 2)
let LIST_ROW_HEIGHT = FONT_HEIGHT

let DIVIDER_PADDING: CGFloat = 4
let DIVIDER_RECT = NSMakeRect(CONTAINER_RECT.minX, LIST_RECT.maxY + DIVIDER_PADDING, CONTAINER_RECT.width, 1)

let HEADER_RECT = NSMakeRect(CONTAINER_RECT.minX, DIVIDER_RECT.maxY + DIVIDER_PADDING, CONTAINER_RECT.width, HEADER_HEIGHT)



let LIST_COL_ID = NSUserInterfaceItemIdentifier(rawValue: "column");
