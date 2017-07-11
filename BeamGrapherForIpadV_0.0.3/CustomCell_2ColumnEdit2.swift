//
//  CustomCell_2ColumnEdit2.swift
//  BeamGrapherForIpadV_0.0.3
//
//  Created by Mark Walker on 7/10/17.
//  Copyright © 2017 Mark Walker. All rights reserved.
//

import UIKit

class CustomCell_2Column_Edit2: UITableViewCell {

    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UITextField!
    
    var delegate:EditCellController?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func editTextField(_ sender: Any) {
        
        
    }
    @IBAction func editField(_ sender: UITextField) {
        if delegate != nil{
            delegate?.cellChanged()
        }
    }
}
