//
//  MWBeamAnalysis.swift
//  BeamDesigner_V0.0.3
//
//  Created by Mark Walker on 7/24/15.
//  Copyright (c) 2015 Mark Walker. All rights reserved.
//

import UIKit

class MWBeamAnalysis: NSObject, NSCoding{
    
    //for the beam
    var BeamGeo:MWBeamGeometry = MWBeamGeometry(theLength: 10, theE: 1600, theI: 105.47)
    
    //for the loads
    var loadCollection:[MWLoadData] = [MWLoadData]()
    var archivableLoadcollection:NSMutableArray = NSMutableArray()

    //the selected load
    var selectedLoadIndex:Int = 0
    
    
    var shearComboResults = MWLoadComboResult()
    var momentComboResults = MWLoadComboResult()
    var deflectionComboResults = MWLoadComboResult()
    
    
   //this is the data needed to load the design values
    var selectedWoodSection = MWWoodSectionDesignData() //these will either be default values, or set from the beam analysis
    var selectedWoodDesignValues = MWWoodDesignValues() //these will either be default values, or set from the beam analysis
    
    var selectedLVLSection = MWLVLSectionDesignData()
    var selectedLVLDesignValues = MWLVLDesignValues()
    
    var selectedSteelWSection = MWSteelWSectionDesignData()
    var selectedSteelWDesignValues = MWSteelWDesignValues()
    
    var selectedDesignTab:Int = -1
    
    override init(){
        super.init()
    }

    init(beamGeometry:MWBeamGeometry, loads:[MWLoadData]){
    super.init()
    
        BeamGeo = beamGeometry
        loadCollection = loads

    }
    
    func myCopy()->MWBeamAnalysis{
        var newBeam = MWBeamGeometry()
        var newLoadCollection = [MWLoadData]()
        let newSelectedLoadIndex = selectedLoadIndex
        
        newBeam = self.BeamGeo.myCopy()
        
        for i in 0...self.loadCollection.count-1{
            let newLoad = self.loadCollection[i].myCopy()
            newLoadCollection.append(newLoad)
        }
        
        let newBeamAnalysis = MWBeamAnalysis()
        newBeamAnalysis.BeamGeo = newBeam
        newBeamAnalysis.loadCollection = newLoadCollection
        newBeamAnalysis.selectedLoadIndex = newSelectedLoadIndex
        
        return newBeamAnalysis
    }
    
    
    
    func setValues(_ beamGeometry:MWBeamGeometry, loads:[MWLoadData]){
        BeamGeo = beamGeometry
        loadCollection = loads
        updateComboResults()
    }
    
    func appendLoadCollection(_ newLoad:MWLoadData){
        self.loadCollection.append(newLoad)
        updateComboResults()
    }
    
    func deleteItemFromLoadCollection(_ index:Int){
        
        var tempLoadCollection:[MWLoadData] = [MWLoadData]()
        if index != 0 {
            
            for i in 0...loadCollection.count-1{
                if i != index{
                    tempLoadCollection.append(loadCollection[i])
                    
                }else{
                    //do nothing, do not keep the load
                }//end if
                
            }//end for
        }//end if

        loadCollection = tempLoadCollection
        
        updateComboResults()
    }
    
    func replaceLoadInCollection(_ theNewLoad:MWLoadData, theIndex:Int){
        self.loadCollection[theIndex] = theNewLoad
        updateComboResults()
    }
    
    
    func updateComboResults(){
        //this function updates all 3 combo results with the data from the current beam and current loadcollection
        
        //Clear the previous GraphTotals
        shearComboResults.resultsCollection.removeAll(keepingCapacity: false)
        momentComboResults.resultsCollection.removeAll(keepingCapacity: false)
        deflectionComboResults.resultsCollection.removeAll(keepingCapacity: false)
        
        //now create the remainder of the result graphs for the rest fo the load collection, load[1], load[2]....
        //and add each one to the combo result
       
        guard loadCollection.count != 0 else{
            return
        }
        for i in 0...loadCollection.count-1{
            
            let localShearGraph = MWStructuralGraphData(theBeamGeo: self.BeamGeo, theLoad: loadCollection[i], theCalcType: .shear)
            let localMomentGraph = MWStructuralGraphData(theBeamGeo: self.BeamGeo, theLoad: loadCollection[i], theCalcType: .moment)
            let localDeflectionGraph = MWStructuralGraphData(theBeamGeo: self.BeamGeo, theLoad: loadCollection[i], theCalcType: .deflection)
            
            shearComboResults.addLoadedBeamGraphData(localShearGraph)
            momentComboResults.addLoadedBeamGraphData(localMomentGraph)
            deflectionComboResults.addLoadedBeamGraphData(localDeflectionGraph)
            
        }// end for
        
        Swift.print("Crap")
    }
    
    //MARK: NSCoding Conformance
    required init?(coder aDecoder: NSCoder) {
        super.init()
        
        BeamGeo = aDecoder.decodeObject(forKey: "BeamGeo") as! MWBeamGeometry
        loadCollection = aDecoder.decodeObject(forKey: "loadCollection") as! [MWLoadData]
        selectedLoadIndex = aDecoder.decodeInteger(forKey: "selectedLoadIndex")
        
        
        selectedWoodSection = aDecoder.decodeObject(forKey: "selectedWoodSection") as! MWWoodSectionDesignData
        selectedWoodDesignValues = aDecoder.decodeObject(forKey: "selectedWoodDesignValues") as! MWWoodDesignValues
        
        selectedLVLSection = aDecoder.decodeObject(forKey: "selectedLVLSection") as! MWLVLSectionDesignData
        selectedLVLDesignValues = aDecoder.decodeObject(forKey: "selectedLVLDesignValues") as! MWLVLDesignValues
     
        selectedSteelWSection = aDecoder.decodeObject(forKey: "selectedSteelWSection") as! MWSteelWSectionDesignData
        selectedSteelWDesignValues = aDecoder.decodeObject(forKey: "selectedSteelWDesignValues") as! MWSteelWDesignValues
        
        selectedDesignTab = aDecoder.decodeInteger(forKey: "selectedDesignTab")
        
        //updateComboResults()
    }
    
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(BeamGeo, forKey: "BeamGeo")
        aCoder.encode(loadCollection, forKey: "loadCollection")
        aCoder.encode(selectedLoadIndex, forKey: "selectedLoadIndex")
        
        aCoder.encode(selectedWoodSection, forKey: "selectedWoodSection")
        aCoder.encode(selectedWoodDesignValues, forKey: "selectedWoodDesignValues")
        
        aCoder.encode(selectedLVLSection, forKey: "selectedLVLSection")
        aCoder.encode(selectedLVLDesignValues, forKey: "selectedLVLDesignValues")
        
        aCoder.encode(selectedSteelWSection, forKey: "selectedSteelWSection")
        aCoder.encode(selectedSteelWDesignValues, forKey: "selectedSteelWDesignValues")
        
        aCoder.encode(selectedDesignTab, forKey: "selectedDesignTab")
    }
    
    
}//end class
