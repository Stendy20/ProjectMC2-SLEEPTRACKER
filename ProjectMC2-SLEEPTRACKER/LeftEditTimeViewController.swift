//
//  LeftEditTimeViewController.swift
//  ProjectMC2-SLEEPTRACKER
//
//  Created by Stendy Antonio on 19/05/20.
//  Copyright © 2020 Stendy Antonio. All rights reserved.
//

import UIKit

class LeftEditTimeViewController: UIViewController {
    
    @IBOutlet weak var TimePickerEdit: UIDatePicker!
    
    var timevalue = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(handledone))
        
        TimePickerEdit.setValue(UIColor.white, forKeyPath: "textColor")
        
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func TimePickerAction(_ sender: Any) {
        let dateformatter = DateFormatter()
        //        let dateformatter1 = DateFormatter()
        //        let dateformatter2 = DateFormatter()
        
        dateformatter.dateFormat = "HH:mm"
        //        dateformatter1.dateFormat = "HH"
        //        dateformatter2.dateFormat = "mm"
        
        timevalue = dateformatter.string(from: TimePickerEdit.date)
        
        storeTime(sleepTime: timevalue, wakeUpTime: retrieveTime().wakeUpTime)
    }
    
    @objc func handledone(){
        storeTime(sleepTime: timevalue, wakeUpTime: retrieveTime().wakeUpTime)
        
        let timerstartview = self.storyboard?.instantiateViewController(identifier: "TabBar") as! TabBarViewController
        
        self.navigationController?.pushViewController(timerstartview, animated: true)
        
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
