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
        super.init(frame: layouts.promptRect)
        stringValue = text
        isEditable = false
        drawsBackground = false
        isSelectable = false
        bezelStyle = .squareBezel
        font = settings.font
        isBordered = false
        autoresizingMask = [NSView.AutoresizingMask.width]
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
