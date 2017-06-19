//
//  MWSteelMaterialLimits.swift
//  ResiBeam_V0.0.7
//
//  Created by Mark Walker on 8/23/16.
//  Copyright © 2016 Mark Walker. All rights reserved.
//

import Foundation

class MWSteelMaterialLimits: NSObject {
    var grade = steelGradeEnum.ksi50
    var Fy:Double = 1
    var Fb:Double = 1
    //var Ft:Double = 1
    var Fv:Double = 1
    //var Fcp:Double = 1
    //var Fc:Double = 1
    var E:Double = 1
    //var Emin:Double = 1
    var deflectionLimit:Int = 240
    
    
    
    override init() {
        super.init()
    }
    
    //MARK: NSCoding Conformance
    required init?(coder aDecoder: NSCoder) {
        super.init()
        
        
        var gradeRawValue:String = ""
        gradeRawValue = aDecoder.decodeObject(forKey: "gradeRawValue") as! String
        if gradeRawValue == "50 ksi"{
            grade = steelGradeEnum.ksi50
        }else if gradeRawValue == "36 ksi"{
            grade = steelGradeEnum.ksi36
        }
        
        Fy = aDecoder.decodeDouble(forKey: "Fy")
        Fb = aDecoder.decodeDouble(forKey: "Fb")
        //Ft = aDecoder.decodeDoubleForKey("Ft")
        Fv = aDecoder.decodeDouble(forKey: "Fv")
        //Fcp = aDecoder.decodeDoubleForKey("Fcp")
        //Fc = aDecoder.decodeDoubleForKey("Fc")
        E = aDecoder.decodeDouble(forKey: "E")
        //Emin = aDecoder.decodeDoubleForKey("Emin")
        deflectionLimit = aDecoder.decodeInteger(forKey: "deflectionLimit")
        
        
        
        
        
        
    }
    
    
    func encodeWithCoder(_ aCoder: NSCoder) {
        
        let gradeRawValue = grade.rawValue
        aCoder.encode(gradeRawValue, forKey: "gradeRawValue")
        
        aCoder.encode(Fy, forKey: "Fy")
        aCoder.encode(Fb, forKey: "Fb")
        //aCoder.encodeDouble(Ft, forKey: "Ft")
        aCoder.encode(Fv, forKey: "Fv")
        //aCoder.encodeDouble(Fcp, forKey: "Fcp")
        //aCoder.encodeDouble(Fc, forKey: "Fc")
        aCoder.encode(E, forKey: "E")
        //aCoder.encodeDouble(Emin, forKey: "Emin")
        aCoder.encode(deflectionLimit, forKey: "deflectionLimit")
        
    }
}
