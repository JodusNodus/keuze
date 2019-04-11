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
    var appDelegate: AppDelegate!
    
    init(width: CGFloat, offsetY: CGFloat, appDelegate: AppDelegate) {
        super.init(frame: NSMakeRect(HEADER_RECT.minX + offsetY, HEADER_RECT.minY, width, HEADER_RECT.height))
        self.appDelegate = appDelegate
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
        allowsEditingTextAttributes = false
        isAutomaticTextCompletionEnabled = false
        allowsDefaultTighteningForTruncation = false
        maximumNumberOfLines = 1
        usesSingleLineMode = true
        cell?.wraps = false
        cell?.isScrollable = true
        autoresizingMask = [NSView.AutoresizingMask.width, NSView.AutoresizingMask.height]
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func control(_ control: NSControl, textView: NSTextView, doCommandBy commandSelector: Selector) -> Bool {
        if (commandSelector == #selector(NSStandardKeyBindingResponding.cancelOperation(_:))){
            appDelegate.cancel()
            return true
        }
        if (commandSelector == #selector(NSStandardKeyBindingResponding.insertNewline(_:))){
            appDelegate.handleSelect()
            return true
        }
        if (commandSelector == #selector(NSStandardKeyBindingResponding.moveUp(_:))){
            appDelegate.handleMoveUp()
            return true
        }
        if (commandSelector == #selector(NSStandardKeyBindingResponding.moveDown(_:))){
            appDelegate.handleMoveDown()
            return true
        }
        if (commandSelector == #selector(NSStandardKeyBindingResponding.insertTab(_:))){
            return true
        }
        return false
    }
    
    func controlTextDidChange(_ obj: Notification) {
        appDelegate.handleInputChange(input: stringValue)
    }
}
