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
    
    init(duration: [Int], title: String, color: UIColor) {
        self.duration = duration
        self.title = title
        self.color = color
    }
}