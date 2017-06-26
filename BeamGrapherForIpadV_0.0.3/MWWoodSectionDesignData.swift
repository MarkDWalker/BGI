//
//  MWGeneralSectionDesignData.swift
//  BeamDesigner
//
//  Created by Mark Walker on 3/26/15.
//  Copyright (c) 2015 Mark Walker. All rights reserved.
//

import UIKit



class MWWoodSectionDesignData:NSObject, NSCoding{
    
    //MARK:Pubic Var
   var shapeSelected:Bool = true
    //var species:speciesEnum = .SYP
    //var grade:woodGradeEnum = .No2
    var shape:NSString = "2-2x8"
    //var shapeType:NSString = "Rectangular"  //Rectangular, I , or L
    var depth:Double = 7.5 //value in inches
    var width:Double = 3.0 //value in inches
    var area:Double = 22.5 //value in inches^2
    var sectionModulus:Double = 28.13 //value in inches^3
    var I:Double = 105.46
    var vArea:Double  = 1//value for shear calculation
    
    var selectedShapeIndex:Int = 7
    
    
    
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
                
                self.shape = "1-2x4"
                self.mySetDepth(3.5)
                self.mySetWidth(1.5)
                self.area = self.depth * self.width
                self.sectionModulus = self.depth * self.depth * self.width / 6
            }else if selectedRow == 1{
                
                self.shape = "2-2x4"
                self.mySetDepth(3.5)
                self.mySetWidth(3.0)
                self.area = self.depth * self.width
                self.sectionModulus = self.depth * self.depth * self.width / 6
            }else if selectedRow == 2 {
                
                
                self.shape = "3-2x4"
                self.mySetDepth(3.5)
                self.mySetWidth(4.5)
                self.area = self.depth * self.width
                self.sectionModulus = self.depth * self.depth * self.width / 6
            }else if selectedRow == 3 {
                
                
                self.shape = "4-2x4"
                self.mySetDepth(3.5)
                self.mySetWidth(6)
                self.area = self.depth * self.width
                self.sectionModulus = self.depth * self.depth * self.width / 6
            }else if selectedRow == 4 {
                
                
                self.shape = "5-2x4"
                self.mySetDepth( 3.5)
                self.mySetWidth( 7.5)
                self.area = self.depth * self.width
                self.sectionModulus = self.depth * self.depth * self.width / 6
            }else if selectedRow == 5 {
                
                
                self.shape = "6-2x4"
                self.mySetDepth( 3.5)
                self.mySetWidth( 9)
                self.area = self.depth * self.width
                self.sectionModulus = self.depth * self.depth * self.width / 6
            }else if selectedRow == 6 {
                
                
                self.shape = "1-2x6"
                self.mySetDepth( 5.5)
                self.mySetWidth( 1.5)
                self.area = self.depth * self.width
                self.sectionModulus = self.depth * self.depth * self.width / 6
            }else if selectedRow == 7 {
                
                
                self.shape = "2-2x6"
                self.mySetDepth( 5.5)
                self.mySetWidth( 3.0)
                self.area = self.depth * self.width
                self.sectionModulus = self.depth * self.depth * self.width / 6
            }else if selectedRow == 8 {
                
                
                self.shape = "3-2x6"
                self.mySetDepth( 5.5)
                self.mySetWidth( 4.5)
                self.area = self.depth * self.width
                self.sectionModulus = self.depth * self.depth * self.width / 6
            }else if selectedRow == 9 {
                
                
                
                self.shape = "4-2x6"
                self.mySetDepth( 5.5)
                self.mySetWidth( 6.0)
                self.area = self.depth * self.width
                self.sectionModulus = self.depth * self.depth * self.width / 6
            }else if selectedRow == 10 {
                
                
                self.shape = "5-2x6"
                self.mySetDepth( 5.5)
                self.mySetWidth( 7.5)
                self.area = self.depth * self.width
                self.sectionModulus = self.depth * self.depth * self.width / 6
            }else if selectedRow == 11{
                
                
                self.shape = "6-2x6"
                self.mySetDepth(5.5)
                self.mySetWidth(9.0)
                self.area = self.depth * self.width
                self.sectionModulus = self.depth * self.depth * self.width / 6
            }else if selectedRow == 12{
                
                
                self.shape = "1-2x8"
                self.mySetDepth(7.5)
                self.mySetWidth(1.5)
                self.area = self.depth * self.width
                self.sectionModulus = self.depth * self.depth * self.width / 6
            }else if selectedRow == 13{
                
                
                self.shape = "2-2x8"
                self.mySetDepth(7.5)
                self.mySetWidth(3.0)
                self.area = self.depth * self.width
                self.sectionModulus = self.depth * self.depth * self.width / 6
            }else if selectedRow == 14{
                
                
                self.shape = "3-2x8"
                self.mySetDepth(7.5)
                self.mySetWidth(4.5)
                self.area = self.depth * self.width
                self.sectionModulus = self.depth * self.depth * self.width / 6
            }else if selectedRow == 15{
                
                
                self.shape = "4-2x8"
                self.mySetDepth(7.5)
                self.mySetWidth(6.0)
                self.area = self.depth * self.width
                self.sectionModulus = self.depth * self.depth * self.width / 6
            }else if selectedRow == 16{
                
                
                self.shape = "5-2x8"
                self.mySetDepth(7.5)
                self.mySetWidth(7.5)
                self.area = self.depth * self.width
                self.sectionModulus = self.depth * self.depth * self.width / 6
            }else if selectedRow == 17{
                
                
                self.shape = "6-2x8"
                self.mySetDepth(7.5)
                self.mySetWidth(9.0)
                self.area = self.depth * self.width
                self.sectionModulus = self.depth * self.depth * self.width / 6
            }else if selectedRow == 18{
                
                
                self.shape = "1-2x10"
                self.mySetDepth(9.5)
                self.mySetWidth(1.5)
                self.area = self.depth * self.width
                self.sectionModulus = self.depth * self.depth * self.width / 6
            }else if selectedRow == 19{
                
                
                self.shape = "2-2x10"
                self.mySetDepth(9.5)
                self.mySetWidth(3.0)
                self.area = self.depth * self.width
                self.sectionModulus = self.depth * self.depth * self.width / 6
            }else if selectedRow == 20{
                
                
                self.shape = "3-2x10"
                self.mySetDepth(9.5)
                self.mySetWidth(4.5)
                self.area = self.depth * self.width
                self.sectionModulus = self.depth * self.depth * self.width / 6
            }else if selectedRow == 21{
                
                
                self.shape = "4-2x10"
                self.mySetDepth(9.5)
                self.mySetWidth(6.0)
                self.area = self.depth * self.width
                self.sectionModulus = self.depth * self.depth * self.width / 6
            }else if selectedRow == 22{
                
                
                self.shape = "5-2x10"
                self.mySetDepth(9.5)
                self.mySetWidth(7.5)
                self.area = self.depth * self.width
                self.sectionModulus = self.depth * self.depth * self.width / 6
            }else if selectedRow == 23{
                
                
                
                self.shape = "6-2x10"
                self.mySetDepth(9.5)
                self.mySetWidth(9.0)
                self.area = self.depth * self.width
                self.sectionModulus = self.depth * self.depth * self.width / 6
            }else if selectedRow == 24{
                
                
                
                self.shape = "1-2x12"
                self.mySetDepth(11.25)
                self.mySetWidth(1.5)
                self.area = self.depth * self.width
                self.sectionModulus = self.depth * self.depth * self.width / 6
            }else if selectedRow == 25{
                
                
                
                self.shape = "2-2x12"
                self.mySetDepth(11.25)
                self.mySetWidth(3.0)
                self.area = self.depth * self.width
                self.sectionModulus = self.depth * self.depth * self.width / 6
            }else if selectedRow == 26{
                
                
                
                self.shape = "3-2x12"
                self.mySetDepth(11.25)
                self.mySetWidth(4.5)
                self.area = self.depth * self.width
                self.sectionModulus = self.depth * self.depth * self.width / 6
            }else if selectedRow == 27{
                
                
                
                self.shape = "4-2x12"
                self.mySetDepth(11.25)
                self.mySetWidth(6.0)
                self.area = self.depth * self.width
                self.sectionModulus = self.depth * self.depth * self.width / 6
            }else if selectedRow == 28{
                
                
                
                self.shape = "5-2x12"
                self.mySetDepth(11.25)
                self.mySetWidth(7.5)
                self.area = self.depth * self.width
                self.sectionModulus = self.depth * self.depth * self.width / 6
            }else if selectedRow == 29{
                
                
                
                self.shape = "6-2x12"
                self.mySetDepth(11.25)
                self.mySetWidth(9.0)
                self.area = self.depth * self.width
                self.sectionModulus = self.depth * self.depth * self.width / 6
                
            }
        
            //set the moment of inertia for all of the wood sections
            self.I = self.width * self.depth * self.depth * self.depth / 12
            //set the shear area for wood section (rectangular)
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
    
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(shape, forKey: "shape")
        aCoder.encode(depth, forKey: "depth")
        aCoder.encode(width, forKey: "width")
        aCoder.encode(area, forKey: "area")
        aCoder.encode(sectionModulus, forKey: "sectionModulus")
        aCoder.encode(I, forKey: "I")
        aCoder.encode(vArea, forKey: "vArea")
        
    }
    
}
