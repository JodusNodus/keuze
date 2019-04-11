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
        let stringSize = ceil(NSString(string: text).size(withAttributes: [.font: FONT]).width) + 4;
        super.init(frame: NSMakeRect(HEADER_RECT.minX, HEADER_RECT.minY, stringSize, HEADER_RECT.height))
        stringValue = text
        isEditable = false
        drawsBackground = false
        isSelectable = false
        bezelStyle = .squareBezel
        font = FONT
        isBordered = false
        usesSingleLineMode = true
        autoresizingMask = [NSView.AutoresizingMask.width, NSView.AutoresizingMask.minYMargin]
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
