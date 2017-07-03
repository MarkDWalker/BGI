//
//  myProtocols.swift
//  BeamGrapherForIpadV_0.0.3
//
//  Created by Mark Walker on 6/7/15.
//  Copyright (c) 2015 Mark Walker. All rights reserved.
//

import UIKit

protocol MyCellDelegator {
    func callSegueFromCell(_ theSender: AnyObject, theSegueIdentifier:String)
}

protocol MyEditBeamGeoDelegator{
    func updateBeamGeo(_ beam:MWBeamGeometry)
    func updateGraphs()
}

protocol MyEditLoadDelegator{
    func updateLoad(_ load:MWLoadData, indexOfLoad:Int)
}

protocol DesignTypeDisplayer{
    func updateDesignTypeDisplay(theType:String)
}

protocol hasMemberRowToUpdate{
    func updateMemberRow(row:Int)
}

protocol hasMemberGradeToUpdate{
    func updateGradeRow(row:Int)
}

extension UITableView{
    
    func getSnapShot(scaleFactor:CGFloat) -> UIImage{
        let width:CGFloat = self.frame.size.width
        let height:CGFloat = self.frame.size.height
        
        
        
        UIGraphicsBeginImageContextWithOptions(CGSize(width: width, height: height), false, UIScreen.main.scale)
        drawHierarchy(in: CGRect(x: 0, y: 30, width: width * scaleFactor, height: height * scaleFactor), afterScreenUpdates: true)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image!
    }
}
