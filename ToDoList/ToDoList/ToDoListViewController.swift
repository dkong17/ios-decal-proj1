//
//  ToDoListViewController.swift
//  ToDo
//
//  Created by David Kong on 2/27/16.
//  Copyright © 2016 David Kong. All rights reserved.
//

import UIKit

var numCompleteTasks: Int = 0

class ToDoListViewController: UITableViewController {

    @IBOutlet weak var addButton: UIBarButtonItem!
    @IBOutlet var toDoTableView: UITableView!
    @IBOutlet weak var statsBarButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NSTimer.scheduledTimerWithTimeInterval(40, target: self, selector: Selector("prune"),
            userInfo: nil, repeats: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return taskList.taskArray.count
    }
    
    /** Grab the cell we need */
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("ToDoCell", forIndexPath: indexPath) as! ToDoListTableViewCell
        let cellTask = taskList.taskArray[indexPath.row]
        cell.toDoLabel.text = cellTask.item;
        if cellTask.complete {
            cell.accessoryType = .Checkmark
        }
        else {
            cell.accessoryType = .None
        }
        return cell
    }
    
    /** Handle taps on cells */
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if taskList.taskArray[indexPath.row].complete {
            tableView.cellForRowAtIndexPath(indexPath)?.accessoryType = .None
            numCompleteTasks -= 1
        }
        else {
            tableView.cellForRowAtIndexPath(indexPath)?.accessoryType = .Checkmark
            numCompleteTasks += 1
        }
        taskList.taskArray[indexPath.row].flip()
        tableView.cellForRowAtIndexPath(indexPath)?.selected = false
    }
    
    /** Edit (delete) support */
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            taskList.taskArray.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        }
    }
    
    /** Handle segue back from adding */
    @IBAction func unwindToDoListViewController(segue: UIStoryboardSegue) {
        if let sourceViewController = segue.sourceViewController as? AddItemViewController, itemString = sourceViewController.buffer {
            let newIndexPath = NSIndexPath(forRow: taskList.taskArray.count, inSection: 0)            
            taskList.addTask(itemString)
            toDoTableView.insertRowsAtIndexPaths([newIndexPath], withRowAnimation: .Bottom)
        }
    }
    
    /** Segue into the stats view */
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if statsBarButton === sender {
            let destViewController = segue.destinationViewController as? StatsViewController
            destViewController?.stat = numCompleteTasks
        }
    }
    
    func prune() {
        // Set the num of completed tasks to 0 when we clear after 24 hours
        numCompleteTasks = 0;
        for index in (taskList.taskArray.count-1).stride(through: 0, by: -1) {
            if taskList.taskArray[index].complete == true {
                taskList.taskArray.removeAtIndex(index)
            }
        }
        toDoTableView.reloadData()
    }
}
