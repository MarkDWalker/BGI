//
//  CustomCell_StressResults.swift
//  BeamGrapherForIpadV_0.0.3
//
//  Created by Mark Walker on 6/25/17.
//  Copyright © 2017 Mark Walker. All rights reserved.
//

import UIKit

class CustomCell_StressResults: UITableViewCell {

    @IBOutlet weak var pt: UILabel!
    
    @IBOutlet weak var x: UILabel!
    
    @IBOutlet weak var FbAdjusted: UILabel!
    
    @IBOutlet weak var fbActual: UILabel!
    
    @IBOutlet weak var FvAdjusted: UILabel!
    
    @IBOutlet weak var fvActual: UILabel!
    
    @IBOutlet weak var deflection: UILabel!
    
    @IBOutlet weak var dRatio: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
