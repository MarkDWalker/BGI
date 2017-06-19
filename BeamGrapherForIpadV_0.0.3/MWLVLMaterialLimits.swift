//
//  MWLVLMaterialLimits.swift
//  ResiBeam_V0.0.7
//
//  Created by Mark Walker on 8/19/16.
//  Copyright © 2016 Mark Walker. All rights reserved.
//

import Foundation

class MWLVLMaterialLimits: NSObject {
    var manufacturer = manufacturerEnum.GeorgiaPacific
    var grade = LVLGradeEnum.GPLam20
    var Fy:Double = 1
    var Fb:Double = 1
    var Ft:Double = 1
    var Fv:Double = 1
    var Fcp:Double = 1
    var Fc:Double = 1
    var E:Double = 1
    var Emin:Double = 1
    var deflectionLimit:Int = 240
    
    override init() {
        super.init()
    }
    
    //MARK: NSCoding Conformance
    required init?(coder aDecoder: NSCoder) {
        super.init()
        
        var manufacturerRawValue = ""
        manufacturerRawValue = aDecoder.decodeObject(forKey: "manufacturerRawValue") as! String
        if manufacturerRawValue == "Geogia Pacific"{
            manufacturer = .GeorgiaPacific
           
        }else if manufacturerRawValue == "Weyerhaeuser"{
            manufacturer = .Weyerhaeuser
        }
        
        var gradeRawValue:String = ""
        gradeRawValue = aDecoder.decodeObject(forKey: "gradeRawValue") as! String
        if gradeRawValue == "GPLam2.0"{
            grade = LVLGradeEnum.GPLam20
        }else if gradeRawValue == "2.0E Microlam LVL"{
            grade = LVLGradeEnum.Microlam20E
        }
        
        Fy = aDecoder.decodeDouble(forKey: "Fy")
        Fb = aDecoder.decodeDouble(forKey: "Fb")
        Ft = aDecoder.decodeDouble(forKey: "Ft")
        Fv = aDecoder.decodeDouble(forKey: "Fv")
        Fcp = aDecoder.decodeDouble(forKey: "Fcp")
        Fc = aDecoder.decodeDouble(forKey: "Fc")
        E = aDecoder.decodeDouble(forKey: "E")
        Emin = aDecoder.decodeDouble(forKey: "Emin")
        deflectionLimit = aDecoder.decodeInteger(forKey: "deflectionLimit")
        
        
        
        
        
        
    }
    
    
    func encodeWithCoder(_ aCoder: NSCoder) {
        
        
        let manufacturerRawValue = manufacturer.rawValue
        aCoder.encode(manufacturerRawValue, forKey: "manufacturerRawValue")
        
        let gradeRawValue = grade.rawValue
        aCoder.encode(gradeRawValue, forKey: "gradeRawValue")
        
        aCoder.encode(Fy, forKey: "Fy")
        aCoder.encode(Fb, forKey: "Fb")
        aCoder.encode(Ft, forKey: "Ft")
        aCoder.encode(Fv, forKey: "Fv")
        aCoder.encode(Fcp, forKey: "Fcp")
        aCoder.encode(Fc, forKey: "Fc")
        aCoder.encode(E, forKey: "E")
        aCoder.encode(Emin, forKey: "Emin")
        aCoder.encode(deflectionLimit, forKey: "deflectionLimit")
        
    }
}
