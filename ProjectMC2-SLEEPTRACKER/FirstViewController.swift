//
//  FirstViewController.swift
//  ProjectMC2-SLEEPTRACKER
//
//  Created by Stendy Antonio on 05/05/20.
//  Copyright © 2020 Stendy Antonio. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var SliderView: UIView!
    @IBOutlet weak var SliderButton: UIButton!
    @IBOutlet weak var CollectionViewStories: UICollectionView!
    
    @IBOutlet weak var ArrowImage: UIButton!
    
    var index = 0
    
    var storiesarray = ["THE GOBLIN AND THE HUCKSTER", "SNOWFLAKES", "THE HAUNTED MIND", "THE HOLLOW OF THREE HILLS" ]
    
    var flag = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
                
        SliderView.layer.cornerRadius = 25
        
        SliderView.frame =  CGRect(x:0, y: 700, width:415, height:1000)
        
        CollectionViewStories.delegate = self
        CollectionViewStories.dataSource = self
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return storiesarray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = CollectionViewStories.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CollectionViewCellStories
        
        if indexPath.item == 0{
            cell.Image.image = #imageLiteral(resourceName: "onboarding_1")
        }
        else if indexPath.item == 1{
            cell.Image.image = #imageLiteral(resourceName: "onboarding_4")
        }
        else if indexPath.item == 2{
            cell.Image.image = #imageLiteral(resourceName: "onboarding_4")
        }
        else if indexPath.item == 3{
            cell.Image.image = #imageLiteral(resourceName: "Char1Green")
        }
        
        cell.Label.text = storiesarray[indexPath.item]
        
        return cell
    }
    
     func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        
        if indexPath.item == 0 {
            index = 0
            performSegue(withIdentifier: "Story", sender: self)
        }
        else if indexPath.item == 1{
            index = 1
            performSegue(withIdentifier: "Story", sender: self)
        }
        else if indexPath.item == 2{
            index = 2
            performSegue(withIdentifier: "Story", sender: self)
        }
        else if indexPath.item == 3{
            index = 3
            performSegue(withIdentifier: "Story", sender: self)
        }
    }
    
    @IBAction func SliderButtonAction(_ sender: Any) {
        if flag == 0{
            flag = 1
            ArrowImage.setImage(#imageLiteral(resourceName: "down-arrow"), for: .normal)
            SliderView.frame =  CGRect(x:0, y: 420, width:415, height:1000)
            
        }
        else if flag == 1{
            flag = 0
            ArrowImage.setImage(#imageLiteral(resourceName: "up-arrow"), for: .normal)
            SliderView.frame =  CGRect(x:0, y: 700, width:415, height:1000)
            
        }
    }
    
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            var vc = segue.destination as! DetailStoryController
            vc.sendindex = self.index
        }
    
}

