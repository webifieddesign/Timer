//
//  TimerTableViewCell.swift
//  Timer1.2
//
//  Created by Chris Shaughnessy on 3/11/16.
//  Copyright © 2016 Webified Design. All rights reserved.
//

import UIKit

class TimerTableViewCell: UITableViewCell {

    var timer = NSTimer()
    

    @IBOutlet weak var timerTitleLabel: UILabel!
    @IBOutlet weak var timerDurationLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
