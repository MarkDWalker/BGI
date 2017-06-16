//
//  MWLoadData.swift
//  BeamDesigner
//
//  Created by Mark Walker on 7/19/15.
//  Copyright (c) 2015 Mark Walker. All rights reserved.
//

import UIKit

class MWLoadData:NSObject, NSCoding{
    
    //MARK: Public Vars
    var loadDescription:String = "theload"
    var loadValue:Double = 1
    var loadValue2:Double = 0
    var loadType:String = "uniform"
    var loadStart:Double = 0.0
    var loadEnd:Double = 0.0
    var beamGeo:MWBeamGeometry = MWBeamGeometry(theLength: 1, theE: 1600, theI: 105.47)
    
    
    //calculated variable, i.e.readonly - not anymore
    var graphPointCollection = [CGPoint]()
//        var returnCollection = [CGPoint]()
//        
//        if loadType == "concentrated"{
//            let startPoint = CGPoint(x: loadStart, y: loadValue)
//            returnCollection.append(startPoint)
//            let endPoint = CGPoint(x: loadStart, y: 0.00)
//            returnCollection.append(endPoint)
//            
//        }else if loadType=="uniform"{
//            returnCollection.removeAll()
//            let P1 = CGPoint(x: loadStart, y: 0)
//            let P2 = CGPoint(x: loadStart, y: loadValue)
//            let P3 = CGPoint(x: loadEnd , y: loadValue)
//            let P4 = CGPoint(x: loadEnd, y: 0)
//            returnCollection.append(P1)
//            returnCollection.append(P2)
//            returnCollection.append(P3)
//            returnCollection.append(P4)
//            
//        }else if loadType == "linearup" || loadType == "lineardown"{
//            returnCollection.removeAll()
//            let P1 = CGPoint(x: loadStart, y: 0)
//            let P2 = CGPoint(x: loadStart, y: loadValue)
//            let P3 = CGPoint(x: loadEnd, y: loadValue2)
//            let P4 = CGPoint(x: loadEnd, y: 0)
//            returnCollection.append(P1)
//            returnCollection.append(P2)
//            returnCollection.append(P3)
//            returnCollection.append(P4)
//        }//end if
//        
//        return returnCollection
//    }
   
        
        func loadGraphPointCollection(_ beamGeo:MWBeamGeometry){
                    if loadType == loadTypeEnum.concentrated.rawValue{
            graphPointCollection.removeAll()
            
                        let startPoint = CGPoint(x: loadStart, y: loadValue)
                        graphPointCollection.append(startPoint)
                        let endPoint = CGPoint(x: loadStart, y: 0.00)
                        graphPointCollection.append(endPoint)
            
                    }else if loadType == loadTypeEnum.uniform.rawValue{
            graphPointCollection.removeAll()
                        let P1 = CGPoint(x: loadStart, y: 0)
                        let P2 = CGPoint(x: loadStart, y: loadValue)
                        let P3 = CGPoint(x: loadEnd , y: loadValue)
                        let P4 = CGPoint(x: loadEnd, y: 0)
                        graphPointCollection.append(P1)
                        graphPointCollection.append(P2)
                        graphPointCollection.append(P3)
                        graphPointCollection.append(P4)
            
                    }else if loadType == loadTypeEnum.linearUp.rawValue || loadType == loadTypeEnum.linearDown.rawValue {
                     graphPointCollection.removeAll()
                        let P1 = CGPoint(x: loadStart, y: 0)
                        let P2 = CGPoint(x: loadStart, y: loadValue)
                        let P3 = CGPoint(x: loadEnd, y: loadValue2)
                        let P4 = CGPoint(x: loadEnd, y: 0)
                        graphPointCollection.append(P1)
                        graphPointCollection.append(P2)
                        graphPointCollection.append(P3)
                        graphPointCollection.append(P4)
                    }//end if
                    
                    
                }//end function
    
    
    
    //MARK: Public Functions
    override init(){
        
    }
    
    init(theDescription:String, theLoadValue:Double, theLoadType:String, theLoadStart:Double, theLoadEnd:Double, theBeamGeo:MWBeamGeometry, theLoadValue2:Double = 0){
        super.init()
        loadDescription = theDescription
        loadValue = theLoadValue
        loadValue2 = theLoadValue2
        loadType = theLoadType
        loadStart = theLoadStart
        loadEnd = theLoadEnd
        beamGeo = theBeamGeo
        
    } // end init
    
    func getMaxYInGraph()->Double{
        //find the max y graph point value
        var tempMaxY:Double = 0
        for i in 0..<graphPointCollection.count{
            if Double(graphPointCollection[i].y) > tempMaxY {
                tempMaxY = Double(graphPointCollection[i].y)
            }//end if
            
        }//end for
        
        return tempMaxY
    }
    
    //same as init, but used to add the data after the init
    func addValues(_ theDescription:String, theLoadValue:Double, theLoadType:String, theLoadStart:Double, theLoadEnd:Double, theBeamGeo:MWBeamGeometry, theLoadValue2:Double = 0){
        loadDescription = theDescription
        loadValue = theLoadValue
        loadValue2 = theLoadValue2
        loadType = theLoadType
        loadStart = theLoadStart
        loadEnd = theLoadEnd
        beamGeo = theBeamGeo
        
    } // end add values
    
    func myCopy()->MWLoadData{
        let newLoadData = MWLoadData()
        newLoadData.loadDescription = loadDescription
        newLoadData.loadValue = loadValue
        newLoadData.loadValue2 = loadValue2
        newLoadData.loadType = loadType
        newLoadData.loadStart = loadStart
        newLoadData.loadEnd = loadEnd
        newLoadData.beamGeo = beamGeo.myCopy()
        
        return newLoadData
    }
    
    //MARK: NSCoding Conformance
    required init?(coder aDecoder: NSCoder) {
        super.init()
        
        loadDescription = aDecoder.decodeObject(forKey: "loadDescription") as! String
        loadValue = aDecoder.decodeDouble(forKey: "loadValue")
        loadValue2 = aDecoder.decodeDouble(forKey: "loadValue2")
        loadType = aDecoder.decodeObject(forKey: "loadType") as! String
        loadStart = aDecoder.decodeDouble(forKey: "loadStart")
        loadEnd = aDecoder.decodeDouble(forKey: "loadEnd")
        beamGeo = aDecoder.decodeObject(forKey: "beamGeo") as! MWBeamGeometry
        
        
    }
    
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(loadDescription, forKey: "loadDescription")
        aCoder.encode(loadValue, forKey: "loadValue")
        aCoder.encode(loadValue2, forKey: "loadValue2")
        aCoder.encode(loadType, forKey: "loadType")
        aCoder.encode(loadStart, forKey: "loadStart")
        aCoder.encode(loadEnd, forKey: "loadEnd")
        aCoder.encode(beamGeo, forKey: "beamGeo")
    }
    

}//end class
