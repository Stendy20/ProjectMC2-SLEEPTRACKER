//
//  SecondViewController.swift
//  ProjectMC2-SLEEPTRACKER
//
//  Created by Stendy Antonio on 05/05/20.
//  Copyright © 2020 Stendy Antonio. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet weak var SleepTimePicker: UIDatePicker!
    @IBOutlet weak var StartSleepButton: UIButton!
    
    var timer: Timer?
    
    var hour = 0
    
    var hourcurrent = 0
    var timecurrent1 = ""
    var timevalue = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        SleepTimePicker.setValue(UIColor.red, forKeyPath: "textColor")
        
    }
    
    @IBAction func SleepTimePickerAction(_ sender: Any) {
        
        let dateformatter = DateFormatter()
        let dateformatter1 = DateFormatter()
        
        dateformatter.dateFormat = "HH : mm"
        dateformatter1.dateFormat = "HH"
        
        timevalue = dateformatter.string(from: SleepTimePicker.date)
        
        hour = Int(dateformatter1.string(from: SleepTimePicker.date))!
        
        getCurrentTime()
        
    }
    
    @objc func getCurrentTime(){
        let timeformatter = DateFormatter()
        let timeformatter1 = DateFormatter()
        
        timeformatter.dateFormat = "HH"
        timeformatter1.dateFormat = "HH : mm"
        
        hourcurrent = Int(timeformatter.string(from: Date()))!
        
        timecurrent1 = timeformatter1.string(from: Date())
    }
    
    @IBAction func StartSleepButton(_ sender: Any) {
          timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(CompareTime), userInfo: nil, repeats: true)
      }
    
    @objc func CompareTime(){
        if(timecurrent1 == timevalue){
            timer?.invalidate()

            let alert = UIAlertController(title: "Reminder", message: "WAKEUP", preferredStyle: .alert)
            let action = UIAlertAction(title: "Ok", style: .cancel)
            alert.addAction(action)
            self.present(alert, animated: true, completion: nil)
            
        }
        getCurrentTime()
        
    }
    
    
  
    
    
}

