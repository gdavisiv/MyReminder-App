//
//  ViewController.swift
//  MyReminder
//
//  Created by user163072 on 3/26/20.
//  Copyright © 2020 George Davis IV. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //Setting up the table View
    @IBOutlet var table: UITableView!
    
    // Variable models will hold an array myReminders and start off Empty
    var models = [MyReminder]()

    override func viewDidLoad() {
        super.viewDidLoad()
        table.delegate = self
        table.dataSource = self

    }
}

extension ViewController: UITableViewDelegate {
    //Implement our basic tableview functions
    
}

extension ViewController: UITableViewDataSource {
    
}

//
struct MyReminder {
    let title: String
    let date: Date
    let indentifier: String
}
