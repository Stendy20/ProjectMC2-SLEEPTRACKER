//
//  FourViewController.swift
//  ProjectMC2-SLEEPTRACKER
//
//  Created by Stendy Antonio on 18/05/20.
//  Copyright © 2020 Stendy Antonio. All rights reserved.
//

import UIKit



class FourViewController: UIViewController {
    //
    //    struct timeStructValue {
    //        var sleepTime: String
    //        var wakeUpTime: String
    //    }
    
    var monday = 0
    var tuesday = 0
    var wednesday = 0
    var thursday = 0
    var friday = 0
    var saturday = 0
    var sunday = 0
    
    var flag = 0
    
    @IBOutlet weak var BedTimeLabel: UILabel!
    @IBOutlet weak var WakeUpLabel: UILabel!
    
    @IBOutlet weak var MondayButton: UIButton!
    @IBOutlet weak var TuesdayButton: UIButton!
    @IBOutlet weak var WednesdayButton: UIButton!
    @IBOutlet weak var ThurdayButton: UIButton!
    @IBOutlet weak var FridayBUtton: UIButton!
    @IBOutlet weak var SaturdayButton: UIButton!
    @IBOutlet weak var SundayButton: UIButton!
    
    @IBOutlet weak var DurationLabel: UILabel!
    
    var hour = retrieveTime().duration / 60
    var minute = retrieveTime().duration % 60
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.hidesBackButton = true

        BedTimeLabel.text = "\(retrieveTime().sleepTime)"
        WakeUpLabel.text = "\(retrieveTime().wakeUpTime)"
        
        if minute != 0{
            DurationLabel.text = "\(hour)h \(minute)m"
        }
        else{
            DurationLabel.text = "\(hour)h"
        }
        
        checkday()
    }
    
    func checkday(){
        if retrieveDay().mon == 1 {
            MondayButton.setImage(#imageLiteral(resourceName: "mon_on"), for: .normal)
            monday = 1
        }
        if retrieveDay().tue == 1 {
            TuesdayButton.setImage(#imageLiteral(resourceName: "tue_on"), for: .normal)
            tuesday = 1
        }
        if retrieveDay().wed == 1 {
            WednesdayButton.setImage(#imageLiteral(resourceName: "wed_on"), for: .normal)
            wednesday = 1
        }
        if retrieveDay().thu == 1 {
            ThurdayButton.setImage(#imageLiteral(resourceName: "tue_on"), for: .normal)
            thursday = 1
        }
        if retrieveDay().fri == 1 {
            FridayBUtton.setImage(#imageLiteral(resourceName: "fri_on"), for: .normal)
            friday = 1
        }
        if retrieveDay().sat == 1 {
            SaturdayButton.setImage(#imageLiteral(resourceName: "sun_on"), for: .normal)
            saturday = 1
        }
        if retrieveDay().sun == 1 {
            SundayButton.setImage(#imageLiteral(resourceName: "sun_on"), for: .normal)
            sunday = 1
        }
        
        
    }
    
    @IBAction func MondayButton(_ sender: Any) {
        if flag == 0{
            flag = 1
            MondayButton.setImage(#imageLiteral(resourceName: "mon_on"), for: .normal)
            monday = 1
        }
        else if flag == 1 {
            flag = 0
            MondayButton.setImage(#imageLiteral(resourceName: "mon_off"), for: .normal)
            monday = 0
        }
        storeDay(mon: monday, tue: tuesday, wed: wednesday, thu: thursday, fri: friday, sat: saturday, sun: sunday)
        
    }
    @IBAction func TuesdayButton(_ sender: Any) {
        if flag == 0{
            TuesdayButton.setImage(#imageLiteral(resourceName: "tue_on"), for: .normal)
            flag = 1
            tuesday = 1
        }
        else if flag == 1 {
            TuesdayButton.setImage(#imageLiteral(resourceName: "tue_off"), for: .normal)
            flag = 0
            tuesday = 0
        }
        storeDay(mon: monday, tue: tuesday, wed: wednesday, thu: thursday, fri: friday, sat: saturday, sun: sunday)
        
    }
    @IBAction func WednesdayButton(_ sender: Any) {
        if flag == 0{
            WednesdayButton.setImage(#imageLiteral(resourceName: "wed_on"), for: .normal)
            flag = 1
            wednesday = 1
        }
        else if flag == 1 {
            WednesdayButton.setImage(#imageLiteral(resourceName: "wed_off"), for: .normal)
            flag = 0
            wednesday = 0
        }
        storeDay(mon: monday, tue: tuesday, wed: wednesday, thu: thursday, fri: friday, sat: saturday, sun: sunday)
        
    }
    @IBAction func ThursdayButton(_ sender: Any) {
        if flag == 0{
            ThurdayButton.setImage(#imageLiteral(resourceName: "thu_on"), for: .normal)
            flag = 1
            thursday = 1
        }
        else if flag == 1 {
            ThurdayButton.setImage(#imageLiteral(resourceName: "tue_off"), for: .normal)
            flag = 0
            thursday = 0
        }
        storeDay(mon: monday, tue: tuesday, wed: wednesday, thu: thursday, fri: friday, sat: saturday, sun: sunday)
    }
    @IBAction func FridayButton(_ sender: Any) {
        if flag == 0{
            FridayBUtton.setImage(#imageLiteral(resourceName: "fri_on"), for: .normal)
            flag = 1
            friday = 1
        }
        else if flag == 1 {
            FridayBUtton.setImage(#imageLiteral(resourceName: "fri_off"), for: .normal)
            flag = 0
            friday = 0
        }
        storeDay(mon: monday, tue: tuesday, wed: wednesday, thu: thursday, fri: friday, sat: saturday, sun: sunday)
    }
    @IBAction func SaturdayButton(_ sender: Any) {
        if flag == 0{
            SaturdayButton.setImage(#imageLiteral(resourceName: "sat_on"), for: .normal)
            flag = 1
            saturday = 1
        }
        else if flag == 1 {
            SaturdayButton.setImage(#imageLiteral(resourceName: "sun_off"), for: .normal)
            flag = 0
            saturday = 0
        }
        storeDay(mon: monday, tue: tuesday, wed: wednesday, thu: thursday, fri: friday, sat: saturday, sun: sunday)
    }
    @IBAction func SundayButton(_ sender: Any) {
        if flag == 0{
            SundayButton.setImage(#imageLiteral(resourceName: "sun_on"), for: .normal)
            flag = 1
            sunday = 1
        }
        else if flag == 1 {
            SundayButton.setImage(#imageLiteral(resourceName: "sun_off"), for: .normal)
            flag = 0
            sunday = 0
        }
        storeDay(mon: monday, tue: tuesday, wed: wednesday, thu: thursday, fri: friday, sat: saturday, sun: sunday)
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
