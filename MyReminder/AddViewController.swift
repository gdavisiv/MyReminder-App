//
//  AddViewController.swift
//  MyReminder
//
//  Created by user163072 on 3/26/20.
//  Copyright © 2020 George Davis IV. All rights reserved.
//

import UIKit

class AddViewController: UIViewController {
    
    //Need 3 UI compents
    
    @IBOutlet var titleField: UITextField!
    @IBOutlet var bodyField: UITextField!
    @IBOutlet var datePicker: UIDatePicker!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    //When the user taps this we will validate that there is actual text in
    //Both the title/body field
    @IBAction func didTapSaveButton() {
        
    }
    
}
