//
//  CustomCell_FactorCell.swift
//  BeamGrapherForIpadV_0.0.3
//
//  Created by Mark Walker on 6/23/17.
//  Copyright © 2017 Mark Walker. All rights reserved.
//

import UIKit

class CustomCell_FactorCell: UITableViewCell {

    var delegate:MyCellDelegator?
    
    @IBOutlet weak var factorLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var fbFactorLabel: UILabel!
    @IBOutlet weak var fvFactorLabel: UILabel!
    @IBOutlet weak var eFactorLabel: UILabel!
    
    @IBAction func setFactor_BtnClick(_ sender: AnyObject) {
        
        if(self.delegate != nil){ //Just to be safe.
            self.delegate!.callSegueFromCell(sender,theSegueIdentifier:"editFactor")
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    

}
