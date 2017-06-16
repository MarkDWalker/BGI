//
//  MWBeamGeometry.swift
//  BeamDesigner
//
//  Created by Mark Walker on 7/19/15.
//  Copyright (c) 2015 Mark Walker. All rights reserved.
//

import UIKit

class MWBeamGeometry: NSObject, NSCoding{
    
    // MARK: Public Vars
    var title:String = "B1"
    var length:Double = 10.0  //beam length
    var dataPointCount:Int = 19  //# of data points for the calc on the beam
    var E:Double = 1600
    var I:Double = 105.47
    
    var supportLocationA:Double = 0
    var supportLocationB:Double = 0
    
    
    //MARK: Public Functions
    override init(){
        
    }
    
    init(theLength:Double, theE:Double = 1600, theI:Double = 105.47){
        super.init()
        self.title = "B1"
        length = theLength
        E = theE
        I = theI
        supportLocationB = theLength
    }
    
    func myCopy()->MWBeamGeometry{
        let newBeamGeo = MWBeamGeometry()
        newBeamGeo.title = title
        newBeamGeo.length = length
        newBeamGeo.dataPointCount = dataPointCount
        newBeamGeo.E = E
        newBeamGeo.I = I
        newBeamGeo.supportLocationA = supportLocationA
        newBeamGeo.supportLocationB = supportLocationB
        
        return newBeamGeo
    }
    
    //MARK: NSCoding Conformance
    required init?(coder aDecoder: NSCoder) {
        super.init()
        
        title = aDecoder.decodeObject(forKey: "title") as! String
        length = aDecoder.decodeDouble(forKey: "length")
        dataPointCount = aDecoder.decodeInteger(forKey: "DataPointCount")
        E = aDecoder.decodeDouble(forKey: "E")
        I = aDecoder.decodeDouble(forKey: "I")
        supportLocationA = aDecoder.decodeDouble(forKey: "supportLocationA")
        supportLocationB = aDecoder.decodeDouble(forKey: "supportLocationB")
        
    }
    
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(title, forKey: "title")
        aCoder.encode(length, forKey: "length")
        aCoder.encode(dataPointCount, forKey: "DataPointCount")
        aCoder.encode(E, forKey: "E")
        aCoder.encode(I, forKey: "I")
        aCoder.encode(supportLocationA, forKey: "supportLocationA")
        aCoder.encode(supportLocationB, forKey: "supportLocationB")
    }
    
}
