//
//  AddViewController.swift
//  MyReminder
//
//  Created by user163072 on 3/26/20.
//  Copyright © 2020 George Davis IV. All rights reserved.
//

import UIKit

class AddViewController: UIViewController, UITextFieldDelegate {
    
    //Need 3 UI compents
    
    @IBOutlet var titleField: UITextField!
    @IBOutlet var bodyField: UITextField!
    @IBOutlet var datePicker: UIDatePicker!
    
    public var completion: ((String, String, Date) -> Void)?

    override func viewDidLoad() {
        super.viewDidLoad()
        titleField.delegate = self
        bodyField.delegate = self
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .done, target: self, action: #selector(didTapSaveButton))
    }
    //When the user taps this we will validate that there is actual text in
    //Both the title/body field
    @objc func didTapSaveButton() {
        if let titleText = titleField.text, !titleText.isEmpty,
            let bodyText = bodyField.text, !bodyText.isEmpty {
                
            let targetDate = datePicker.date
            
            
            completion?(titleText, bodyText, targetDate)
        }
    }
    //This will get our keyboard dismissed when we are focused on the date wheel
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
