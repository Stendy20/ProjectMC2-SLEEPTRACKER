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
    
    var todolis = ["Have you eat your food ?", "Have you done ?", "Have you drink ?", "Have You Taking a bath ?"]
    
    var temp = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        LabelTodoList.adjustsFontSizeToFitWidth = true
        
        
        SwipeView.layer.cornerRadius = 25
        
        // Do any additional setup after loading the view.
        
//        SwipeView.transform = CGAffineTransform(rotationAngle: 0.05)
        
    }
    
    @IBAction func YesButton(_ sender: Any) {
        
        if temp == todolis.count-1{
            
            let timerstartview = self.storyboard?.instantiateViewController(identifier: "TimerStory") as! TimerStartViewController

            self.navigationController?.pushViewController(timerstartview, animated: true)
            
        }
        
    }
    
    func changeToDoListRight(){
        if temp == todolis.count-1{
            LabelTodoList.text = todolis[todolis.count-1]
        }
        else{
            LabelTodoList.text = todolis[temp]
            temp+=1
        }
    }
    
    func changeToDoListLeft(){
        if temp == 0{
            LabelTodoList.text = todolis[0]
        }
        else{
            LabelTodoList.text = todolis[temp-1]
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
                self.SwipeView.center = self.view.center
                self.SwipeView.alpha = 1
//                self.SwipeView.transform = CGAffineTransform(rotationAngle: 0.05)
            }
        }
    }
    
    
    
    
}
