//
//  MWLoadedDesignSection.swift
//  BeamDesigner
//
//  Created by Mark Walker on 3/26/15.
//  Copyright (c) 2015 Mark Walker. All rights reserved.
//

import UIKit

class MWWoodLoadedDesignSection:NSObject, NSCoding{
    
    
    //MARK: Public Vars
//var sectionData = MWWoodSectionDesignData()
var useModSection:Bool = false
var location:Double = 0 //value on feet
var designShear:Double = 0 //value in kips
var designMoment:Double = 0 //value in ft-kips
var deflection:Double = 0 //inches
    
var shearStress:Double=0 //ksi
var bendingStress:Double=0 //ksi


    
    
    //MARK:Public Functions
    //init(thesectionData:MWWoodSectionDesignData){
    //sectionData = thesectionData
    //}

    override init(){
        
    }
    
    func setShear(_ theShearVal:Double, sectionData:MWWoodSectionDesignData){
    designShear = theShearVal
    updateShearStress(sectionData)
}

    func updateShearStress(_ sectionData:MWWoodSectionDesignData){
    if sectionData.shapeSelected == true {
        //fv = 3 * V / (2 * b * d) for rectangular section
        shearStress = 3 * designShear / (2 * sectionData.width * sectionData.depth )
    } else {
        shearStress = 1.5 * designShear /  sectionData.vArea
    }
    
}

    func setMoment(_ theMomentVal:Double, sectionData:MWWoodSectionDesignData){
    designMoment = theMomentVal
    updateBendingStress(sectionData)
}

    func updateBendingStress(_ sectionData:MWWoodSectionDesignData){
    //fb = M/S this works for steel and wood
    bendingStress = designMoment * 12 / sectionData.sectionModulus
}

    func setDeflection(_ theDeflectionVal:Double, IOriginal:Double, EOriginal:Double, EAdjust:Double, sectionData:MWWoodSectionDesignData){
    
    //The right panel I and E will probably be different that the left panel and the graph
    //perform the deflection modification for this here. Deflections are /EI... so we need
    //to * (EOriginal/sF.EAdjust) and * (IOrginal/IAdjust) and will have the modified deflection
    deflection = theDeflectionVal * (IOriginal / sectionData.I) * (EOriginal / EAdjust)
}
    
    
    //MARK: NSCoding Conformance
    required init?(coder aDecoder: NSCoder) {
        super.init()
        
        //sectionData = aDecoder.decodeObjectForKey("sectionData") as! MWWoodSectionDesignData
        useModSection = aDecoder.decodeBool(forKey: "useModSection")
        location = aDecoder.decodeDouble(forKey: "location")
        designShear = aDecoder.decodeDouble(forKey: "designShear")
        designMoment = aDecoder.decodeDouble(forKey: "designMoment")
        deflection = aDecoder.decodeDouble(forKey: "deflection")
        shearStress = aDecoder.decodeDouble(forKey: "shearStress")
        bendingStress = aDecoder.decodeDouble(forKey: "bendingStress")
       
        
    }
    
    
    func encode(with aCoder: NSCoder) {
        
        //aCoder.encodeObject(sectionData, forKey: "sectionData")
        aCoder.encode(useModSection, forKey: "useModSection")
        aCoder.encode(location, forKey: "location")
        aCoder.encode(designShear, forKey: "designShear")
        aCoder.encode(designMoment, forKey: "designMoment")
        aCoder.encode(deflection, forKey: "deflection")
        aCoder.encode(shearStress, forKey: "shearStress")
        aCoder.encode(bendingStress, forKey: "bendingStress")
        
    }

}//End Class
