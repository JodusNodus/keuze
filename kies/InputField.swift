//
//  KiesInputField.swift
//  kies
//
//  Created by Thomas Billiet on 08/04/2019.
//  Copyright © 2019 Thomas Billiet. All rights reserved.
//

import Foundation
import Cocoa

class InputField: NSTextField, NSTextFieldDelegate {
    init(width: CGFloat, offsetY: CGFloat) {
        super.init(frame: NSMakeRect(HEADER_RECT.minX + offsetY, HEADER_RECT.minY, width, HEADER_RECT.height))
        stringValue = ""
        isEditable = true
        isSelectable = true
        delegate = self
        bezelStyle = .squareBezel
        isBordered = false
        drawsBackground = false
        focusRingType = .none
        target = self
        font = FONT
        cell?.wraps = false
        autoresizingMask = [NSView.AutoresizingMask.width, NSView.AutoresizingMask.height]
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
