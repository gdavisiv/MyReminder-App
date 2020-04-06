//
//  ViewController.swift
//  MyReminder
//
//  Created by GdavisIV on 3/26/20.
//  Copyright © 2020 George Davis IV. All rights reserved.
//
//Imports the library for User Notifications : scheduling/authorizing permission/etc
import UserNotifications
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
    
    //Since we have two buttons we need two actions
    @IBAction func didTapAdd() {
        //show add vc
    }
    
    @IBAction func didTapTest() {
        //Fire Test Notification which will send out an alet, badge, and sound
        //Completion handler
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound], completionHandler: { success, error in
            //If we have succeed then lets schedule the test, else say we have an error occured
            if success {
                //Calls schedule test
                self.scheduleTest()
            }
            else if let error = error {
                //Prints out error occured
                print("error occured")
            }
        })
    }
    
    //To create a notification it contains three main pieces
    //Request which is sent to the user notification sender
    //Notification has a content parameter : title/body/sound
    //Trigger : Date/Location/
    func scheduleTest() {
        //Create a content object
        let content = UNMutableNotificationContent()
        content.title = "Hello World"
        content.sound = .default
        content.body = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."
        
        //Trigger: Going to use Date
        //And add on 10 second to the current date so : Run in 10 secs
        let targetDate = Date().addingTimeInterval(10)
        //We want swift to take into account each component year/month/day/hour/etc/etc
        let trigger = UNCalendarNotificationTrigger(dateMatching: Calendar.current.dateComponents([.year, .month, .day, .hour, .minute, .second], from: targetDate), repeats: false)
        //
        let request = UNNotificationRequest(identifier: "some_long_id", content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request, withCompletionHandler: { error in
            if error != nil {
                print("Something went wrong?!")
            }
        })
    }
}

extension ViewController: UITableViewDelegate {
    //Implement our basic tableview functions
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension ViewController: UITableViewDataSource {
    //Create the Data Source
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = models[indexPath.row].title
        
        return cell
    }
}

//
struct MyReminder {
    let title: String
    let date: Date
    let indentifier: String
}
