//
//  ViewController.swift
//  flyMe
//
//  Created by Kaleb Kougl on 7/20/18.
//  Copyright © 2018 Kaleb Kougl. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var startDateInputTextField: UITextField!
    
    
    private var datePicker: UIDatePicker?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Initializes a datePicker, sets mode to date
        datePicker = UIDatePicker()
        datePicker?.datePickerMode = .date
        
        //makes a selection handler(aka callback) and dismisses
        datePicker?.addTarget(self, action: #selector(ViewController.dateChanged(datePicker:)), for: .valueChanged)
        
        //if someone taps away
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(ViewController.viewTapped(gestureRecognizer:)))
        
        view.addGestureRecognizer(tapGesture)
        
        //sets outlet to value of date picker
        startDateInputTextField.inputView = datePicker
    }
    
    @objc func viewTapped(gestureRecognizer: UITapGestureRecognizer){
        
        view.endEditing(true)
    }
    
    @objc func dateChanged(datePicker: UIDatePicker) {
        
        //This makes the date formatted nicely
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
        
        //assigns the date to the text field
        startDateInputTextField.text = dateFormatter.string(from: datePicker.date)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

