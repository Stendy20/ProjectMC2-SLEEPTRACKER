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
    @IBOutlet weak var barView: UIView!
    @IBOutlet weak var barEmptyView: UIView!
    
    var BAR_WIDTH_CONSTANT: CGFloat = 13
    var BAR_DISTANCE: CGFloat = 27 // distance between your bars
    var BAR_MAX_HEIGHT: CGFloat = 100 // maximum height of a bar
    let MAX_VALUE: CGFloat = 12 //maximum value of a bar
    let MIN_VALUE: CGFloat = 0 // minimum value of a bar
    
    
    @objc func toTimeline(_ sender: UITapGestureRecognizer? = nil){
        print("To timeline")
        performSegue(withIdentifier: "toTable", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destVC = segue.destination as? AddProfileViewController {
            destVC.delegate = self
        } 
    }
    
    func reloadProfile() {
        print("called")
        updateUI()
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
        addProfileButton.addTarget(self, action: #selector(toAddProfilePage), for: .touchUpInside)
        notLoggedInProfileButton.addTarget(self, action: #selector(toAddProfilePage), for: .touchUpInside)
        nameButton.addTarget(self, action: #selector(toEditProfilePage), for: .touchUpInside)
        loggedInProfileButton.addTarget(self, action: #selector(toEditProfilePage), for: .touchUpInside)
        
        updateUI()
    }
    
    @objc func toEditProfilePage() {
        self.performSegue(withIdentifier: "toEdit", sender: self)
    }
    
    @objc func toAddProfilePage() {
        self.performSegue(withIdentifier: "toAdd", sender: self)
    }
    
    func getBarHeight(height: CGFloat, maxHeight: CGFloat, maxValue: CGFloat, minValue: CGFloat) -> CGFloat {
            let barHeight = (maxHeight * height ) / (maxValue - minValue)
            return barHeight
    }
    
    // hide navigation bar
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // Hide the Navigation Bar
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
        updateUI()
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
        //self.viewDidLoad()
        updateUI()
//        clearData(entity: "Profile")
    }
    
    func updateUI() {
        navigationItem.hidesBackButton = true
        clearData(entity: "Sleep")
        // heading
        checkProfile()
        
        // first view
        let todayTemp = retrieveSleep()
        
        let date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE, dd MMMM yyyy"
        let currentDateString: String = dateFormatter.string(from: date)
        todayDate.text = currentDateString
        
        
        // check data exist
        if (todayTemp.count > 0){
            let last = todayTemp.count - 1
            let h:Int = todayTemp[last].duration / 60
            let m:Int = todayTemp[last].duration - (h * 60)
            todaySleep.text = "\(h)h \(m)m"
            
            todayMood.text = "\(todayTemp[last].mood)"
        }
        
        // handle tap on view
        let tap = UITapGestureRecognizer(target: self, action: #selector(toTimeline))
        sleepTimelineView.addGestureRecognizer(tap)
        sleepTimelineView.isUserInteractionEnabled = true
        self.view.addSubview(sleepTimelineView)
        // Do any additional setup after loading the view.
        
        // Bar chart
        var xPos: CGFloat = 40
        var yPos: CGFloat = 200
        let sleepList = retrieveSleep()
        
        var nBar = 7 // number of bars to print
        if (sleepList.count<7){
            nBar = sleepList.count
        }
        
        var values:[Double] = []
        for i in 0..<nBar{
            let durationInHours:Double = Double(sleepList[i].duration) / 60.0
            values.append(durationInHours)
        }
        
        
        for i in 0..<nBar {
            // draw bar
            let barHeight = getBarHeight(height: CGFloat(values[i]), maxHeight: BAR_MAX_HEIGHT, maxValue: MAX_VALUE, minValue: MIN_VALUE)
            yPos = BAR_MAX_HEIGHT - barHeight
            let frame = CGRect(x: xPos, y: yPos, width: BAR_WIDTH_CONSTANT, height: barHeight)
            let bar = UIView(frame: frame)
            bar.backgroundColor = UIColor.black
            bar.layer.cornerRadius = BAR_WIDTH_CONSTANT < barHeight ? BAR_WIDTH_CONSTANT / 2 : barHeight / 2
            bar.layer.masksToBounds = true
            self.barView.addSubview(bar)
            
            xPos = xPos + BAR_WIDTH_CONSTANT + BAR_DISTANCE
            // bar drawing complete
        }
        
        // bar chart outline
        xPos = 40
        yPos = 200
//        let values2: [Int] = [12, 12, 12, 12, 12, 12, 12] //values of a Bar chart
        for i in 0..<7 {
            // draw bar
            let barHeight = getBarHeight(height: CGFloat(12), maxHeight: BAR_MAX_HEIGHT, maxValue: MAX_VALUE, minValue: MIN_VALUE)
            yPos = BAR_MAX_HEIGHT - barHeight
            let frame = CGRect(x: xPos, y: yPos, width: BAR_WIDTH_CONSTANT, height: barHeight)
            let bar = UIView(frame: frame)
            bar.backgroundColor = UIColor.white
            bar.layer.cornerRadius = BAR_WIDTH_CONSTANT < barHeight ? BAR_WIDTH_CONSTANT / 2 : barHeight / 2
            bar.layer.masksToBounds = true
            self.barEmptyView.addSubview(bar)
            
            xPos = xPos + BAR_WIDTH_CONSTANT + BAR_DISTANCE
            // bar drawing complete
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
