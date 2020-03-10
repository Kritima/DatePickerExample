//
//  ViewController.swift
//  DatePickerExample
//
//  Created by Kritima Kukreja on 2020-03-09.
//  Copyright © 2020 Kritima Kukreja. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var textField_Date: UITextField!
    var datePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    func textFieldDidBeginEditing(_textField: UITextField) {
        self.pickUpDate(self.textField_Date)
    }
    
    func pickUpDate(_textField: UITextField)
    {
        
        self.datePicker = UIDatePicker(frame: CGRect(x: 0, y: 0, width: <#T##CGFloat#>, height: <#T##CGFloat#>))
        self.datePicker.datePickerMode = UIDatePicker.Mode.date
        textField_Date.inputView = self.datePicker
        
        // Toolbar
        let toolBar = UIToolbar()
        toolBar.barStyle = .default
        toolBar.isTranslucent = true
        toolBar.tintColor = .red
        toolBar.sizeToFit()
        
        //Adding Button toolbar
        
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(ViewController.doneClick))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(ViewController.cancelClick))
        toolBar.setItems([cancelButton, spaceButton, doneButton] ,animated: false)
        toolBar.isUserInteractionEnabled = true
        textField.inputAccessoryView = toolBar
        
    }
    
    @objc func doneClick()
    {
        let dateFormatter1 = DateFormatter()
        dateFormatter1.dateStyle = .medium
        dateFormatter1.timeStyle = .none
        textField_Date.text = dateFormatter1.string(from: datePicker.date)
        textField_Date.resignFirstResponder()
    }
    
    @objc func cancelClick()
    {
        
    }


}

