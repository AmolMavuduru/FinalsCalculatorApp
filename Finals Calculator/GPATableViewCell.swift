//
//  GPATableViewCell.swift
//  Finals Calculator
//
//  Created by Amol on 5/7/17.
//  Copyright © 2017 Amol. All rights reserved.
//

import UIKit

class GPATableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }
    


    @IBOutlet var hoursLabel: UILabel!
    
    @IBOutlet var classLabel: UILabel!
    
    @IBOutlet var gradeLabel: UILabel!
    
    
    


    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
