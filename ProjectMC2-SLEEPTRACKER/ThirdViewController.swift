//
//  ThirdViewController.swift
//  ProjectMC2-SLEEPTRACKER
//
//  Created by Stendy Antonio on 11/05/20.
//  Copyright © 2020 Stendy Antonio. All rights reserved.
//

import UIKit

protocol profileProtocol {
    func reloadProfile()
}
class ThirdViewController: UIViewController, profileProtocol {
    
    
    
    
    // heading part
    @IBOutlet weak var nameButton: UIButton!
    @IBOutlet weak var addProfileButton: UIButton!
    @IBOutlet weak var loggedInProfileButton: UIButton!
    @IBOutlet weak var notLoggedInProfileButton: UIButton!
    
    // First view
    @IBOutlet weak var todayDate: UILabel!
    @IBOutlet weak var todaySleep: UILabel!
    @IBOutlet weak var todayMood: UILabel!
    
    // Second View
    @IBOutlet weak var sleepTimelineView: UIView!
    
    
    
    
    @objc func toTimeline(_ sender: UITapGestureRecognizer? = nil){
        print("To timeline")
        performSegue(withIdentifier: "toTable", sender: self)
    }
    
    func reloadProfile() {
        self.viewDidLoad()
        
    }
    
    func checkProfile() {
//        clearData(entity: "Profile")
        let profile:profileStruct = retrieveProfile()
        if (profile.firstName == ""){
            nameButton.isHidden = true
            loggedInProfileButton.isHidden = true
            addProfileButton.isHidden = false
            notLoggedInProfileButton.isHidden = false
        }
        else{
            addProfileButton.isHidden = true
            notLoggedInProfileButton.isHidden = true
            nameButton.isHidden = false
            loggedInProfileButton.isHidden = false
            nameButton.setTitle("\(profile.firstName) \(profile.lastName)", for: .normal)
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true

        checkProfile()
        
        // handle tap on view
        let tap = UITapGestureRecognizer(target: self, action: #selector(toTimeline))
        sleepTimelineView.addGestureRecognizer(tap)
        sleepTimelineView.isUserInteractionEnabled = true
        self.view.addSubview(sleepTimelineView)
        // Do any additional setup after loading the view.
    }
    
    // hide navigation bar
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // Hide the Navigation Bar
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
        
        
    }
    // unhide navigation bar
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        // Show the Navigation Bar
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }
    
    @IBAction func reload(_ sender: Any) {
        self.viewDidLoad()
//        clearData(entity: "Profile")
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
