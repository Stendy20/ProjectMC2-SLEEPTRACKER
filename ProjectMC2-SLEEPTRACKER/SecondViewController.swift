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
    
    //    var hour = 0
    //    var minute = 0
    //
    //    var totalduration = 0
    //
    //
    //
    //    var hourcurrent = 0
    //    var timecurrent1 = ""
    
    var timevalue = ""
    
    var SendTimeValue = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func SleepTimePickerAction(_ sender: Any) {
        
        let dateformatter = DateFormatter()
        //        let dateformatter1 = DateFormatter()
        //        let dateformatter2 = DateFormatter()
        
        dateformatter.dateFormat = "HH:mm"
        //        dateformatter1.dateFormat = "HH"
        //        dateformatter2.dateFormat = "mm"
        
        timevalue = dateformatter.string(from: SleepTimePicker.date)
        
        //        hour = 60 * Int(dateformatter1.string(from: SleepTimePicker.date))!
        //        minute = Int(dateformatter2.string(from: SleepTimePicker.date))!
        //
        //        totalduration = hour + minute
        //        getCurrentTime()
        
    }
    
    //    @objc func getCurrentTime(){
    //        let timeformatter = DateFormatter()
    //        let timeformatter1 = DateFormatter()
    //
    //        timeformatter.dateFormat = "HH"
    //        timeformatter1.dateFormat = "HH : mm"
    //
    //        hourcurrent = Int(timeformatter.string(from: Date()))!
    //
    //        timecurrent1 = timeformatter1.string(from: Date())
    //    }
    
    @IBAction func StartSleepButton(_ sender: Any) {
        self.SendTimeValue = timevalue
        performSegue(withIdentifier: "time", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        var vc = segue.destination as! OnBoarding3ViewController
        vc.WakeupTime = self.SendTimeValue
    }
    
    //    @objc func CompareTime(){
    //        if(timecurrent1 == timevalue){
    //            timer?.invalidate()
    //
    //            let alert = UIAlertController(title: "Reminder", message: "WAKEUP", preferredStyle: .alert)
    //            let action = UIAlertAction(title: "Ok", style: .cancel)
    //            alert.addAction(action)
    //            self.present(alert, animated: true, completion: nil)
    //
    //        }
    //        getCurrentTime()
    //
    //    }
    //
    
    
    
    
}

