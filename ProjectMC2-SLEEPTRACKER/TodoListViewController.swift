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
    @IBOutlet weak var TitleTodoList: UILabel!
    @IBOutlet weak var ImageVIEW: UIImageView!
    @IBOutlet weak var OverlayView: UIView!
    @IBOutlet weak var ImageViewBackScreen: UIImageView!
    @IBOutlet weak var TitleBackScreen: UILabel!
    @IBOutlet weak var LabelBackScreen: UILabel!
    
    var titletodoarray = ["Get a comfortable bed, mattress, and pillow", "Set your bedroom temperature", "Don't eat late in the evening", "Don't drink any liquids before bed","Turn off the lights","Don't consume caffeine late in the day","Stretch"]
    
    var todolis = ["A good sleeping posture is key to sleeping soundly, night after night, and to waking without pain and stiffness. Your bed, mattress, and pillow can greatly affect sleep quality.", "Hot locations can be very hard to get a good night’s sleep when it’s too warm. This is because because our body and temperature can affect our sleep quality. Although the temperature itself depends on our preferences and habits.", "Eating a large meal before bed or even have a certain type of late-night snack may negatively affect your sleep quality. What can improved your sleep is a low carb diet.", "Drinking large amounts of liquids before bed can lead to similar symptoms, though some people are more sensitive than others. Reduce fluid intake in the late evening and try to use the bathroom right before bed.", "Artificial light at night can affect your body clock and things like brain wave patterns, hormone production, and cell regulation. If you can't sleep with the lights off, try to dim them or get a night light.", "Caffeine can significantly worsen sleep quality, especially if you drink large amounts in the late afternoon or evening, because caffeine stimulates your nervous system and may stop your body from naturally relaxing at night.", "Try to stretch more before you sleep, especially when you've spent a full day of work hunched over a computer or other tough activity."]
    
    var temp = 0
    
    @IBOutlet weak var View2BackScreen: UIView!
    @IBOutlet weak var View3BackScreen: UIView!
    @IBOutlet weak var SwipeViewImage: UIImageView!
    @IBOutlet weak var OverlayViewImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //        TitleTodoList.text = ""
        //        LabelTodoList.text = ""
        
        //        TitleBackScreen.text = titletodoarray[0]
        //        LabelBackScreen.text = todolis[0]
        
        TitleBackScreen.adjustsFontSizeToFitWidth = true
        TitleTodoList.adjustsFontSizeToFitWidth = true
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
            TitleTodoList.text = titletodoarray[temp]
            OverlayView.isHidden = true
            TitleBackScreen.text = titletodoarray[temp+1]
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
            TitleTodoList.text = titletodoarray[temp]
            OverlayView.isHidden = true
            TitleBackScreen.text = titletodoarray[temp+1]
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
            TitleTodoList.text = titletodoarray[titletodoarray.count-1]
            TitleBackScreen.text = ""
            LabelBackScreen.text = ""
            SwipeView.gestureRecognizers?.forEach(SwipeView.removeGestureRecognizer(_:))
        }
        else{
            View2BackScreen.isHidden = false
            View3BackScreen.isHidden = false
            LabelTodoList.text = todolis[temp]
            TitleTodoList.text = titletodoarray[temp]
            OverlayView.isHidden = true
            TitleBackScreen.text = titletodoarray[temp+1]
            LabelBackScreen.text = todolis[temp+1]
            temp+=1
        }
    }
    
    func changeToDoListLeft(){
        if temp == todolis.count-1{
            View2BackScreen.isHidden = true
            View3BackScreen.isHidden = true
            OverlayView.isHidden = true
            
            LabelTodoList.text = todolis[todolis.count-1]
            TitleTodoList.text = titletodoarray[titletodoarray.count-1]
            TitleBackScreen.text = ""
            LabelBackScreen.text = ""
            SwipeView.gestureRecognizers?.forEach(SwipeView.removeGestureRecognizer(_:))
        }
        else{
            View2BackScreen.isHidden = false
            View3BackScreen.isHidden = false
            LabelTodoList.text = todolis[temp]
            TitleTodoList.text = titletodoarray[temp]
            OverlayView.isHidden = true
            TitleBackScreen.text = titletodoarray[temp+1]
            LabelBackScreen.text = todolis[temp+1]
            temp+=1
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
