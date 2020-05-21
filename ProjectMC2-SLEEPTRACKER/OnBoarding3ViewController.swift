//
//  OnBoarding3ViewController.swift
//  ProjectMC2-SLEEPTRACKER
//
//  Created by Stendy Antonio on 18/05/20.
//  Copyright © 2020 Stendy Antonio. All rights reserved.
//

import UIKit

class OnBoarding3ViewController: UIViewController {
    
    var WakeupTime = ""
    var timevalue1 = ""
    
    @IBOutlet weak var SleepTimePickerOutlet: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    @IBAction func SleepTimePickerAction(_ sender: Any) {
        let dateformatter = DateFormatter()
        //        let dateformatter1 = DateFormatter()
        
        dateformatter.dateFormat = "HHmm"
        //        dateformatter1.dateFormat = "HH"
        
        timevalue1 = dateformatter.string(from: SleepTimePickerOutlet.date)
    }
    
    @IBAction func SleepTimeButtonAction(_ sender: Any) {
        
        storeTime(sleepTime: timevalue1, wakeUpTime: WakeupTime)
        print("SleepTime : \(timevalue1) wakeuptime : \(WakeupTime)")
        
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
