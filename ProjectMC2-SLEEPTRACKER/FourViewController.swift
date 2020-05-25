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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.hidesBackButton = true

        BedTimeLabel.text = "\(retrieveTime().sleepTime)"
        WakeUpLabel.text = "\(retrieveTime().wakeUpTime)"
        DurationLabel.text = "\(retrieveTime().duration)"
        
        checkday()
    }
    
    func checkday(){
        if retrieveDay().mon == 1 {
            MondayButton.setImage(#imageLiteral(resourceName: "mon_on"), for: .normal)
        }
        if retrieveDay().tue == 1 {
            TuesdayButton.setImage(#imageLiteral(resourceName: "tue_on"), for: .normal)
        }
        if retrieveDay().wed == 1 {
            WednesdayButton.setImage(#imageLiteral(resourceName: "wed_on"), for: .normal)
        }
        if retrieveDay().thu == 1 {
            ThurdayButton.setImage(#imageLiteral(resourceName: "tue_on"), for: .normal)
        }
        if retrieveDay().fri == 1 {
            FridayBUtton.setImage(#imageLiteral(resourceName: "fri_on"), for: .normal)
        }
        if retrieveDay().sat == 1 {
            SaturdayButton.setImage(#imageLiteral(resourceName: "sun_on"), for: .normal)
        }
        if retrieveDay().sun == 1 {
            SundayButton.setImage(#imageLiteral(resourceName: "sun_on"), for: .normal)
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
