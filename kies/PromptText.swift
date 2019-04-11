//
//  KiesPromptText.swift
//  kies
//
//  Created by Thomas Billiet on 08/04/2019.
//  Copyright © 2019 Thomas Billiet. All rights reserved.
//

import Foundation
import Cocoa

class PromptText: NSTextField {
    init(text: String) {
        let stringSize = NSString(string: text).size(withAttributes: [.font: FONT]);
        super.init(frame: NSMakeRect(HEADER_RECT.minX, HEADER_RECT.minY, stringSize.width, HEADER_RECT.height))
        stringValue = text
        isEditable = false
        drawsBackground = false
        isSelectable = false
        bezelStyle = .squareBezel
        font = FONT
        isBordered = false
        autoresizingMask = [NSView.AutoresizingMask.width, NSView.AutoresizingMask.height]
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
