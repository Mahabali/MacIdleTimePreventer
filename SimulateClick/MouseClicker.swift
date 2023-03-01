//
//  MouseClicker.swift
//  MouseClicker
//
//  Created by mahabali on 01/03/23.
//

import Foundation
import Cocoa

class MouseClicker {
    var timer: Timer?
    let idleThreshold: TimeInterval = 60 // 1 minute
    let clickInterval: TimeInterval = 300 // 5 minutes
    
    func start() {
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            let idleTime = CGEventSource.secondsSinceLastEventType(.combinedSessionState, eventType: .mouseMoved)
            
            if idleTime >= self.idleThreshold {
                let mouse = CGEventSource(stateID: .hidSystemState)
                
                let mouseClick = CGEvent(mouseEventSource: mouse, mouseType: .rightMouseDown, mouseCursorPosition: CGPoint(x: 400, y: 400), mouseButton: .right)
                mouseClick?.post(tap: .cghidEventTap)
                let mouseRelease = CGEvent(mouseEventSource: mouse, mouseType: .rightMouseUp, mouseCursorPosition: CGPoint(x: 400, y: 400), mouseButton: .right)
                mouseRelease?.post(tap: .cghidEventTap)
                
                self.timer?.invalidate()
                self.timer = Timer.scheduledTimer(withTimeInterval: self.clickInterval, repeats: true) { _ in
                    self.start()
                    //print("clicking now");
                }
                self.timer?.fire()
            }
        }
    }
}


