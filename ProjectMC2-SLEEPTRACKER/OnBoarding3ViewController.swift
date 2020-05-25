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
    
    var hour = 0
    var minutes = 0
    var totaltimeinsec = 0
        
    @IBOutlet weak var SleepTimePickerOutlet: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        SleepTimePickerOutlet.setValue(UIColor.white, forKeyPath: "textColor")
        
    }
    
    @IBAction func SleepTimePickerAction(_ sender: Any) {
        let dateformatter = DateFormatter()
        let dateformatter1 = DateFormatter()
        let dateformatter2 = DateFormatter()
        
        dateformatter.dateFormat = "HH:mm"
        dateformatter1.dateFormat = "HH"
        dateformatter2.dateFormat = "mm"
        
        timevalue1 = dateformatter.string(from: SleepTimePickerOutlet.date)
        hour = Int(dateformatter1.string(from: SleepTimePickerOutlet.date))!
        minutes = Int(dateformatter2.string(from: SleepTimePickerOutlet.date))!
        
        totaltimeinsec = (((hour * 60) + minutes) - 30) * 60
    }
    
    @IBAction func SleepTimeButtonAction(_ sender: Any) {
        
        storeTime(sleepTime: timevalue1, wakeUpTime: WakeupTime)
        print("SleepTime : \(timevalue1) wakeuptime : \(WakeupTime)")
        
        let center = UNUserNotificationCenter.current()
        
        center.requestAuthorization(options: [.alert, .sound]){
            (granted, error) in
        }
        
        let content = UNMutableNotificationContent()
        content.title = "Sleeper Apps"
        content.body = "Its 30 Min Before Your Sleeping Time, Open Sleeper Apps Now"
        
        let date = Date().addingTimeInterval(TimeInterval(totaltimeinsec))
        
        let datecomponent = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute, .second], from: date)
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: datecomponent, repeats: false)
        
        let uuidstring = UUID().uuidString
        
        let request = UNNotificationRequest(identifier: uuidstring, content: content, trigger: trigger)
        
        center.add(request){(error) in
            
        }
        
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
