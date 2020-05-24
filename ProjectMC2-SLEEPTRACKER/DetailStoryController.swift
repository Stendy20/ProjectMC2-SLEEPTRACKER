//
//  DetailStoryController.swift
//  ProjectMC2-SLEEPTRACKER
//
//  Created by Stendy Antonio on 11/05/20.
//  Copyright © 2020 Stendy Antonio. All rights reserved.
//

import UIKit

class DetailStoryController: UIViewController {

    @IBOutlet weak var PlayPauseOutlet: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func PlayPauseButton(_ sender: Any) {
        PlayPauseOutlet.setImage(#imageLiteral(resourceName: "pause_button"), for: .normal)
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
