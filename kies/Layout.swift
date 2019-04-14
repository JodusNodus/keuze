//
//  Layout.swift
//  keuze
//
//  Created by Thomas Billiet on 14/04/2019.
//  Copyright © 2019 Thomas Billiet. All rights reserved.
//

import Foundation

class Layout {
    let DIVIDER_HEIGHT: CGFloat = 9
    
    var lineHeight: CGFloat {
        return ceil(NSString(string: "TEST").size(withAttributes: [.font: settings.font]).height) + 0;
    }
    
    var windowRect: NSRect {
        return NSMakeRect(0, 0, settings.windowWidth, settings.windowHeight)
    }
    
    var containerRect: NSRect {
        return NSMakeRect(settings.windowPadding, settings.windowPadding, windowRect.width - settings.windowPadding * 2, windowRect.height - settings.windowPadding * 2)
    }
    
    var listRect: NSRect {
        return NSMakeRect(containerRect.minX, containerRect.minY, containerRect.width, containerRect.height - lineHeight - DIVIDER_HEIGHT)
    }
    
    var dividerRect: NSRect {
        return NSMakeRect(containerRect.minX, listRect.maxY + DIVIDER_HEIGHT / 2, containerRect.width, 1)
    }
    
    var promptRect: NSRect {
        let stringWidth = ceil(NSString(string: settings.promptText!).size(withAttributes: [.font: settings.font]).width) + 4;
        return NSMakeRect(containerRect.minX, containerRect.maxY - lineHeight, stringWidth, lineHeight)
    }
    
    var inputRect: NSRect {
        return NSMakeRect(promptRect.maxX, containerRect.maxY - lineHeight, containerRect.width - promptRect.width, lineHeight)
    }
}

let layouts = Layout()
