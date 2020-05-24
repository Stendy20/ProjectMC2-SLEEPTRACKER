//
//  ProfileDetailViewController.swift
//  ProjectMC2-SLEEPTRACKER
//
//  Created by Michael Sanjaya on 24/05/20.
//  Copyright © 2020 Stendy Antonio. All rights reserved.
//

import UIKit

class ProfileDetailViewController: UIViewController {

    @IBOutlet weak var firstName: UITextField!
    @IBOutlet weak var lastName: UITextField!
    @IBOutlet weak var dateOfBirth: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let profileTemp:profileStruct = retrieveProfile()
        firstName.text = profileTemp.firstName
        lastName.text = profileTemp.lastName
        dateOfBirth.text = profileTemp.dateOfBirth
        // Do any additional setup after loading the view.
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
