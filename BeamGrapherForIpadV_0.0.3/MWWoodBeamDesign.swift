//
//  MWBeamDesign.swift
//  BeamDesigner_V0.0.3
//
//  Created by Mark Walker on 7/28/15.
//  Copyright (c) 2015 Mark Walker. All rights reserved.
//

import UIKit

class MWWoodBeamDesign: NSObject, NSCoding {
    
    var a = MWBeamAnalysis()
    
//    var woodSectionData = MWWoodSectionDesignData()
//    var woodDesignValues = MWWoodDesignValues()
    
    var woodDesignSectionCollection = [MWWoodLoadedDesignSection]()
    
    
    
 
    
    override init(){
       super.init()
    }
    
    init(a:MWBeamAnalysis,  woodSection:MWWoodSectionDesignData, woodDesignValues:MWWoodDesignValues){
        
        super.init()
        updateDesignSectionCollections()
    }
    
    func setValues(_ a:MWBeamAnalysis){
        self.a = a
        
        a.selectedWoodDesignValues.setValues(a.selectedWoodDesignValues.limits.species, theGrade: a.selectedWoodDesignValues.limits.grade, memberWidth: a.selectedWoodSection.depth)
        
        updateDesignSectionCollections()
    }
    
    func updateDesignSectionCollections(){
        //The following changes necessitate a call to this function
        //  1. a change in the shear and moment values. Basically a change to the left panel data
        //  2. a change to the section data. Bascially a change in shape (specifically I affects the defelction values)
        //  3. a change to the adjustment factors, Specifically the adjust E value which again affects deflection.
        
        woodDesignSectionCollection.removeAll(keepingCapacity: false)
        
        guard a.shearComboResults.graphTotals.theDataCollection.count != 0 else{
            return
        }
        
        for i in 0...a.shearComboResults.graphTotals.theDataCollection.count-1{
            //initialize the ith member
            //let woodLoadedSection = MWWoodLoadedDesignSection(thesectionData: a.selectedWoodSection)
            let woodLoadedSection = MWWoodLoadedDesignSection()
            
            //add the new member to the collection
            woodDesignSectionCollection.append(woodLoadedSection)
            //set the remaining values of this ith item in collection
            woodDesignSectionCollection[i].location = Double(a.shearComboResults.graphTotals.theDataCollection[i].x)
            woodDesignSectionCollection[i].setShear(Double(a.shearComboResults.graphTotals.theDataCollection[i].y), sectionData: a.selectedWoodSection)
            
            woodDesignSectionCollection[i].setMoment(Double(a.momentComboResults.graphTotals.theDataCollection[i].y), sectionData: a.selectedWoodSection)
            
        woodDesignSectionCollection[i].setDeflection(Double(a.deflectionComboResults.graphTotals.theDataCollection[i].y), IOriginal:a.BeamGeo.I, EOriginal:a.BeamGeo.E,EAdjust:a.selectedWoodDesignValues.EAdjust, sectionData: a.selectedWoodSection)
        
        }//end for
    }
    
        
        //MARK: NSCoding Conformance
        required init?(coder aDecoder: NSCoder) {
            super.init()
            
            a = aDecoder.decodeObject(forKey: "a") as! MWBeamAnalysis
            a.selectedWoodSection = aDecoder.decodeObject(forKey: "woodSectionData") as! MWWoodSectionDesignData
          
           woodDesignSectionCollection = aDecoder.decodeObject(forKey: "woodDesignSectionCollection") as! [MWWoodLoadedDesignSection]
           
            a.selectedWoodDesignValues = aDecoder.decodeObject(forKey: "woodDesignValues") as! MWWoodDesignValues
            
        }
        
        
        func encode(with aCoder: NSCoder) {
            aCoder.encode(a, forKey: "a")
            aCoder.encode(a.selectedWoodSection, forKey: "woodSectionData")
            aCoder.encode(woodDesignSectionCollection, forKey: "woodDesignSectionCollection")
            aCoder.encode(a.selectedWoodDesignValues, forKey: "woodDesignValues")
            
        }
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    


