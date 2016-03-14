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
    var timerEnd:NSTimeInterval //seconds to end the timer
    var timeCount:NSTimeInterval// counter for the timer
    
    init(duration: [Int], title: String, color: UIColor, timer: NSTimer = NSTimer(), timerEnd: NSTimeInterval = 0.0, timeCount: NSTimeInterval = 0.0) {
        self.duration = duration
        self.title = title
        self.color = color
        self.timer = timer
        self.timerEnd = timerEnd
        self.timeCount = timeCount
    }
    
    func timeString(time: NSTimeInterval) -> String {
        let minutes = Int(time) / 60
        let seconds = time - Double(minutes) * 60
        let secondsFraction = seconds - Double(Int(seconds))
        return "\(minutes):\(Int(seconds)):\(Int(secondsFraction * 10.0))0"
    }
    
    
}