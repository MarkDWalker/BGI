//
//  MWSteelWDesignValues.swift
//  ResiBeam_V0.0.7
//
//  Created by Mark Walker on 8/21/16.
//  Copyright © 2016 Mark Walker. All rights reserved.
//

import UIKit

class MWSteelWDesignValues: NSObject {

    var limits = MWSteelMaterialLimits()
    
    var steelFactors = MWSteelFactors()
    
    var FbAdjust:Double = 2900.00
    var FvAdjust:Double = 285.00
    var EAdjust:Double = 29000.00
    
    
    //MARK:Public Functions
    override init(){
        
        super.init()
        //this line sets the programmers desired startup values
        setValues(limits.grade)
        setAdjustedValues()
    }
    
    
    func setAdjustedValues(){
        FbAdjust = limits.Fb * steelFactors.fbSafetyFactor
        FvAdjust = limits.Fv * steelFactors.fvSafetyFactor
        
    }
    
    
    func setValues(_ theSteelGrade:steelGradeEnum){
        
        if theSteelGrade == .ksi36 {
            limits.grade = .ksi36
            limits.Fy = 36000 //psi
            limits.Fb = 36000  //psi
            limits.Fv = 36000  //psi
            limits.E = 29000.00 //ksi
            
        }else if theSteelGrade == .ksi50 {
            limits.grade = .ksi50
            limits.Fy = 50000 //psi
            limits.Fb = 50000  //psi
            limits.Fv = 50000  //psi
            limits.E = 29000.00 //ksi
           
        }
        
        setAdjustedValues()
    }
    
    //MARK: NSCoding Conformance
    required init?(coder aDecoder: NSCoder) {
        super.init()
        
        limits = aDecoder.decodeObject(forKey: "limits") as! MWSteelMaterialLimits
        steelFactors = aDecoder.decodeObject(forKey: "steelFactors") as! MWSteelFactors
        FbAdjust = aDecoder.decodeDouble(forKey: "FbAdjust")
        FvAdjust = aDecoder.decodeDouble(forKey: "FvAdjust")
        EAdjust = aDecoder.decodeDouble(forKey: "EAdjust")
        
        
        setAdjustedValues()
        
    }
    
    
    func encodeWithCoder(_ aCoder: NSCoder) {
        
        aCoder.encode(limits, forKey: "limits")
        aCoder.encode(steelFactors, forKey: "steelFactors")
        aCoder.encode(FbAdjust, forKey: "FbAdjust")
        aCoder.encode(FvAdjust, forKey: "FvAdjust")
        aCoder.encode(EAdjust, forKey: "EAdjust")
        
    }
    
}
