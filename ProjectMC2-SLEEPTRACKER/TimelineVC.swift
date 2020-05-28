//
//  TimelineVC.swift
//  ProjectMC2-SLEEPTRACKER
//
//  Created by Michael Sanjaya on 29/05/20.
//  Copyright © 2020 Stendy Antonio. All rights reserved.
//

import UIKit

class TimelineVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var BAR2_WIDTH_CONSTANT: CGFloat = 13
    var BAR2_DISTANCE: CGFloat = 27 // distance between your bars
    var BAR2_MAX_HEIGHT: CGFloat = 270 // maximum height of a bar
    let MAX_VALUE2: CGFloat = 16 //maximum value of a bar
    let MIN_VALUE2: CGFloat = 0 // minimum value of a bar
    
    var sleepTemp: [sleepStruct] = retrieveSleep()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBarController?.tabBar.isHidden = true
//        tableView.backgroundColor = UIColor(hex: "3D1242FF")
        tableView.backgroundColor = UIColor.clear
        tableView.layer.backgroundColor = UIColor.clear.cgColor
        // Do any additional setup after loading the view.
    }
    
    func getBarHeight(height: CGFloat, maxHeight: CGFloat, maxValue: CGFloat, minValue: CGFloat) -> CGFloat {
            let barHeight = (maxHeight * height ) / (maxValue - minValue)
            return barHeight
    }
    
    @IBAction func backButton(_ sender: Any) {
        dismiss(animated: true)
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
extension TimelineVC: UITableViewDelegate, UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
//    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        return 120
//    }
    
//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        return "Sleep Timeline"
//    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sleepTemp.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 160
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "timelineTableViewCell", for: indexPath) as! TimelineTableViewCell
        let n = indexPath.row
        
        cell.cellView.layer.cornerRadius = 8
        cell.contentView.backgroundColor = UIColor(hex: "3D1242FF")
        
        // labels
        let h:Int = sleepTemp[n].duration / 60
        let m:Int = sleepTemp[n].duration - (h * 60)
        cell.cellDuration.text = "\(h)h \(m)m"
        
        cell.cellMood.text = "\(sleepTemp[n].mood)"
        
        // bar chart
        var xPos2: CGFloat = 37.5
        var yPos2: CGFloat = 37.5
        
        let sleepT: String = sleepTemp[n].sleepTime
        let wakeT: String = sleepTemp[n].wakeUpTime
        
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
        let barHeight = getBarHeight(height: CGFloat(wakeInDouble - sleepInDouble), maxHeight: BAR2_MAX_HEIGHT, maxValue: MAX_VALUE2, minValue: MIN_VALUE2)
        let frame = CGRect(x: (xPos2 + sleepXPos), y: yPos2, width: barHeight, height: BAR2_WIDTH_CONSTANT) // reverse because horizontal
        let bar = UIView(frame: frame)
        bar.backgroundColor = UIColor(hex: "#FDA000ff")
        bar.layer.cornerRadius = BAR2_WIDTH_CONSTANT < barHeight ? BAR2_WIDTH_CONSTANT / 2 : barHeight / 2
        bar.layer.masksToBounds = true
        cell.barView.addSubview(bar)
        
        let bar2Height = getBarHeight(height: CGFloat(16), maxHeight: BAR2_MAX_HEIGHT, maxValue: MAX_VALUE2, minValue: MIN_VALUE2)
        let frame2 = CGRect(x: xPos2, y: yPos2, width: bar2Height, height: BAR2_WIDTH_CONSTANT) // reverse because horizontal
        let bar2 = UIView(frame: frame2)
        bar2.backgroundColor = UIColor(hex: "#ECD4EAff")
        bar2.layer.cornerRadius = BAR2_WIDTH_CONSTANT < bar2Height ? BAR2_WIDTH_CONSTANT / 2 : bar2Height / 2
        bar2.layer.masksToBounds = true
        cell.barEmptyView.addSubview(bar2)
        
        yPos2 = 34
        for _ in 0..<17{
            let lineFrame = CGRect(x: xPos2, y: yPos2, width: CGFloat(1), height: CGFloat(20))
            let lineView = UIView(frame: lineFrame)
            lineView.backgroundColor = UIColor(hex: "#979797ff")
            cell.markerView.addSubview(lineView)
            xPos2 = xPos2 + CGFloat(16.875)
        }
        
        return cell
    }
    
    
}
