//
//  ToDoTask.swift
//  ToDoList
//
//  Created by David Kong on 2/28/16.
//  Copyright © 2016 David Kong. All rights reserved.
//

import UIKit

var taskList: ToDoTask = ToDoTask()

struct tasks {
    var item: String
    var complete: Bool
    mutating func flip() {
        complete = !complete
    }
}

class ToDoTask: NSObject {
    var taskArray = [tasks]()
    
    func addTask(task: String) {
        taskArray.append(tasks(item: task, complete: false))
    }
}
