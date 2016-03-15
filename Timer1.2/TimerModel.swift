//
//  TimerModel.swift
//  Timer1.2
//
//  Created by Chris Shaughnessy on 3/11/16.
//  Copyright © 2016 Webified Design. All rights reserved.
//

import Foundation
import UIKit

struct TimerModel {
    var duration: [Int]
    var title: String
    var color: UIColor
    var timer: NSTimer
    var isRunning: Bool
    var timerEnd:NSTimeInterval //seconds to end the timer
    var timeCount:NSTimeInterval// counter for the timer
    
    init(duration: [Int], title: String, color: UIColor, timer: NSTimer = NSTimer(), timerEnd: NSTimeInterval = 0.0, timeCount: NSTimeInterval = 0.0) {
        self.duration = duration
        self.title = title
        self.color = color
        self.timer = timer
        self.isRunning = false
        self.timerEnd = timerEnd
        self.timeCount = Double((duration[0] * 3600) + (duration[1] * 60) + duration[2])
    }
    
    func timeString(time: NSTimeInterval) -> String {
        let hours = time / 3600.0
        let minutes = (time / 60.0) % 60
        let seconds = time % 60
        var stringHours = "\(Int(hours))"
        var stringMinutes = "\(Int(minutes))"
        var stringSeconds = "\(Int(seconds))"
        
        if hours < 10.0 {
            stringHours = "0\(Int(hours))"
        }
        if minutes < 10.0 {
            stringMinutes = "0\(Int(minutes))"
        }
        if seconds < 10.0 {
            stringSeconds = "0\(Int(seconds))"
        }

        return "\(stringHours):\(stringMinutes):\(stringSeconds)"
    }
    
    func resetTimeCountToDuration(duration: [Int]) -> NSTimeInterval {
        return Double((duration[0] * 3600) + (duration[1] * 60) + duration[2])
    }
    
    
}