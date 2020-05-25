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
    
    var sendindex = 0
    
    @IBOutlet weak var TextStories: UITextView!
    @IBOutlet weak var TitleStory: UILabel!
    @IBOutlet weak var WriterStories: UILabel!
    @IBOutlet weak var StoryImage: UIImageView!
    
    var flag = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if sendindex == 0{
            TitleStory.text = "THE GOBLIN AND THE HUCKSTER"
            WriterStories.text = "by Hans Andersen (6 mins)"
        }
        else if sendindex == 1{
            TitleStory.text = "SNOWFLAKES"
            WriterStories.text = "by Nathaniel Hawthorne (7 mins)"
        }
        else if sendindex == 2{
            TitleStory.text = "THE HAUNTED MIND"
            WriterStories.text = "by Nathaniel Hawthorne (7 mins)"
        }
        else if sendindex == 3{
            TitleStory.text = "THE HOLLOW OF THREE HILLS"
            WriterStories.text = "by Nathaniel Hawthorne (6 mins)"
        }
        // Do any additional setup after loading the view.
    }
    
    @IBAction func PlayPauseButton(_ sender: Any) {
        if flag == 0{
            PlayPauseOutlet.setImage(#imageLiteral(resourceName: "pause_button"), for: .normal)
            flag = 1
        }
        else if flag == 1{
            PlayPauseOutlet.setImage(#imageLiteral(resourceName: "play_button"), for: .normal)
            flag = 0
        }
    }
    
}
