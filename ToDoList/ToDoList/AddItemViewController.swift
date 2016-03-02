//
//  AddItemViewController.swift
//  ToDo
//
//  Created by David Kong on 2/27/16.
//  Copyright © 2016 David Kong. All rights reserved.
//

import UIKit

class AddItemViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var itemTextField: UITextField!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    @IBOutlet weak var cancelButton: UIBarButtonItem!
    
    var buffer: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if itemTextField.text?.isEmpty == true {
            saveButton.enabled = false
        }
        buffer = nil
        itemTextField.becomeFirstResponder()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if cancelButton === sender {
            buffer = nil
        }
        else {
            buffer = itemTextField.text
        }
        itemTextField.text = nil
    }
    
    @IBAction func editDidChange(sender: AnyObject) {
        if itemTextField.text?.isEmpty == true {
            saveButton.enabled = false
        }
        else {
            saveButton.enabled = true
        }
    }
}
