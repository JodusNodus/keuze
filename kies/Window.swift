//
//  NSWindowExtension.swift
//  kies
//
//  Created by Thomas Billiet on 08/04/2019.
//  Copyright © 2019 Thomas Billiet. All rights reserved.
//

import Foundation
import Cocoa

class Window: NSWindow {
    override var canBecomeKey: Bool {
        return true
    }
    
    override var canBecomeMain: Bool {
        return true
    }
    
    init() {
        super.init(contentRect: layouts.windowRect, styleMask: .borderless, backing: .buffered, defer: false)
        isOpaque = true
        canHide = false
        isMovable = false
        title = WINDOW_TITLE
        level = NSWindow.Level.floating
        hasShadow = true
        backgroundColor = .clear
        
        let visualEffect = NSVisualEffectView()
        visualEffect.blendingMode = .withinWindow
        visualEffect.state = .active
        visualEffect.material = .appearanceBased
        visualEffect.frame = layouts.windowRect
        contentView = visualEffect
    }
    
    public func showWindow() {
        positionWindowAtCenter()
        makeMain()
        makeKeyAndOrderFront(self)
    }
    
    public func positionWindowAtCenter(){
        let xPos = NSWidth((self.screen?.frame)!)/2 - NSWidth(self.frame)/2
        let yPos = NSHeight((self.screen?.frame)!)/2 - NSHeight(self.frame)/2
        let frame = NSMakeRect(xPos, yPos, NSWidth(self.frame), NSHeight(self.frame))
        self.setFrame(frame, display: true)
    }
}
