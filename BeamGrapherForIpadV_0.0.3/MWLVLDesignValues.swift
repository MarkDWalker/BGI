//
//  MWLVLDesignData.swift
//  ResiBeam_V0.0.7
//
//  Created by Mark Walker on 8/17/16.
//  Copyright © 2016 Mark Walker. All rights reserved.
//

import UIKit

class MWLVLDesignValues: NSObject {
    //MARK: Public Vars
    
    //Mark:Material Limits,Properies
    var limits:MWLVLMaterialLimits = MWLVLMaterialLimits()
    //end Material Limits-Properties
    
    //MARK: WoodFactors
    var wF:MWWoodFactors = MWWoodFactors()
    //end wood factors
    
    
    
    var FbAdjust:Double = 2900.00
    var FvAdjust:Double = 285.00
    var EAdjust:Double = 2000.00
    var FbStar:Double = 1 //variable for use in calculating the Cl adjustment factor
    
    //MARK:Public Functions
    override init(){
        
        super.init()
        //this line sets the programmers desired startup values
        setValues(limits.manufacturer, theGrade:limits.grade, memberWidth:7.5)
        setAdjustedValues()
    }
    
    
    init(theManfacturer:manufacturerEnum, theGrade:LVLGradeEnum, memberWidth:Double){
        
        super.init()
        
        setValues(limits.manufacturer, theGrade:limits.grade, memberWidth:memberWidth)
    }
    
    func setCustomValues(_ Fy:Double, Fb:Double, Fv:Double, E:Double, Emin:Double){
        
        self.limits.Fy = Fy
        self.limits.Fb = Fb
        self.limits.Fv = Fv
        self.limits.E = E
        self.limits.Emin = Emin
        
        setAdjustedValues()
    }
    
    
    func setValues(_ theManufacturer:manufacturerEnum,theGrade:LVLGradeEnum,memberWidth:Double){
        limits.manufacturer = theManufacturer
        limits.grade = theGrade
        
        if limits.manufacturer == .GeorgiaPacific {
            if limits.grade == .GPLam20{
                limits.Fb = 2900; limits.Ft = 1; limits.Fv = 285;
                limits.Fcp = 845; limits.Fc = 2600; limits.E = 2000; limits.Emin = 1 //ksi
            }
            //Adjust the Fb value per manufacturer's specifications
            limits.Fb = limits.Fb * pow((12 / memberWidth), (1/9))
            
        }else if limits.manufacturer == .Weyerhaeuser{
            if limits.grade == .Microlam20E{
                limits.Fb = 2600; limits.Ft = 1555; limits.Fv = 285;
                limits.Fcp = 750; limits.Fc = 2510; limits.E = 2000; limits.Emin = 1016.535 //ksi
            }
            //Adjust the Fb value per manufacturer's specifications
            limits.Fb = limits.Fb * pow((12 / memberWidth), (0.136))
            
        }
        
        setAdjustedValues()
    }//end function
    
    
    
    func setAdjustedValues(){
        FbAdjust = limits.Fb * wF.Cd * wF.CmFb * wF.CtFb * wF.Cl * wF.Cf * wF.Cfu * wF.Cr
        
        FvAdjust = limits.Fv * wF.Cd * wF.CmFv * wF.CtFv
        
        EAdjust = limits.E * wF.CmE * wF.CtE
        
        FbStar = limits.Fb * wF.Cd * wF.CmFb * wF.CtFb * wF.Cf * wF.Cr
        
    }
    
    
    //MARK: NSCoding Conformance
    required init?(coder aDecoder: NSCoder) {
        super.init()
        
        limits = aDecoder.decodeObject(forKey: "limits") as! MWLVLMaterialLimits
        wF = aDecoder.decodeObject(forKey: "wF") as! MWWoodFactors
        
        
        FbStar = aDecoder.decodeDouble(forKey: "FbStar")
        
        FbAdjust = aDecoder.decodeDouble(forKey: "FbAdjust")
        print("FbAdjust = \(FbAdjust)")
        FvAdjust = aDecoder.decodeDouble(forKey: "FvAdjust")
        EAdjust = aDecoder.decodeDouble(forKey: "EAdjust")
        
        
        setAdjustedValues()
        
    }
    
    
    func encodeWithCoder(_ aCoder: NSCoder) {
        
        aCoder.encode(limits, forKey: "limits")
        aCoder.encode(wF, forKey: "wF")
        aCoder.encode(FbStar, forKey: "FbStar")
        
        aCoder.encode(FbAdjust, forKey: "FbAdjust")
        aCoder.encode(FvAdjust, forKey: "FvAdjust")
        aCoder.encode(EAdjust, forKey: "EAdjust")
        
    }
    

}
