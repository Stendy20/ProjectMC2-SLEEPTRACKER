//
//  OnBoardingNavigationViewController.swift
//  ProjectMC2-SLEEPTRACKER
//
//  Created by Stendy Antonio on 18/05/20.
//  Copyright © 2020 Stendy Antonio. All rights reserved.
//

import UIKit

class OnBoardingNavigationViewController: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        checkOnboarding()
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    override open var shouldAutorotate: Bool {
        return false
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
