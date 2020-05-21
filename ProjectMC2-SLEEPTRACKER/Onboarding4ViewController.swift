//
//  Onboarding4ViewController.swift
//  ProjectMC2-SLEEPTRACKER
//
//  Created by Stendy Antonio on 18/05/20.
//  Copyright © 2020 Stendy Antonio. All rights reserved.
//

import UIKit

class Onboarding4ViewController: UIViewController {

    var flag = 0
    
    @IBOutlet weak var MondayButtonOutlet: UIButton!
    @IBOutlet weak var TuesdayButtonOutlet: UIButton!
    @IBOutlet weak var WednesdayButtonOutlet: UIButton!
    @IBOutlet weak var ThursdayButtonOutlet: UIButton!
    @IBOutlet weak var FridayButtonOutlet: UIButton!
    @IBOutlet weak var SaturdayButtonOutlet: UIButton!
    @IBOutlet weak var SundayButtonOutlet: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func MondayButton(_ sender: Any) {
        if flag == 0{
            flag = 1
            MondayButtonOutlet.setImage(#imageLiteral(resourceName: "mon_on"), for: .normal)
        }
        else if flag == 1 {
            flag = 0
            MondayButtonOutlet.setImage(#imageLiteral(resourceName: "mon_off"), for: .normal)
        }
        
    }
    @IBAction func TuesdayButton(_ sender: Any) {
            if flag == 0{
                TuesdayButtonOutlet.setImage(#imageLiteral(resourceName: "tue_on"), for: .normal)
                flag = 1
            }
            else if flag == 1 {
                TuesdayButtonOutlet.setImage(#imageLiteral(resourceName: "tue_off"), for: .normal)
                flag = 0
            }
            
    }
    @IBAction func WednesdayButton(_ sender: Any) {
            if flag == 0{
                WednesdayButtonOutlet.setImage(#imageLiteral(resourceName: "wed_on"), for: .normal)
                flag = 1
            }
            else if flag == 1 {
                WednesdayButtonOutlet.setImage(#imageLiteral(resourceName: "wed_off"), for: .normal)
                flag = 0
            }
            
    }
    @IBAction func ThursdayButton(_ sender: Any) {
        if flag == 0{
                ThursdayButtonOutlet.setImage(#imageLiteral(resourceName: "thu_on"), for: .normal)
                flag = 1
            }
            else if flag == 1 {
                ThursdayButtonOutlet.setImage(#imageLiteral(resourceName: "tue_off"), for: .normal)
                flag = 0
            }
                }
    @IBAction func FridayButton(_ sender: Any) {
        if flag == 0{
                FridayButtonOutlet.setImage(#imageLiteral(resourceName: "fri_on"), for: .normal)
                flag = 1
            }
            else if flag == 1 {
                FridayButtonOutlet.setImage(#imageLiteral(resourceName: "fri_off"), for: .normal)
                flag = 0
            }
                }
    @IBAction func SaturdayButton(_ sender: Any) {
        if flag == 0{
                SaturdayButtonOutlet.setImage(#imageLiteral(resourceName: "sat_on"), for: .normal)
                flag = 1
            }
            else if flag == 1 {
                SaturdayButtonOutlet.setImage(#imageLiteral(resourceName: "sun_off"), for: .normal)
                flag = 0
            }
                }
    @IBAction func SundayButton(_ sender: Any) {
        if flag == 0{
                SundayButtonOutlet.setImage(#imageLiteral(resourceName: "sun_on"), for: .normal)
                flag = 1
            }
            else if flag == 1 {
                SundayButtonOutlet.setImage(#imageLiteral(resourceName: "sun_off"), for: .normal)
                flag = 0
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
