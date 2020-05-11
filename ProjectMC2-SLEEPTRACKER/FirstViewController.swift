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
    
    var flag = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        SliderView.layer.cornerRadius = 25
        
        SliderView.frame =  CGRect(x:0, y: 700, width:415, height:1000)
        
        CollectionViewStories.delegate = self
        CollectionViewStories.dataSource = self
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = CollectionViewStories.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CollectionViewCellStories
        
        return cell
    }
    
    @IBAction func SliderButtonAction(_ sender: Any) {
        if flag == 0{
            flag = 1
            
            SliderView.frame =  CGRect(x:0, y: 350, width:415, height:1000)
        }
        else if flag == 1{
            flag = 0
            
            SliderView.frame =  CGRect(x:0, y: 700, width:415, height:1000)
            
        }
    }
    
}

