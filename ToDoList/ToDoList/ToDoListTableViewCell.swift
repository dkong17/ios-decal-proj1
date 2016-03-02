//
//  ToDoListTableViewCell.swift
//  ToDo
//
//  Created by David Kong on 2/27/16.
//  Copyright © 2016 David Kong. All rights reserved.
//

import UIKit

class ToDoListTableViewCell: UITableViewCell {
    @IBOutlet weak var toDoLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
