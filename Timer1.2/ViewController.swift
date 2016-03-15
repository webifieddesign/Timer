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
    
    let timeInterval = 1.0
    
    var baseArray: [TimerModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableView.delegate = self
        tableView.dataSource = self
        
        let timer1 = TimerModel(duration: [0, 0, 5], title: "First Timer", color: UIColor(red:0.15, green:0.5, blue:0.8, alpha:1))
        let timer2 = TimerModel(duration: [1, 20, 15], title: "Second Timer", color: UIColor(red:0.79, green:0.32, blue:0.27, alpha:1))
        let timer3 = TimerModel(duration: [4, 25, 0], title: "Third Timer", color: UIColor(red:0.23, green:0.81, blue:0.47, alpha:1))
        let timer4 = TimerModel(duration: [0, 36, 46], title: "Orange Timer", color: UIColor(red:1, green:0.58, blue:0, alpha:1))
        
        baseArray += [timer1, timer2, timer3, timer4]
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tick(timer: NSTimer) {
        
        let indexPath = timer.userInfo as! NSIndexPath
        let currentTimer = baseArray[indexPath.row]
        
        let cell = tableView(tableView, cellForRowAtIndexPath: indexPath) as! TimerTableViewCell
        baseArray[indexPath.row].timeCount -= timeInterval
        
        if baseArray[indexPath.row].timeCount <= 0 {  //test for target time reached.
            cell.timerDurationButton.setTitle("Timer Done", forState: .Normal)
            print("Timer done")
            baseArray[indexPath.row].timer.invalidate()
        } else { //update the time on the clock if not reached
            print("Timer Count: \(currentTimer.timeCount)")
            
            UIView.setAnimationsEnabled(false)
            cell.timerDurationButton.setTitle(currentTimer.timeString(currentTimer.timeCount), forState: .Normal)
        }
    
        tableView.reloadData()
    }
    
    
}

//Mart TimerTableViewCellDelegate
extension ViewController: TimerTableViewCellDelegate {
    
    func startTimer(indexPath: NSIndexPath!) {
        
        print("timer \(indexPath.row) button started")
        baseArray[indexPath.row].timer = NSTimer.scheduledTimerWithTimeInterval(timeInterval, target: self, selector: "tick:", userInfo: indexPath, repeats: true)
        
    }
    
    func stopTimer(indexPath: NSIndexPath!) {
        
        baseArray[indexPath.row].timer.invalidate()
        print("Stop Timer")
    }
    
    func resetTimer(indexPath: NSIndexPath!) {
        print("Reset timer")
        baseArray[indexPath.row].timeCount = baseArray[indexPath.row].resetTimeCountToDuration(baseArray[indexPath.row].duration)
        tableView.reloadData()
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
    
    func tableView(tableView: UITableView, editingStyleForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCellEditingStyle {
        return UITableViewCellEditingStyle.Delete
    }
    
}

//MARK TableViewDataSource
extension ViewController: UITableViewDataSource {
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let currentTimer = baseArray[indexPath.row]
        
        let cell: TimerTableViewCell = tableView.dequeueReusableCellWithIdentifier("Cell") as! TimerTableViewCell
        
        
        cell.timerTitleLabel.text = currentTimer.title
        cell.timerTitleLabel.textColor = currentTimer.color
        cell.timerDurationButton.backgroundColor = currentTimer.color
        cell.timerDurationButton.setTitle(currentTimer.timeString(currentTimer.timeCount), forState: .Normal)
        
        cell.selectionStyle = UITableViewCellSelectionStyle.None
        
        cell.indexPath = indexPath
        cell.delegate = self
        
        return cell
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        
        if editingStyle == UITableViewCellEditingStyle.Delete {
            tableView.beginUpdates()
            baseArray.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic)
            tableView.endUpdates()
        }
        tableView.reloadData()
    }
}
