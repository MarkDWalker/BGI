//
//  MWMaterialLimits-Properties.swift
//  BeamDesigner
//
//  Created by Mark Walker on 7/20/15.
//  Copyright (c) 2015 Mark Walker. All rights reserved.
//

import UIKit

class MWWoodMaterialLimits: NSObject, NSCoding{
    var species:speciesEnum = speciesEnum.syp
    var grade:woodGradeEnum = woodGradeEnum.no2
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
        
        var speciesRawValue:NSString = ""
        speciesRawValue = aDecoder.decodeObject(forKey: "speciesRawValue") as! NSString
        if speciesRawValue == "Southern Yellow Pine"{
            species = speciesEnum.syp
            print("speciesEnum.SYP")
        }else if speciesRawValue == "Custom"{
            species = speciesEnum.custom
            print("speciesEnum.Custom")
        }else if speciesRawValue == "N/A"{
            species = speciesEnum.na
            print("speciesEnum.na")
        }else{
            print("speciesEnum.else")
        }
        
        var gradeRawValue:NSString = ""
        gradeRawValue = aDecoder.decodeObject(forKey: "gradeRawValue") as! NSString
        if gradeRawValue == "DenseSelectStructural"{
            grade = woodGradeEnum.denseSelectStructural
        }else if gradeRawValue == "SelectStructural"{
            grade = woodGradeEnum.selectStructural
        }else if gradeRawValue == "NonDenseSelectStructural"{
            grade = woodGradeEnum.nonDenseSelectStructural
        }else if gradeRawValue == "No.1Dense"{
            grade = woodGradeEnum.no1Dense
        }else if gradeRawValue == "No.1"{
            grade = woodGradeEnum.no1
        }else if gradeRawValue == "No.1NonDense"{
            grade = woodGradeEnum.no1NonDense
        }else if gradeRawValue == "No.2Dense"{
            grade = woodGradeEnum.no2Dense
        }else if gradeRawValue == "No.2"{
            grade = woodGradeEnum.no2
        }else if gradeRawValue == "No.2NonDense"{
            grade = woodGradeEnum.no2NonDense
        }else if gradeRawValue == "No.3AndStud"{
            grade = woodGradeEnum.no3AndStud
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
    
    
    func encode(with aCoder: NSCoder) {
        
        
       let speciesRawValue:NSString = species.rawValue
        aCoder.encode(speciesRawValue, forKey: "speciesRawValue")
        
        let gradeRawValue:NSString = grade.rawValue
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
