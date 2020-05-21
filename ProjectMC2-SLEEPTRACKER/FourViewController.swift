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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        BedTimeLabel.text = "\(retrieveTime().sleepTime) PM"
        WakeUpLabel.text = "\(retrieveTime().wakeUpTime) AM"
                
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
