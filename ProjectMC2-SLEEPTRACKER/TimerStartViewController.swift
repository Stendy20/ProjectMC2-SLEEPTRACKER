//
//  TimerStartViewController.swift
//  ProjectMC2-SLEEPTRACKER
//
//  Created by Stendy Antonio on 19/05/20.
//  Copyright © 2020 Stendy Antonio. All rights reserved.
//

import UIKit

class TimerStartViewController: UIViewController {
    
    @IBOutlet weak var LongPressButton: UIButton!
    
    @IBOutlet weak var LabelTime: UILabel!
    
    var flag = 0
    
    var timer: Timer?
    
    var count = 5
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.hidesBackButton = true
        
        let longPress = UILongPressGestureRecognizer(target: self, action: #selector(yourAction))
//        longPress.minimumPressDuration = 5
        LongPressButton.addGestureRecognizer(longPress)
    }
    
    @objc func yourAction(Recognizer: UILongPressGestureRecognizer){
        if Recognizer.state == .began{
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(fireTimer), userInfo: nil, repeats: true)

        }
        else if Recognizer.state == .ended{
            if flag == 0{
                self.view.backgroundColor = .blue
                flag = 1
            }
            else{
                self.view.backgroundColor = .white
                flag = 0
            }
        }
     
    }
    
    @objc func fireTimer(){
        if(count != 0){
            count-=1
            if(count == 4){
                LongPressButton.setImage(UIImage(named:"Char1Green.pdf"), for: .normal)
            }
            else if count == 3{
                LongPressButton.setImage(UIImage(named:"mathematics.pdf"), for: .normal)
            }
            LabelTime.text = "\(count)"
        }
        else{
            count = 5
            let impactgenerator = UIImpactFeedbackGenerator(style: .heavy)
            impactgenerator.impactOccurred()
            LabelTime.text = "5"
            timer?.invalidate()
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
