//
//  TabBarViewController.swift
//  ProjectMC2-SLEEPTRACKER
//
//  Created by Stendy Antonio on 06/05/20.
//  Copyright © 2020 Stendy Antonio. All rights reserved.
//

import UIKit

class TabBarViewController: UITabBarController {

    @IBInspectable var defaultIndex: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        selectedIndex = defaultIndex
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        if Core.shared.isNewUser(){
            let vc = (storyboard?.instantiateViewController(identifier: "onboarding"))! as OnBoardingNavigationViewController
            vc.modalPresentationStyle = .fullScreen
            present(vc,animated: true)
        }else{
            
        }
    }
    
    class Core{
        static let shared = Core()
        
        func isNewUser() -> Bool {
            return UserDefaults.standard.bool(forKey: "isNewUser")
        }
        
        func IsNotNewUser(){
            UserDefaults.standard.set(true, forKey: "isNewUser")
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
