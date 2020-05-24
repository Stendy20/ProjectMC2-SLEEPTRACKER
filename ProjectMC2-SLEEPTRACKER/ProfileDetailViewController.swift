//
//  ProfileDetailViewController.swift
//  ProjectMC2-SLEEPTRACKER
//
//  Created by Michael Sanjaya on 24/05/20.
//  Copyright © 2020 Stendy Antonio. All rights reserved.
//

import UIKit

class ProfileDetailViewController: UIViewController {

    @IBOutlet weak var fullName: UILabel!
    @IBOutlet weak var firstName: UITextField!
    @IBOutlet weak var lastName: UITextField!
    @IBOutlet weak var dateOfBirth: UITextField!
    @IBOutlet weak var editBar: UIBarButtonItem!
    
    let datePicker = UIDatePicker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // date picker
        datePicker.backgroundColor = UIColor.black
        datePicker.setValue(UIColor.white, forKeyPath: "textColor")
        datePicker.datePickerMode = UIDatePicker.Mode.date
        dateOfBirth.inputView = datePicker
        
        // toolbar
        let toolBar = UIToolbar()
                toolBar.barStyle = .blackTranslucent
        //        toolBar.isTranslucent = true
                toolBar.backgroundColor = UIColor.black
                toolBar.tintColor = UIColor.white
                toolBar.sizeToFit()
                // Adding Button ToolBar
                let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(ProfileDetailViewController.doneDate))
                let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
                let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(ProfileDetailViewController.cancelDate))
                toolBar.setItems([cancelButton, spaceButton, doneButton], animated: false)
                toolBar.isUserInteractionEnabled = true
                dateOfBirth.inputAccessoryView = toolBar
        
        // disable input
        firstName.isUserInteractionEnabled = false
        lastName.isUserInteractionEnabled = false
        dateOfBirth.isUserInteractionEnabled = false
        
        // Edit Button
        editBar.target = self
        editBar.action = #selector(addTapped)
//        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Edit", style: .plain, target: self, action: #selector(addTapped))
        
        let profileTemp:profileStruct = retrieveProfile()
        firstName.text = profileTemp.firstName
        lastName.text = profileTemp.lastName
        dateOfBirth.text = profileTemp.dateOfBirth
        fullName.text = "\(profileTemp.firstName) \(profileTemp.lastName)"
        // Do any additional setup after loading the view.
    }
    
    @objc func addTapped(){
        firstName.isUserInteractionEnabled = true
        lastName.isUserInteractionEnabled = true
        dateOfBirth.isUserInteractionEnabled = true
        editBar.title = "Done"
        editBar.action = #selector(done)
    }
    
    @objc func done(){
        let firstNameT = firstName.text!
        let lastNameT = lastName.text!
        let dateOfBirthT = dateOfBirth.text!
        
        if(firstNameT == "" || lastNameT == "" || dateOfBirthT == ""){
            let alert = UIAlertController(title: "Missing Input", message: "Please input all the details", preferredStyle: .alert)
            let action = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
            alert.addAction(action)
            self.present(alert, animated: true, completion: nil)
        }
        else{
            storeProfile(firstName: firstNameT, lastName: lastNameT, dateOfBirth: dateOfBirthT)
            let alert = UIAlertController(title: "Edit Profile Successful", message: "Profile editted successfully", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default) {
                UIAlertAction in
                super.dismiss(animated: true)
            }
            alert.addAction(okAction)
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    @objc func doneDate(){
        var dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        dateOfBirth.text = dateFormatter.string(from: datePicker.date)
        
        dateOfBirth.endEditing(true)
    }
    
    @objc func cancelDate(){
        dateOfBirth.endEditing(true)
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
