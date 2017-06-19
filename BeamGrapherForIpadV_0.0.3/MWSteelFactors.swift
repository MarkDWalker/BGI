//
//  MWSteelFactors.swift
//  BeamDesigner
//
//  Created by Mark Walker on 7/20/15.
//  Copyright (c) 2015 Mark Walker. All rights reserved.
//

import Foundation

class MWSteelFactors: NSObject, NSCoding {
    var fbSafetyFactor:Double = 0.66
    var fbSFCalcType:Int = 1
    
    var FSLu:Double = 12 //inches
    
    var fvSafetyFactor:Double = 0.40
    var fvSFCalcType:Int = 1
    
    
    override init() {
        super.init()
    }
    
    //MARK: NSCoding Conformance
    required init?(coder aDecoder: NSCoder) {
        super.init()
        
        fbSafetyFactor = aDecoder.decodeDouble(forKey: "fbSafetyFactor")
        fbSFCalcType = aDecoder.decodeInteger(forKey: "fbSFCalcType")
        FSLu = aDecoder.decodeDouble(forKey: "FSLu")
        fvSafetyFactor = aDecoder.decodeDouble(forKey: "fvSafetyFactor")
        fvSFCalcType = aDecoder.decodeInteger(forKey: "fvSFCalcType")

    }
    
    
    func encode(with aCoder: NSCoder) {
        
        aCoder.encode(fbSafetyFactor, forKey: "fbSafetyFactor")
        aCoder.encode(fbSFCalcType, forKey: "fbSFCalcType")
        aCoder.encode(FSLu, forKey: "FSLu")
        aCoder.encode(fvSafetyFactor, forKey: "fvSafetyFactor")
        aCoder.encode(fvSFCalcType, forKey: "fvSFCalcType")
    }
}























