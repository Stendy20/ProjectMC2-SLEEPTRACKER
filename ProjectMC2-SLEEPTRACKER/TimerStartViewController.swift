//
//  TimerStartViewController.swift
//  ProjectMC2-SLEEPTRACKER
//
//  Created by Stendy Antonio on 19/05/20.
//  Copyright © 2020 Stendy Antonio. All rights reserved.
//

import UIKit
import AVFoundation

class TimerStartViewController: UIViewController {
    
    @IBOutlet weak var LongPressButton: UIButton!
    
    @IBOutlet weak var RedButtonBackground: UIButton!
    @IBOutlet weak var GreenButtonBackground: UIButton!
    @IBOutlet weak var BlueButtonBackground: UIButton!
    
    @IBOutlet weak var BackgroundImage: UIImageView!
    
    @IBOutlet weak var BlurView: UIView!
    
    @IBOutlet weak var LabelCurrentITIME: UILabel!
    @IBOutlet weak var LabelSetTime: UILabel!
    
    @IBOutlet weak var PlayMusicButton: UIButton!
    @IBOutlet weak var RepeatMusicButton: UIButton!
    @IBOutlet weak var MuteMusicButton: UIButton!
    
    @IBOutlet weak var PopUpMoodView: UIView!
    
    var flag = 0
    var flag1 = 0
    var flag2 = 0
    
    var timer: Timer?
    var timertest: Timer?
    var timertest1: Timer?
    
    var mood = ""
    
    var player:AVAudioPlayer = AVAudioPlayer()
    var alarmplayer:AVAudioPlayer = AVAudioPlayer()
    
    var alarmsoundpick = "Rain"
    
    var timecurrent = ""
    
    var count = 5
    
    var colorbutton = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(handledone))
        
        timertest = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(getCurrentTime), userInfo: nil, repeats: true)
        timertest1 = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(comparetime), userInfo: nil, repeats: true)
        
        playalarm()
        
        LabelCurrentITIME.text = timecurrent
        
        PopUpMoodView.isHidden = true
        
        navigationItem.hidesBackButton = true
        
        LabelSetTime.text = "\(retrieveTime().wakeUpTime) AM"
        
        let longPress = UILongPressGestureRecognizer(target: self, action: #selector(yourAction))
        //        longPress.minimumPressDuration = 5
        LongPressButton.addGestureRecognizer(longPress)
        
        BlurView.isHidden = true
        
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound], completionHandler: {didAllow, error in})
        
        
    }
    
    func playsong(){
        do{
            let audioPlayer = Bundle.main.path(forResource: alarmsoundpick, ofType: "mp3")
            
            try player = AVAudioPlayer(contentsOf: NSURL(fileURLWithPath: audioPlayer!) as URL)
        }
        catch{
            
        }
    }
    
    func playalarm(){
        do{
            let audioPlayer = Bundle.main.path(forResource: "alarm", ofType: "mp3")
            
            try alarmplayer = AVAudioPlayer(contentsOf: NSURL(fileURLWithPath: audioPlayer!) as URL)
        }
        catch{
            
        }
    }
    
    @objc func yourAction(Recognizer: UILongPressGestureRecognizer){
        if Recognizer.state == .began{
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(fireTimer), userInfo: nil, repeats: true)
            
        }
        else if Recognizer.state == .ended{
            alarmplayer.stop()
            player.stop()
            BlurView.isHidden = false
            
            let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.regular)
            let blurEffectView = UIVisualEffectView(effect: blurEffect)
            blurEffectView.frame = view.bounds
            BlurView.addSubview(blurEffectView)
            
            PopUpMoodView.isHidden = false
            timertest1?.invalidate()
            
        }
    }
    
    @IBAction func MoodAction(_ sender: Any) {
        BlurView.removeFromSuperview()
        PopUpMoodView.isHidden = true
        mood = "Happy"
        let timerstartview = self.storyboard?.instantiateViewController(identifier: "TabBar") as! TabBarViewController
        
        self.navigationController?.pushViewController(timerstartview, animated: true)
    }
    @IBAction func NeutralAction(_ sender: Any) {
        BlurView.removeFromSuperview()
        PopUpMoodView.isHidden = true
        mood = "Unsure"
        let timerstartview = self.storyboard?.instantiateViewController(identifier: "TabBar") as! TabBarViewController
        
        self.navigationController?.pushViewController(timerstartview, animated: true)
    }
    @IBAction func SadAction(_ sender: Any) {
        BlurView.removeFromSuperview()
        PopUpMoodView.isHidden = true
        mood = "Sad"
        let timerstartview = self.storyboard?.instantiateViewController(identifier: "TabBar") as! TabBarViewController
        
        self.navigationController?.pushViewController(timerstartview, animated: true)
        
    }
    
    @objc func fireTimer(){
        
        if colorbutton == 0 {
            if(count >= 0){
                count-=1
                if(count == 4){
                    LongPressButton.setImage(UIImage(named:"awake_button.png"), for: .normal)
                    let impactgenerator = UIImpactFeedbackGenerator(style: .heavy)
                    impactgenerator.impactOccurred()
                }
                else if count == 3{
                    LongPressButton.setImage(UIImage(named:"awake_yellow_two.png"), for: .normal)
                    let impactgenerator = UIImpactFeedbackGenerator(style: .heavy)
                    impactgenerator.impactOccurred()
                }
                else if count == 2{
                    LongPressButton.setImage(UIImage(named:"awake_yellow_three.png"), for: .normal)
                    let impactgenerator = UIImpactFeedbackGenerator(style: .heavy)
                    impactgenerator.impactOccurred()
                }
                else if count == 1{
                    LongPressButton.setImage(UIImage(named:"awake_yellow_four.png"), for: .normal)
                    let impactgenerator = UIImpactFeedbackGenerator(style: .heavy)
                    impactgenerator.impactOccurred()
                }
                else if count == 0{
                    LongPressButton.setImage(UIImage(named:"awake_yellow_five.png"), for: .normal)
                    let impactgenerator = UIImpactFeedbackGenerator(style: .heavy)
                    impactgenerator.impactOccurred()
                }
            }
            else{
                count = 5
                let impactgenerator = UIImpactFeedbackGenerator(style: .heavy)
                impactgenerator.impactOccurred()
                timer?.invalidate()
            }
        }
        else{
            if(count >= 0){
                count-=1
                if(count == 4){
                    LongPressButton.setImage(UIImage(named:"awake_purple_one.png"), for: .normal)
                    let impactgenerator = UIImpactFeedbackGenerator(style: .heavy)
                    impactgenerator.impactOccurred()
                }
                else if count == 3{
                    LongPressButton.setImage(UIImage(named:"awake_purple_two.png"), for: .normal)
                    let impactgenerator = UIImpactFeedbackGenerator(style: .heavy)
                    impactgenerator.impactOccurred()
                }
                else if count == 2{
                    LongPressButton.setImage(UIImage(named:"awake_purple_three.png"), for: .normal)
                    let impactgenerator = UIImpactFeedbackGenerator(style: .heavy)
                    impactgenerator.impactOccurred()
                }
                else if count == 1{
                    LongPressButton.setImage(UIImage(named:"awake_purple_four.png"), for: .normal)
                    let impactgenerator = UIImpactFeedbackGenerator(style: .heavy)
                    impactgenerator.impactOccurred()
                }
                else if count == 0{
                    LongPressButton.setImage(UIImage(named:"awake_purple_five.png"), for: .normal)
                    let impactgenerator = UIImpactFeedbackGenerator(style: .heavy)
                    impactgenerator.impactOccurred()
                }
            }
            else{
                count = 5
                let impactgenerator = UIImpactFeedbackGenerator(style: .heavy)
                impactgenerator.impactOccurred()
                timer?.invalidate()
                
                
            }
            
        }
        
        
    }
    
    @objc func comparetime(){
        if retrieveTime().wakeUpTime == timecurrent {
            colorbutton = 1
            alarmplayer.play()
            LongPressButton.setImage(UIImage(named:"awake_purple_one.png"), for: .normal)
            
            player.stop()
            
            RedButtonBackground.isHidden = true
            BlueButtonBackground.isHidden = true
            GreenButtonBackground.isHidden = true
            
            PlayMusicButton.isHidden = true
            MuteMusicButton.isHidden = true
            RepeatMusicButton.isHidden = true
            
            BackgroundImage.image = #imageLiteral(resourceName: "alarm_screen")
            
            timertest1?.invalidate()
            
        }
        getCurrentTime()
    }
    
    @objc func getCurrentTime(){
        let timeformatter1 = DateFormatter()
        
        timeformatter1.dateFormat = "HH:mm"
        
        timecurrent = timeformatter1.string(from: Date())
        
        LabelCurrentITIME.text = timecurrent
    }
    
    
    @IBAction func RedButtonAction(_ sender: Any) {
        if flag1 == 1{
            BackgroundImage.image = #imageLiteral(resourceName: "rain_bg_2")
            alarmsoundpick = "Rain"
            playsong()
            player.play()
        }
        else{
            BackgroundImage.image = #imageLiteral(resourceName: "rain_bg_2")
            alarmsoundpick = "Rain"
        }
    }
    @IBAction func GreenButtonAction(_ sender: Any) {
        if flag1 == 1{
            BackgroundImage.image = #imageLiteral(resourceName: "forest_bg_1")
            alarmsoundpick = "Forest2"
            playsong()
            player.play()
        }
        else{
            BackgroundImage.image = #imageLiteral(resourceName: "forest_bg_1")
            alarmsoundpick = "Forest2"
        }
    }
    @IBAction func BlueButtonAction(_ sender: Any) {
        if flag1 == 1{
            BackgroundImage.image = #imageLiteral(resourceName: "ocean_bg")
            alarmsoundpick = "Ocean Waves"
            playsong()
            player.play()
        }
        else{
            BackgroundImage.image = #imageLiteral(resourceName: "ocean_bg")
            alarmsoundpick = "Ocean Waves"
        }
    }
    
    
    @IBAction func MusicPlayAction(_ sender: Any) {
        if flag1 == 0{
            flag1 = 1
            playsong()
            PlayMusicButton.setImage(#imageLiteral(resourceName: "pause_button"), for: .normal)
            player.play()
        }
        else{
            flag1 = 0
            PlayMusicButton.setImage(#imageLiteral(resourceName: "play_button"), for: .normal)
            player.pause()
        }
        
    }
    @IBAction func MusicRepeatAction(_ sender: Any) {
        player.stop()
        player.play()
    }
    @IBAction func MusicMuteAction(_ sender: Any) {
        if flag2 == 0 {
            flag2 = 1
            MuteMusicButton.setImage(#imageLiteral(resourceName: "mute_button"), for: .normal)
            player.stop()
        }
        else{
            flag2 = 0
            MuteMusicButton.setImage(#imageLiteral(resourceName: "sound_on_button"), for: .normal)
            player.play()
        }
        
        
    }
    
    @objc func handledone() {
        
        print("BUtton Home press")
        
        let timerstartview = self.storyboard?.instantiateViewController(identifier: "TabBar") as! TabBarViewController
        
        self.navigationController?.pushViewController(timerstartview, animated: true)
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
