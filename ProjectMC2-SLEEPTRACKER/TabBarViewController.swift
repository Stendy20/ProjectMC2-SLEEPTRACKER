//
//  TabBarViewController.swift
//  ProjectMC2-SLEEPTRACKER
//
//  Created by Stendy Antonio on 06/05/20.
//  Copyright © 2020 Stendy Antonio. All rights reserved.
//

import UIKit

class TabBarViewController: UITabBarController {

    @IBInspectable var defaultIndex: Int = 1

    var viewalarm1 = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        selectedIndex = defaultIndex
        setOnboarding()
        
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
