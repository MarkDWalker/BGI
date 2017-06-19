//
//  MWWoodFactors.swift
//  BeamDesigner
//
//  Created by Mark Walker on 7/20/15.
//  Copyright (c) 2015 Mark Walker. All rights reserved.
//

import UIKit

class MWWoodFactors: NSObject, NSCoding {
    var Cd:Double = 1.0
    var CmFb:Double = 1.0
    var CmFv:Double = 1.0
    var CmE:Double = 1.0
    var CtFb:Double = 1.0
    var CtFv:Double = 1.0
    var CtE:Double = 1.0
    var Cl:Double = 1.0
    var ClCalcType:Int = 1
    var ClLu:Double = 1.0
    var Cf:Double = 1.0
    var Cfu:Double = 1.0
    var Cr:Double = 1.0
    
    
    
    override init(){
        super.init()
    }
    
    //MARK: NSCoding Conformance
    required init?(coder aDecoder: NSCoder) {
        super.init()
        
        Cd = aDecoder.decodeDouble(forKey: "Cd")
        CmFb = aDecoder.decodeDouble(forKey: "CmFb")
        CmFv = aDecoder.decodeDouble(forKey: "CmFv")
        CmE = aDecoder.decodeDouble(forKey: "CmE")
        CtFb = aDecoder.decodeDouble(forKey: "CtFb")
        CtFv = aDecoder.decodeDouble(forKey: "CtFv")
        CtE = aDecoder.decodeDouble(forKey: "CtE")
        Cl = aDecoder.decodeDouble(forKey: "Cl")
        ClCalcType = aDecoder.decodeInteger(forKey: "CLCaclcType")
        
        ClLu = aDecoder.decodeDouble(forKey: "ClLu")
        Cf = aDecoder.decodeDouble(forKey: "Cf")
        Cfu = aDecoder.decodeDouble(forKey: "Cfu")
        Cr = aDecoder.decodeDouble(forKey: "Cr")
        
    }
    
    
    func encode(with aCoder: NSCoder) {
        
        aCoder.encode(Cd, forKey: "Cd")
        aCoder.encode(CmFb, forKey: "CmFb")
        aCoder.encode(CmFv, forKey: "CmFv")
        aCoder.encode(CmE, forKey: "CmE")
        aCoder.encode(CtFb, forKey: "CtFb")
        aCoder.encode(CtFv, forKey: "CtFv")
        aCoder.encode(CtE, forKey: "CtE")
        aCoder.encode(Cl, forKey: "Cl")
        aCoder.encode(ClCalcType, forKey: "ClCalcType")
        
        aCoder.encode(ClLu, forKey: "ClLu")
        aCoder.encode(Cf, forKey: "Cf")
        aCoder.encode(Cfu, forKey: "Cfu")
        aCoder.encode(Cr, forKey: "Cr")
        
    }
    
    
}
