//
//  MWLVLSectionDesignData.swift
//  ResiBeam_V0.0.7
//
//  Created by Mark Walker on 8/17/16.
//  Copyright © 2016 Mark Walker. All rights reserved.
//

import UIKit

class MWLVLSectionDesignData: NSObject {

    
    //MARK:Pubic Var
    var shapeSelected:Bool = true
    //var species:speciesEnum = .SYP
    //var grade:woodGradeEnum = .No2
    var shape:NSString = "1 - 1 3/4 x 7 1/4"
    //var shapeType:NSString = "Rectangular"  //Rectangular, I , or L
    var depth:Double = 7.25 //value in inches
    var width:Double = 1.75 //value in inches
    var area:Double = 12.69 //value in inches^2
    var sectionModulus:Double = 15.33 //value in inches^3
    var I:Double = 1
    var vArea:Double  = 1//value for shear calculation
    
    var selectedShapeIndex:Int = 0
    
    
    
    //MARK:Public Functions
    override init(){
        super.init()
    }
    
    init(selectedRow:Int){
        super.init()
        self.selectedShapeIndex = selectedRow
        
        
        setSectionData(selectedRow)
        I = width * depth * depth * depth/12
        vArea = depth * width
    }
    
    
    
    func setSectionData(_ selectedRow:Int){
        
        selectedShapeIndex = selectedRow
        
        if selectedRow == 0 {
            self.shapeSelected = true
            self.shape = "1 - 1 3/4 x 7 1/4"
            self.mySetDepth(7.25)
            self.mySetWidth(1.75)
            self.area = self.depth * self.width
            self.sectionModulus = self.depth * self.depth * self.width / 6
        }else if selectedRow == 1{
            self.shapeSelected = true
            self.shape = "2 - 1 3/4 x 7 1/4"
            self.mySetDepth(7.25)
            self.mySetWidth(3.50)
            self.area = self.depth * self.width
            self.sectionModulus = self.depth * self.depth * self.width / 6
        }else if selectedRow == 2 {
            self.shapeSelected = true
            self.shape = "3 - 1 3/4 x 7 1/4"
            self.mySetDepth(7.25)
            self.mySetWidth(5.25)
            self.area = self.depth * self.width
            self.sectionModulus = self.depth * self.depth * self.width / 6
        }else if selectedRow == 3 {
            self.shapeSelected = true
            self.shape = "4 - 1 3/4 x 7 1/4"
            self.mySetDepth(7.25)
            self.mySetWidth(7.00)
            self.area = self.depth * self.width
            self.sectionModulus = self.depth * self.depth * self.width / 6
        }else if selectedRow == 4 {
            self.shapeSelected = true
            self.shape = "1 - 1 3/4 x 9 1/4"
            self.mySetDepth(9.25)
            self.mySetWidth(1.75)
            self.area = self.depth * self.width
            self.sectionModulus = self.depth * self.depth * self.width / 6
        }else if selectedRow == 5 {
            self.shapeSelected = true
            self.shape = "2 - 1 3/4 x 9 1/4"
            self.mySetDepth(9.25)
            self.mySetWidth(3.50)
            self.area = self.depth * self.width
            self.sectionModulus = self.depth * self.depth * self.width / 6
            self.sectionModulus = self.depth * self.depth * self.width / 6
        }else if selectedRow == 6 {
            self.shapeSelected = true
            self.shape = "3 - 1 3/4 x 9 1/4"
            self.mySetDepth(9.25)
            self.mySetWidth(5.25)
            self.area = self.depth * self.width
            self.sectionModulus = self.depth * self.depth * self.width / 6
        }else if selectedRow == 7 {
            self.shapeSelected = true
            self.shape = "4 - 1 3/4 x 9 1/4"
            self.mySetDepth(9.25)
            self.mySetWidth(7.00)
            self.area = self.depth * self.width
            self.sectionModulus = self.depth * self.depth * self.width / 6
        }else if selectedRow == 8 {
            self.shapeSelected = true
            self.shape = "1 - 1 3/4 x 9 1/2"
            self.mySetDepth(9.5)
            self.mySetWidth(1.75)
            self.area = self.depth * self.width
            self.sectionModulus = self.depth * self.depth * self.width / 6
        }else if selectedRow == 9 {
            self.shapeSelected = true
            self.shape = "2 - 1 3/4 x 9 1/2"
            self.mySetDepth(9.5)
            self.mySetWidth(3.50)
            self.area = self.depth * self.width
            self.sectionModulus = self.depth * self.depth * self.width / 6
        }else if selectedRow == 10 {
            self.shapeSelected = true
            self.shape = "3 - 1 3/4 x 9 1/2"
            self.mySetDepth(9.5)
            self.mySetWidth(5.25)
            self.area = self.depth * self.width
            self.sectionModulus = self.depth * self.depth * self.width / 6
        }else if selectedRow == 11{
            self.shapeSelected = true
            self.shape = "4 - 1 3/4 x 9 1/2"
            self.mySetDepth(9.5)
            self.mySetWidth(7.00)
            self.area = self.depth * self.width
            self.sectionModulus = self.depth * self.depth * self.width / 6
        }else if selectedRow == 12{
            self.shapeSelected = true
            self.shape = "1 - 1 3/4 x 11 1/4"
            self.mySetDepth(11.25)
            self.mySetWidth(1.75)
            self.area = self.depth * self.width
            self.sectionModulus = self.depth * self.depth * self.width / 6
        }else if selectedRow == 13{
            self.shapeSelected = true
            self.shape = "2 - 1 3/4 x 11 1/4"
            self.mySetDepth(11.25)
            self.mySetWidth(3.50)
            self.area = self.depth * self.width
            self.sectionModulus = self.depth * self.depth * self.width / 6
        }else if selectedRow == 14{
            self.shapeSelected = true
            self.shape = "3 - 1 3/4 x 11 1/4"
            self.mySetDepth(11.25)
            self.mySetWidth(5.25)
            self.area = self.depth * self.width
            self.sectionModulus = self.depth * self.depth * self.width / 6
        }else if selectedRow == 15{
            self.shapeSelected = true
            self.shape = "4 - 1 3/4 x 11 1/4"
            self.mySetDepth(11.25)
            self.mySetWidth(7.00)
            self.area = self.depth * self.width
            self.sectionModulus = self.depth * self.depth * self.width / 6
        }else if selectedRow == 16{
            self.shapeSelected = true
            self.shape = "1 - 1 3/4 x 11 7/8"
            self.mySetDepth(11.875)
            self.mySetWidth(1.75)
            self.area = self.depth * self.width
            self.sectionModulus = self.depth * self.depth * self.width / 6
        }else if selectedRow == 17{
            self.shapeSelected = true
            self.shape = "2 - 1 3/4 x 11 7/8"
            self.mySetDepth(11.875)
            self.mySetWidth(3.50)
            self.area = self.depth * self.width
            self.sectionModulus = self.depth * self.depth * self.width / 6
        }else if selectedRow == 18{
            self.shapeSelected = true
            self.shape = "3 - 1 3/4 x 11 7/8"
            self.mySetDepth(11.875)
            self.mySetWidth(5.25)
            self.area = self.depth * self.width
            self.sectionModulus = self.depth * self.depth * self.width / 6
        }else if selectedRow == 19{
            self.shapeSelected = true
            self.shape = "4 - 1 3/4 x 11 7/8"
            self.mySetDepth(11.875)
            self.mySetWidth(7.00)
            self.area = self.depth * self.width
            self.sectionModulus = self.depth * self.depth * self.width / 6
        }else if selectedRow == 20{
            self.shapeSelected = true
            self.shape = "1 - 1 3/4 x 14"
            self.mySetDepth(14.00)
            self.mySetWidth(1.75)
            self.area = self.depth * self.width
            self.sectionModulus = self.depth * self.depth * self.width / 6
        }else if selectedRow == 21{
            self.shapeSelected = true
            self.shape = "2 - 1 3/4 x 14"
            self.mySetDepth(14.00)
            self.mySetWidth(3.50)
            self.area = self.depth * self.width
            self.sectionModulus = self.depth * self.depth * self.width / 6
        }else if selectedRow == 22{
            self.shapeSelected = true
            self.shape = "3 - 1 3/4 x 14"
            self.mySetDepth(14.00)
            self.mySetWidth(5.25)
            self.area = self.depth * self.width
            self.sectionModulus = self.depth * self.depth * self.width / 6
        }else if selectedRow == 23{
            self.shapeSelected = true
            self.shape = "4 - 1 3/4 x 14"
            self.mySetDepth(14.00)
            self.mySetWidth(7.00)
            self.area = self.depth * self.width
            self.sectionModulus = self.depth * self.depth * self.width / 6
        }else if selectedRow == 24{
            self.shapeSelected = true
            self.shape = "1 - 1 3/4 x 16"
            self.mySetDepth(16.00)
            self.mySetWidth(1.75)
            self.area = self.depth * self.width
            self.sectionModulus = self.depth * self.depth * self.width / 6
        }else if selectedRow == 25{
            self.shapeSelected = true
            self.shape = "2 - 1 3/4 x 16"
            self.mySetDepth(16.00)
            self.mySetWidth(3.50)
            self.area = self.depth * self.width
            self.sectionModulus = self.depth * self.depth * self.width / 6
        }else if selectedRow == 26{
            self.shapeSelected = true
            self.shape = "3 - 1 3/4 x 16"
            self.mySetDepth(16.00)
            self.mySetWidth(5.25)
            self.area = self.depth * self.width
            self.sectionModulus = self.depth * self.depth * self.width / 6
        }else if selectedRow == 27{
            self.shapeSelected = true
            self.shape = "4 - 1 3/4 x 16"
            self.mySetDepth(16.00)
            self.mySetWidth(7.00)
            self.area = self.depth * self.width
            self.sectionModulus = self.depth * self.depth * self.width / 6
        }else if selectedRow == 28{
            self.shapeSelected = true
            self.shape = "1 - 1 3/4 x 18"
            self.mySetDepth(18.00)
            self.mySetWidth(1.75)
            self.area = self.depth * self.width
            self.sectionModulus = self.depth * self.depth * self.width / 6
        }else if selectedRow == 29{
            self.shapeSelected = true
            self.shape = "2 - 1 3/4 x 18"
            self.mySetDepth(18.00)
            self.mySetWidth(3.50)
            self.area = self.depth * self.width
            self.sectionModulus = self.depth * self.depth * self.width / 6
        }else if selectedRow == 30{
            self.shapeSelected = true
            self.shape = "3 - 1 3/4 x 18"
            self.mySetDepth(18.00)
            self.mySetWidth(5.25)
            self.area = self.depth * self.width
            self.sectionModulus = self.depth * self.depth * self.width / 6
        }else if selectedRow == 31{
            self.shapeSelected = true
            self.shape = "4 - 1 3/4 x 18"
            self.mySetDepth(18.00)
            self.mySetWidth(7.00)
            self.area = self.depth * self.width
            self.sectionModulus = self.depth * self.depth * self.width / 6
        }else if selectedRow == 32{
            self.shapeSelected = true
            self.shape = "1 - 1 3/4 x 20"
            self.mySetDepth(20.00)
            self.mySetWidth(1.75)
            self.area = self.depth * self.width
            self.sectionModulus = self.depth * self.depth * self.width / 6
        }else if selectedRow == 33{
            self.shapeSelected = true
            self.shape = "2 - 1 3/4 x 20"
            self.mySetDepth(20.00)
            self.mySetWidth(3.50)
            self.area = self.depth * self.width
            self.sectionModulus = self.depth * self.depth * self.width / 6
        }else if selectedRow == 34{
            self.shapeSelected = true
            self.shape = "3 - 1 3/4 x 20"
            self.mySetDepth(20.00)
            self.mySetWidth(5.25)
            self.area = self.depth * self.width
            self.sectionModulus = self.depth * self.depth * self.width / 6
        }else if selectedRow == 35{
            self.shapeSelected = true
            self.shape = "4 - 1 3/4 x 20"
            self.mySetDepth(20.00)
            self.mySetWidth(7.00)
            self.area = self.depth * self.width
            self.sectionModulus = self.depth * self.depth * self.width / 6
        }else if selectedRow == 36{
            self.shapeSelected = true
            self.shape = "1 - 1 3/4 x 24"
            self.mySetDepth(24.00)
            self.mySetWidth(1.75)
            self.area = self.depth * self.width
            self.sectionModulus = self.depth * self.depth * self.width / 6
        }else if selectedRow == 37{
            self.shapeSelected = true
            self.shape = "2 - 1 3/4 x 24"
            self.mySetDepth(24.00)
            self.mySetWidth(3.5)
            self.area = self.depth * self.width
            self.sectionModulus = self.depth * self.depth * self.width / 6
        }else if selectedRow == 38{
            self.shapeSelected = true
            self.shape = "3 - 1 3/4 x 24"
            self.mySetDepth(24.00)
            self.mySetWidth(5.25)
            self.area = self.depth * self.width
            self.sectionModulus = self.depth * self.depth * self.width / 6
        }else if selectedRow == 39{
            self.shapeSelected = true
            self.shape = "4 - 1 3/4 x 24"
            self.mySetDepth(24.00)
            self.mySetWidth(7.00)
            self.area = self.depth * self.width
            self.sectionModulus = self.depth * self.depth * self.width / 6
        }
        
        //set the moment of inertia for all of the LVL sections
        self.I = self.width * self.depth * self.depth * self.depth / 12
        //set the shear area for LVL section (rectangular)
        self.vArea = self.width * self.depth
        
        
        
        
    }
    
    
    
    //MARK: Private Functions
    
    //func to be used with a custom retangular shape
    fileprivate func mySetDepth(_ theDepth:Double){
        depth = theDepth
        area = depth * width
        sectionModulus = width * depth * depth / 6
        I = width * depth * depth * depth/12
    }
    
    //func to be used with a custom retangular shape
    fileprivate func mySetWidth(_ theWidth:Double){
        width = theWidth
        area = depth * width
        sectionModulus = width * depth * depth / 6
        I = width * depth * depth * depth/12
    }
    
    
    //MARK: NSCoding Conformance
    required init?(coder aDecoder: NSCoder) {
        super.init()
        
        shape = aDecoder.decodeObject(forKey: "shape") as! NSString
        depth = aDecoder.decodeDouble(forKey: "depth")
        width = aDecoder.decodeDouble(forKey: "width")
        area = aDecoder.decodeDouble(forKey: "area")
        sectionModulus = aDecoder.decodeDouble(forKey: "sectionModulus")
        I = aDecoder.decodeDouble(forKey: "I")
        vArea = aDecoder.decodeDouble(forKey: "vArea")
        selectedShapeIndex = aDecoder.decodeInteger(forKey: "selectedShapeIndex")
    }
    
    
    func encodeWithCoder(_ aCoder: NSCoder) {
        aCoder.encode(shape, forKey: "shape")
        aCoder.encode(depth, forKey: "depth")
        aCoder.encode(width, forKey: "width")
        aCoder.encode(area, forKey: "area")
        aCoder.encode(sectionModulus, forKey: "sectionModulus")
        aCoder.encode(I, forKey: "I")
        aCoder.encode(vArea, forKey: "vArea")
        
    }
    
}

