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
    
    var sleepTemp: [sleepStruct] = retrieveSleep()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBarController?.tabBar.isHidden = true
//        tableView.backgroundColor = UIColor(hex: "3D1242FF")
        tableView.backgroundColor = UIColor.clear
        tableView.layer.backgroundColor = UIColor.clear.cgColor
        // Do any additional setup after loading the view.
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
        
        let h:Int = sleepTemp[n].duration / 60
        let m:Int = sleepTemp[n].duration - (h * 60)
        cell.cellDuration.text = "\(h)h \(m)m"
        
        cell.cellMood.text = "\(sleepTemp[n].mood)"
        
        return cell
    }
    
    
}
