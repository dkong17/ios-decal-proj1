//
//  StatsViewController.swift
//  ToDoList
//
//  Created by David Kong on 3/1/16.
//  Copyright © 2016 David Kong. All rights reserved.
//

import UIKit

class StatsViewController: UIViewController {
    
    @IBOutlet weak var taskStatLabel: UILabel!
    
    var stat : Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem
    }
    
    override func viewWillAppear(animated: Bool) {
        taskStatLabel.text = String(stat)
    }
}
