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
    @IBOutlet weak var barTView: UIView!
    @IBOutlet weak var barTEmptyView: UIView!
    @IBOutlet weak var markerView: UIView!
    
    var BAR2_WIDTH_CONSTANT: CGFloat = 13
    var BAR2_DISTANCE: CGFloat = 27 // distance between your bars
    var BAR2_MAX_HEIGHT: CGFloat = 270 // maximum height of a bar
    let MAX_VALUE2: CGFloat = 16 //maximum value of a bar
    let MIN_VALUE2: CGFloat = 0 // minimum value of a bar
    
    // Second View
    @IBOutlet weak var sleepTimelineView: UIView!
    @IBOutlet weak var barView: UIView!
    @IBOutlet weak var barEmptyView: UIView!
    
    @IBOutlet weak var refreshButton: UIButton!
    
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
        } else if let destVC = segue.destination as? ProfileDetailViewController {
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
        
        refreshButton.isHidden = true
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
        
        // dummy data
        storeSleep(date: "26/05/2020", sleepTime: "22:00", wakeUpTime: "08:00", mood: "Happy")
        storeSleep(date: "27/05/2020", sleepTime: "03:00", wakeUpTime: "10:00", mood: "Unsure")
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
        
        // get day of the week
        let dateFormatter2 = DateFormatter()
        dateFormatter2.dateFormat = "EEEE"
        let dayOfTheWeek: String = dateFormatter2.string(from: date)
        var day: Int = 0
        switch dayOfTheWeek {
        case "Monday":
            day = 1
        default:
            day = 0
        }
        
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
            bar.backgroundColor = UIColor(hex: "#FDA000ff")
            bar.layer.cornerRadius = BAR_WIDTH_CONSTANT < barHeight ? BAR_WIDTH_CONSTANT / 2 : barHeight / 2
            bar.layer.masksToBounds = true
            self.barView.addSubview(bar)
            
            xPos = xPos + BAR_WIDTH_CONSTANT + BAR_DISTANCE
            // bar drawing complete
        }
        
        // bar chart outline
        
        // reset position
        xPos = 40
        yPos = 200
        
        for i in 0..<7 {
            // draw bar
            let barHeight = getBarHeight(height: CGFloat(12), maxHeight: BAR_MAX_HEIGHT, maxValue: MAX_VALUE, minValue: MIN_VALUE)
            yPos = BAR_MAX_HEIGHT - barHeight
            let frame = CGRect(x: xPos, y: yPos, width: BAR_WIDTH_CONSTANT, height: barHeight)
            let bar = UIView(frame: frame)
            bar.backgroundColor = UIColor(hex: "#ECD4EAff")
            bar.layer.cornerRadius = BAR_WIDTH_CONSTANT < barHeight ? BAR_WIDTH_CONSTANT / 2 : barHeight / 2
            bar.layer.masksToBounds = true
            self.barEmptyView.addSubview(bar)
            
            xPos = xPos + BAR_WIDTH_CONSTANT + BAR_DISTANCE
            // bar drawing complete
        }
        
        // Today Bar Chart
        var xPos2: CGFloat = 37.5
        var yPos2: CGFloat = 37.5
        if(sleepList.count > 0){
            let last = sleepList.count - 1
            // 8 PM = 0, so 3 AM = 4 + 3
            let sleepT: String = sleepList[last].sleepTime
            let wakeT: String = sleepList[last].wakeUpTime
            
            let sleepTimeH = Double(sleepT.prefix(2))!
            let sleepTimeM = Double(sleepT.suffix(2))!
            var sleepInDouble: Double = sleepTimeH + sleepTimeM/60
            if (sleepInDouble >= 20){
                sleepInDouble = sleepInDouble - 20.0
            }
            else{
                sleepInDouble = sleepInDouble + 4.0
            }
            print("sleepInDouble \(sleepInDouble)")
            
            let wakeTimeH = Double(wakeT.prefix(2))!
            let wakeTimeM = Double(wakeT.suffix(2))!
            var wakeInDouble: Double = wakeTimeH + wakeTimeM/60
            if (wakeInDouble >= 20){
                wakeInDouble = wakeInDouble - 20.0
            }
            else{
                wakeInDouble = wakeInDouble + 4.0
            }
            print("wakeInDouble \(wakeInDouble)")
            
            let sleepXPos = getBarHeight(height: CGFloat(sleepInDouble), maxHeight: BAR2_MAX_HEIGHT, maxValue: MAX_VALUE2, minValue: MIN_VALUE2)
            let bar2Height = getBarHeight(height: CGFloat(wakeInDouble - sleepInDouble), maxHeight: BAR2_MAX_HEIGHT, maxValue: MAX_VALUE2, minValue: MIN_VALUE2)
            yPos = BAR_MAX_HEIGHT - bar2Height
            let frame = CGRect(x: (xPos2 + sleepXPos), y: yPos2, width: bar2Height, height: BAR2_WIDTH_CONSTANT) // reverse because horizontal
            let bar = UIView(frame: frame)
            bar.backgroundColor = UIColor(hex: "#FDA000ff")
            bar.layer.cornerRadius = BAR_WIDTH_CONSTANT < bar2Height ? BAR_WIDTH_CONSTANT / 2 : bar2Height / 2
            bar.layer.masksToBounds = true
            self.barTView.addSubview(bar)
        }
        
        let bar2Height = getBarHeight(height: CGFloat(16), maxHeight: BAR2_MAX_HEIGHT, maxValue: MAX_VALUE2, minValue: MIN_VALUE2)
        yPos = BAR_MAX_HEIGHT - bar2Height
        let frame = CGRect(x: xPos2, y: yPos2, width: bar2Height, height: BAR2_WIDTH_CONSTANT) // reverse because horizontal
        let bar = UIView(frame: frame)
        bar.backgroundColor = UIColor(hex: "#ECD4EAff")
        bar.layer.cornerRadius = BAR_WIDTH_CONSTANT < bar2Height ? BAR_WIDTH_CONSTANT / 2 : bar2Height / 2
        bar.layer.masksToBounds = true
        self.barTEmptyView.addSubview(bar)
        
        yPos2 = 34
        for _ in 0..<17{
            let lineFrame = CGRect(x: xPos2, y: yPos2, width: CGFloat(1), height: CGFloat(20))
            let lineView = UIView(frame: lineFrame)
            lineView.backgroundColor = UIColor(hex: "#979797ff")
            self.markerView.addSubview(lineView)
            xPos2 = xPos2 + CGFloat(16.875)
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
