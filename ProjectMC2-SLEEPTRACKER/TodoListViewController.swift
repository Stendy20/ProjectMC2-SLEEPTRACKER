//
//  TodoListViewController.swift
//  ProjectMC2-SLEEPTRACKER
//
//  Created by Stendy Antonio on 19/05/20.
//  Copyright © 2020 Stendy Antonio. All rights reserved.
//

import UIKit

class TodoListViewController: UIViewController {
    
    @IBOutlet weak var SwipeView: UIView!
    @IBOutlet weak var LabelTodoList: UILabel!
    @IBOutlet weak var ImageVIEW: UIImageView!
    
    @IBOutlet weak var OverlayView: UIView!
    @IBOutlet weak var ImageViewBackScreen: UIImageView!
    @IBOutlet weak var LabelBackScreen: UILabel!
    var todolis = ["Have you washing your teeth ?", "Have you eat your food ?", "Have you done ?", "Have you drink ?", "Have You Taking a bath ?"]
    
    var temp = 0
        
    @IBOutlet weak var View2BackScreen: UIView!
    
    @IBOutlet weak var View3BackScreen: UIView!
    
    @IBOutlet weak var SwipeViewImage: UIImageView!
    @IBOutlet weak var OverlayViewImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        LabelTodoList.text = "Swipe to view your To Do List"
        LabelBackScreen.text = todolis[0]
        
        LabelBackScreen.adjustsFontSizeToFitWidth = true
        LabelTodoList.adjustsFontSizeToFitWidth = true
        
        OverlayViewImage.layer.cornerRadius = 25
        View2BackScreen.layer.cornerRadius = 25
        View3BackScreen.layer.cornerRadius = 25
        SwipeViewImage.layer.cornerRadius = 25
        
        SwipeViewImage.layer.borderColor = UIColor.gray.cgColor
        SwipeViewImage.layer.borderWidth = 1.0
        OverlayViewImage.layer.borderColor = UIColor.gray.cgColor
        OverlayViewImage.layer.borderWidth = 1.0
        View2BackScreen.layer.borderColor = UIColor.gray.cgColor
        View2BackScreen.layer.borderWidth = 1.0
        
        View3BackScreen.layer.borderColor = UIColor.gray.cgColor
        View3BackScreen.layer.borderWidth = 1.0
        
        // Do any additional setup after loading the view.
        
        //        SwipeView.transform = CGAffineTransform(rotationAngle: 0.05)
        
    }
    
    @IBAction func YesButton(_ sender: Any) {
        
        if temp == todolis.count-1{
            
            let timerstartview = self.storyboard?.instantiateViewController(identifier: "TimerStory") as! TimerStartViewController
            
            self.navigationController?.pushViewController(timerstartview, animated: true)
            
        }
        else{
            View2BackScreen.isHidden = false
            View3BackScreen.isHidden = false
            LabelTodoList.text = todolis[temp]
            OverlayView.isHidden = true
            LabelBackScreen.text = todolis[temp+1]
            temp+=1
        }
    }
    
    @IBAction func NoButton(_ sender: Any) {
        if temp == todolis.count-1{
            
            let timerstartview = self.storyboard?.instantiateViewController(identifier: "TimerStory") as! TimerStartViewController
            
            self.navigationController?.pushViewController(timerstartview, animated: true)
            
        }
        else{
            View2BackScreen.isHidden = false
            View3BackScreen.isHidden = false
            LabelTodoList.text = todolis[temp]
            OverlayView.isHidden = true
            LabelBackScreen.text = todolis[temp+1]
            temp+=1
        }
    }
    
    func changeToDoListRight(){
        if temp == todolis.count-1{
            View2BackScreen.isHidden = true
            View3BackScreen.isHidden = true
            OverlayView.isHidden = true
            
            LabelTodoList.text = todolis[todolis.count-1]
            LabelBackScreen.text = ""
            
            SwipeView.gestureRecognizers?.forEach(SwipeView.removeGestureRecognizer(_:))
        }
        else{
            View2BackScreen.isHidden = false
            View3BackScreen.isHidden = false
            LabelTodoList.text = todolis[temp]
            OverlayView.isHidden = true
            LabelBackScreen.text = todolis[temp+1]
            temp+=1
        }
    }
    
    func changeToDoListLeft(){
        if temp == 0{
            View2BackScreen.isHidden = false
            View3BackScreen.isHidden = false
            LabelTodoList.text = todolis[0]
            OverlayView.isHidden = true
        }
        else{
            View2BackScreen.isHidden = false
            View3BackScreen.isHidden = false
            LabelTodoList.text = todolis[temp-1]
            OverlayView.isHidden = true
            LabelBackScreen.text = todolis[temp]
            temp-=1
            
        }
    }
    
    @IBAction func panCard(_ sender: UIPanGestureRecognizer) {
        let card = sender.view!
        let point = sender.translation(in: view)
        
        card.center = CGPoint(x: view.center.x + point.x, y: view.center.y + point.y)
        
        if sender.state == UIGestureRecognizer.State.ended{
            
            if card.center.x < 75{
                UIView.animate(withDuration: 0.3, animations: {
                    card.center = CGPoint(x: card.center.x - 200, y: card.center.y + 75)
                    card.alpha = 0
                    
                    self.resetCard()
                    self.changeToDoListRight()
                    
                })
                return
            }
            else if card.center.x > (view.frame.width - 75){
                UIView.animate(withDuration: 0.3, animations: {
                    card.center = CGPoint(x: card.center.x + 200, y: card.center.y + 75)
                    card.alpha = 0
                    
                    self.resetCard()
                    self.changeToDoListLeft()
                })
                return
            }
            
            UIView.animate(withDuration: 0.2, animations:{
                card.center = self.view.center
            })
        }
    }
    
    func resetCard(){
        UIView.animate(withDuration: 0.2) {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                
                self.OverlayView.isHidden = false
                self.SwipeView.center = self.view.center
                self.SwipeView.alpha = 1
                //                self.SwipeView.transform = CGAffineTransform(rotationAngle: 0.05)
            }
        }
    }
}
