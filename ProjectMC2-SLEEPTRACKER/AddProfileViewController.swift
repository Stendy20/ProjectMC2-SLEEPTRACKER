//
//  AddProfileViewController.swift
//  ProjectMC2-SLEEPTRACKER
//
//  Created by Michael Sanjaya on 18/05/20.
//  Copyright © 2020 Stendy Antonio. All rights reserved.
//

import UIKit

class AddProfileViewController: UIViewController {
    var delegate: profileProtocol?
    
    @IBOutlet weak var firstNameText: UITextField!
    @IBOutlet weak var lastNameText: UITextField!
    @IBOutlet weak var dateOfBirthText: UITextField!
    @IBOutlet weak var createButton: UIButton!
    
    let datePicker = UIDatePicker()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBarController?.tabBar.isHidden = true
        
        
        datePicker.backgroundColor = UIColor.black
        datePicker.setValue(UIColor.white, forKeyPath: "textColor")
        datePicker.datePickerMode = UIDatePicker.Mode.date
        dateOfBirthText.inputView = datePicker
        
        
        let toolBar = UIToolbar()
        toolBar.barStyle = .blackTranslucent
//        toolBar.isTranslucent = true
        toolBar.backgroundColor = UIColor.black
        toolBar.tintColor = UIColor.white
        toolBar.sizeToFit()
        // Adding Button ToolBar
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(AddProfileViewController.doneDate))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(AddProfileViewController.cancelDate))
        toolBar.setItems([cancelButton, spaceButton, doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        dateOfBirthText.inputAccessoryView = toolBar
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
        let firstNameT = firstNameText.text!
        let lastNameT = lastNameText.text!
        let dateOfBirthT = dateOfBirthText.text!
        
        if(firstNameT == "" || lastNameT == "" || dateOfBirthT == ""){
            let alert = UIAlertController(title: "Missing Input", message: "Please input all the details", preferredStyle: .alert)
            let action = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
            alert.addAction(action)
            self.present(alert, animated: true, completion: nil)
        }
        else{
//            clearData(entity: "Profile")
//            retrieveProfile()
            storeProfile(firstName: firstNameT, lastName: lastNameT, dateOfBirth: dateOfBirthT)
//            retrieveProfile()
//            storeProfile(firstName: "A", lastName: "B", dateOfBirth: "01/01/2000")
//            retrieveProfile()
            let alert = UIAlertController(title: "Add Profile Successful", message: "Profile added successfully", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default) {
                UIAlertAction in
                self.delegate?.reloadProfile()
                super.dismiss(animated: true)
            }
            alert.addAction(okAction)
            self.present(alert, animated: true, completion: nil)
        }
        
    }
    
    
    @objc func doneDate() {
        var dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        dateOfBirthText.text = dateFormatter.string(from: datePicker.date)
        
        dateOfBirthText.endEditing(true)
    
    }

    @objc func cancelDate() {
        dateOfBirthText.endEditing(true)
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
