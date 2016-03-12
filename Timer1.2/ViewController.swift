//
//  ViewController.swift
//  Timer1.2
//
//  Created by Chris Shaughnessy on 3/11/16.
//  Copyright © 2016 Webified Design. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var timer = NSTimer()
    let timeInterval = 0.05
    var timerEnd:NSTimeInterval = 0.0 //seconds to end the timer
    var timeCount:NSTimeInterval = 0.0 // counter for the timer
    
    var baseArray: [TimerModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableView.delegate = self
        tableView.dataSource = self
        
        let timer1 = TimerModel(duration: [3, 35, 0], title: "First Timer", color: UIColor(red:0.15, green:0.5, blue:0.8, alpha:1))
        let timer2 = TimerModel(duration: [1, 20, 0], title: "Second Timer", color: UIColor(red:0.79, green:0.32, blue:0.27, alpha:1))
        
        baseArray += [timer1, timer2]
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    

}

extension ViewController: UITableViewDelegate {
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
//        var currentTimer = baseArray[indexPath.row]
//        
//        let cell: TimerTableViewCell = tableView.dequeueReusableCellWithIdentifier("Cell") as! TimerTableViewCell
//        
//        if !timer.valid {
//            
//            timer = NSTimer.scheduledTimerWithTimeInterval(timeInterval, target: self, selector: "timerDidEnd", userInfo: nil, repeats: true)
//        }
//        else {
//            timer.invalidate()
//        }
//
//        func timeString(time: NSTimeInterval) -> String {
//            let minutes = Int(time) / 60
//            let seconds = time - Double(minutes) * 60
//            let secondsFraction = seconds - Double(Int(seconds))
//            return "\(minutes):\(Int(seconds)):\(Int(secondsFraction * 10.0))0"
//        }
//        
//        func timerDidEnd() {
//            
//            //timer that counts down
//            timeCount = timeCount - timeInterval
//            if timeCount <= 0 {  //test for target time reached.
//                cell.timerDurationLabel.text = "Done!"
//                timer.invalidate()
//            } else { //update the time on the clock if not reached
//                cell.timerDurationLabel.text = timeString(timeCount)
//            }
//        }
        
    }
    
}

extension ViewController: UITableViewDataSource {
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let currentTimer = baseArray[indexPath.row]
        
        let cell: TimerTableViewCell = tableView.dequeueReusableCellWithIdentifier("Cell") as! TimerTableViewCell
        cell.timerTitleLabel.text = currentTimer.title
        cell.timerTitleLabel.textColor = currentTimer.color
        cell.timerDurationLabel.backgroundColor = currentTimer.color
        
        if !timer.valid {
            
            timer = NSTimer.scheduledTimerWithTimeInterval(timeInterval, target: self, selector: "timerDidEnd", userInfo: nil, repeats: true)
        }
        else {
            timer.invalidate()
        }
        
        func timeString(time: NSTimeInterval) -> String {
            let minutes = Int(time) / 60
            let seconds = time - Double(minutes) * 60
            let secondsFraction = seconds - Double(Int(seconds))
            return "\(minutes):\(Int(seconds)):\(Int(secondsFraction * 10.0))0"
        }
        
        timer.invalidate()
        let timerEndDoubleFromArray = (currentTimer.duration[0] * 60) + (currentTimer.duration[1]) + currentTimer.duration[2]
        timerEnd = Double(timerEndDoubleFromArray)
        timeCount = timerEnd
        cell.timerDurationLabel.text = timeString(timeCount)
        
        return cell
    }
}
