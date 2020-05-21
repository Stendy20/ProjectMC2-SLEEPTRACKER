//
//  AddProfileViewController.swift
//  ProjectMC2-SLEEPTRACKER
//
//  Created by Michael Sanjaya on 18/05/20.
//  Copyright © 2020 Stendy Antonio. All rights reserved.
//

import UIKit

class AddProfileViewController: UIViewController {

    @IBOutlet weak var firstNameText: UITextField!
    @IBOutlet weak var lastNameText: UITextField!
    @IBOutlet weak var createButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBarController?.tabBar.isHidden = true
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // Hide the Navigation Bar
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    // unhide navigation bar
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        // Show the Navigation Bar
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    @IBAction func backButtonAction(_ sender: Any) {
        dismiss(animated: true)
    }
    @IBAction func createButtonAction(_ sender: Any) {
//        print("a")
//        storeProfile(firstName: "Michael", lastName: "Sanjaya", dateOfBirth: "27/01/1998")
//        retrieveProfile()
//        storeTime(sleepTime: "2100", wakeUpTime: "1000")
//        retrieveTime()
//        storeSleep(date: "02/01/2000", sleepTime: "02:00", wakeUpTime: "13:00", duration: 600)
//        retrieveSleep()
//        clearData(entity: "Sleep")
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
