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
    
    let timeInterval = 0.05
    
    var baseArray: [TimerModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableView.delegate = self
        tableView.dataSource = self
        
        let timer1 = TimerModel(duration: [0, 10, 0], title: "First Timer", color: UIColor(red:0.15, green:0.5, blue:0.8, alpha:1))
        let timer2 = TimerModel(duration: [1, 20, 0], title: "Second Timer", color: UIColor(red:0.79, green:0.32, blue:0.27, alpha:1))
        let timer3 = TimerModel(duration: [4, 25, 0], title: "Third Timer", color: UIColor(red:0.23, green:0.81, blue:0.47, alpha:1))
        let timer4 = TimerModel(duration: [0, 36, 0], title: "Orange Timer", color: UIColor(red:1, green:0.58, blue:0, alpha:1))
        
        baseArray += [timer1, timer2, timer3, timer4]
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tick(timer: NSTimer) {
            
        var timeCount = timer.userInfo as! Double
        
    //    var currentTimer = baseArray[indexPath!.row]

        timeCount -= timeInterval
        
        if timeCount <= 0 {  //test for target time reached.
            print("Timer = 0")
            timer.invalidate()
        } else { //update the time on the clock if not reached
            print("Timer Count: \(timeCount)")
        }

    }
    
}

//Mart TimerTableViewCellDelegate
extension ViewController: TimerTableViewCellDelegate {
    
    func startTimer(indexPath: NSIndexPath!) {
        print("timer \(indexPath.row) button started")
        
        var currentTimer = baseArray[indexPath.row]
        
        currentTimer.timeCount = Double((currentTimer.duration[0] * 60) + (currentTimer.duration[1]) + currentTimer.duration[2])
        
        currentTimer.timer = NSTimer.scheduledTimerWithTimeInterval(timeInterval, target: self, selector: "tick:", userInfo: currentTimer.timeCount, repeats: true)
    }
    
    func stopTimer(indexPath: NSIndexPath!) {
        
        let currentTimer = baseArray[indexPath.row]
        
        print("Stop Timer")
        currentTimer.timer.invalidate()
        
    }
}

//MARK TableViewDelegate
extension ViewController: UITableViewDelegate {
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return baseArray.count
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
}

extension ViewController: UITableViewDataSource {
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var currentTimer = baseArray[indexPath.row]
        
        let cell: TimerTableViewCell = tableView.dequeueReusableCellWithIdentifier("Cell") as! TimerTableViewCell
        
        
        cell.timerTitleLabel.text = currentTimer.title
        cell.timerTitleLabel.textColor = currentTimer.color
        cell.timerDurationButton.backgroundColor = currentTimer.color
        
        
        currentTimer.timeCount = Double((currentTimer.duration[0] * 60) + (currentTimer.duration[1]) + currentTimer.duration[2])
        cell.timerDurationButton.setTitle(currentTimer.timeString(currentTimer.timeCount), forState: .Normal)
        
        cell.selectionStyle = UITableViewCellSelectionStyle.None
        
        cell.indexPath = indexPath
        cell.delegate = self
        
        return cell
    }
}
