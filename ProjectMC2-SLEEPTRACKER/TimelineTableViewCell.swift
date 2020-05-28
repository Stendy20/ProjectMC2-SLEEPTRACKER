//
//  TimelineTableViewCell.swift
//  ProjectMC2-SLEEPTRACKER
//
//  Created by Michael Sanjaya on 29/05/20.
//  Copyright © 2020 Stendy Antonio. All rights reserved.
//

import UIKit

class TimelineTableViewCell: UITableViewCell {

    @IBOutlet weak var cellView: UIView!
    
    @IBOutlet weak var cellDate: UILabel!
    @IBOutlet weak var cellDuration: UILabel!
    @IBOutlet weak var cellMood: UILabel!
    
    @IBOutlet weak var markerView: UIView!
    @IBOutlet weak var barEmptyView: UIView!
    @IBOutlet weak var barView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
