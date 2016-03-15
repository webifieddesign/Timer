//
//  TimerTableViewCell.swift
//  Timer1.2
//
//  Created by Chris Shaughnessy on 3/11/16.
//  Copyright © 2016 Webified Design. All rights reserved.
//

import UIKit

protocol TimerTableViewCellDelegate {
    func startTimer(indexPath: NSIndexPath!)
    func stopTimer(indexPath: NSIndexPath!)
    func resetTimer(indexPath: NSIndexPath!)
}

class TimerTableViewCell: UITableViewCell {

    var timer = NSTimer()
    
    var indexPath: NSIndexPath!
    var delegate: TimerTableViewCellDelegate?
    var timerStarted = false

    @IBOutlet weak var timerTitleLabel: UILabel!
    @IBOutlet weak var timerDurationButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        let longPressGesture = UILongPressGestureRecognizer(target: self, action: "longPress:")
        self.timerDurationButton.addGestureRecognizer(longPressGesture)
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func timerDurationButtonPressed(sender: UIButton) {
                
        if !timerStarted {
            delegate?.startTimer(indexPath)
            timerStarted = !timerStarted
        }
        else {
            delegate?.stopTimer(indexPath)
            timerStarted = !timerStarted
        }
    }
    
    func longPress(longPressGestureRecognizer: UILongPressGestureRecognizer) {
        delegate?.resetTimer(indexPath)
    }
    
}
