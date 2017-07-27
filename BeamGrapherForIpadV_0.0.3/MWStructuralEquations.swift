//
//  MWStructuralEquations.swift
//  BeamDesigner
//
//  Created by Mark Walker on 7/19/15.
//  Copyright (c) 2015 Mark Walker. All rights reserved.
/////////////////////////////////////////////////////////////
//March 26th 2016///
//Major modification to the calculation of the uniform load results. Changed them to use the step method in order to
//make it easier to accomadate overhangs
//



import UIKit

class MWStructuralEquations:NSObject{
    
    //MARK: Public Vars
    var BeamGeo:MWBeamGeometry = MWBeamGeometry()
    var Load:MWLoadData = MWLoadData()
    var calcType:calcTypeEnum = .moment
    
    // MARK: Public Functions
    override init(){
        super.init()
    }
    
    func loadEquationValues(_ theCalcType:String, theLoad:MWLoadData, theBeamGeo:MWBeamGeometry){
        
        BeamGeo = theBeamGeo
        Load = theLoad
        calcType = calcTypeEnum(rawValue: theCalcType)!
    }
    
    
    func performCalc(_ location:Double)->Double{
        var returnValue:Double = 0
        
        if calcType == .shear && Load.loadType == loadTypeEnum.uniform.rawValue{
            returnValue = -uniformLoadShear(location)
            
        }else if calcType == .moment && Load.loadType == loadTypeEnum.uniform.rawValue{
            returnValue = uniformLoadMoment(location)
            
        }else if calcType == .deflection && Load.loadType == loadTypeEnum.uniform.rawValue{
            returnValue = uniformLoadDeflection(location)//, E:BeamGeo.E, I: BeamGeo.I)
            
        }else if calcType == .shear && Load.loadType == loadTypeEnum.concentrated.rawValue{
            returnValue = -concentratedLoadShear(location)
            
        }else if calcType == .moment && Load.loadType == loadTypeEnum.concentrated.rawValue{
            returnValue = concentratedLoadMoment(location)
            
        }else if calcType == .deflection && Load.loadType == loadTypeEnum.concentrated.rawValue{
            returnValue = concentratedLoadDeflection(location, E:BeamGeo.E, I: BeamGeo.I)
            
        }else if calcType == .shear && (Load.loadType == loadTypeEnum.linearUp.rawValue || Load.loadType == loadTypeEnum.linearDown.rawValue){
            returnValue =  -linearLoadShear(location)
            
        }else if calcType == .moment && (Load.loadType == loadTypeEnum.linearUp.rawValue || Load.loadType == loadTypeEnum.linearDown.rawValue){
            returnValue = linearLoadMoment(location)
            
        }else if calcType == .deflection && (Load.loadType == loadTypeEnum.linearUp.rawValue || Load.loadType == loadTypeEnum.linearDown.rawValue){
            returnValue = linearLoadDeflection(location, E:BeamGeo.E, I:BeamGeo.I)
        }
        
        return returnValue
    }
    
    //MARK: Private Functions
    
    
    func uniformLoadShear(_ location:Double)->Double{
        var tempResult:Double = 0
        let tempLoadMag:Double = Load.loadValue
        var tempLoadPos:Double = Load.loadStart
        let stepDistance:Double = 0.001
        
        
        //set the array of concentrated loads
            while tempLoadPos<=Load.loadEnd{
                
                //let l:Double=BeamGeo.length
                let a:Double=tempLoadPos
                //let b:Double=l-tempLoadPos
                let x:Double=location
                let p:Double=tempLoadMag
                
                
                    tempResult = tempResult + genericConcentratedLoadShear(x, conLoadVal: p * stepDistance, conLoadLoc: a, beam: BeamGeo)
                
                    //tempResult = tempResult + stepDistance*p*a/l
               
                
                tempLoadPos = tempLoadPos + stepDistance
            } //end while

            let returnValue:Double = tempResult
            return returnValue
    }
    
    
     func uniformLoadMoment(_ location:Double)->Double{
        var tempResult:Double = 0
        let tempLoadMag:Double = Load.loadValue
        var tempLoadPos:Double = Load.loadStart
        let stepDistance:Double = 0.001
        
            
            while tempLoadPos<=Load.loadEnd{
                
                //let l:Double=BeamGeo.length
                let a:Double=tempLoadPos
                //let b:Double=l-tempLoadPos
                let x:Double=location
                let p:Double=tempLoadMag
                
                    tempResult = tempResult + genericConcentratedLoadMoment(x, conLoadVal: p * stepDistance, conLoadLoc: a, beam: BeamGeo)
                
                tempLoadPos = tempLoadPos + stepDistance
            } //end while

            
            let returnValue:Double = tempResult
            return returnValue
    }
    
    //, E: Double, I:Double
    func uniformLoadDeflection(_ location:Double)->Double{
        var tempResult:Double = 0
        let tempLoadMag:Double = Load.loadValue
        var tempLoadPos:Double = Load.loadStart
        let stepDistance:Double = 0.01
        
            while tempLoadPos<=Load.loadEnd{
                
                let a:Double=tempLoadPos
                let x:Double=location
                let p:Double=tempLoadMag
                
                
                //tempResult = tempResult + stepDistance*p*b*x*(l*l-b*b-x*x)/(6*Efeet*Ifeet*l)
                
                tempResult = tempResult + genericConcentratedLoadDeflection(x, conLoadVal: p * stepDistance, conLoadLoc: a, beam: BeamGeo)
                
                
                tempLoadPos = tempLoadPos + stepDistance
                
            } //end while

        
        let returnValue:Double = tempResult*12
        return returnValue
    }
    ////end uniform load functions
    
    func genericConcentratedLoadShear(_ location:Double,conLoadVal:Double, conLoadLoc:Double, beam:MWBeamGeometry)->Double{
            var returnValue:Double = 0
            
            let x = location
            let l:Double=beam.length
            var a:Double=conLoadLoc
            let b:Double=l-conLoadLoc
            let p:Double=conLoadVal
            
            let s1:Double = beam.supportLocationA
            let s2:Double = beam.supportLocationB
            
            var R1:Double = 0
            var R2:Double = 0
            //variable "x" is the location of interest
            //variable "a" is the location of load from the start
            
            //calulate the reactions
            if a < s1{ //the load is before the first support
                
                R1 = (p * (b - (l - s2))) / (s2-s1)
                R2 = (p * (s1 - a)) / (s2 - s1)
                
                if x < a {
                    returnValue = 0
                }else if x >= a && x < s1{
                    returnValue = -p
                }else if x >= s1 && x <= s2{
                    returnValue = -p + R1
                }else if x > s2{
                    returnValue = -p + R1 - R2
                }
                
            }else if a >= s1 && a <= s2{ //the load is between the supports
                if a == s1 || a == s2{
                    a = a + 0.01
                }
                
                R1 = (p * (b - (l - s2))) / (s2-s1)
                R2 = (p * (a-s1)) / (s2 - s1)
                
                if x < s1 {
                    returnValue = 0
                }else if x >= s1 && x < a{
                    returnValue = R1
                }else if x >= a && x <= s2{
                    returnValue = R1 - p
                }else if x > s2{
                    returnValue = 0
                }
                
            }else if a > s2{ //the load is after the second support
                
                R1 = (p * (l - s2 - b)) / (s2 - s1)
                R2 = (p * (l - b - s1)) / (s2 - s1)
                
                if x < s1 {
                    returnValue = 0
                }else if x >= s1 && x <= s2{
                    returnValue = -R1
                }else if x > s2 && x <= a{
                    returnValue = -R1 + R2  //think the issue is right here
                }else if x > a{
                    returnValue = 0
                }
                
            }
            
            return returnValue
        }
    
    func genericConcentratedLoadMoment(_ location:Double,conLoadVal:Double, conLoadLoc:Double, beam:MWBeamGeometry)->Double{
        var returnValue:Double = 0
        
        let x = location
        let l:Double=beam.length
        var a:Double=conLoadLoc
        let b:Double=l-conLoadLoc
        let p:Double=conLoadVal
        
        let s1:Double = beam.supportLocationA
        let s2:Double = beam.supportLocationB
        
        var R1:Double = 0
        var R2:Double = 0
        //variable "x" is the location of interest
        //variable "a" is the location of load from the start
        
        //calulate the reactions
        if a < s1{ //the load is before the first support
            
            R1 = (p * (b - (l - s2))) / (s2-s1)
            R2 = (p * (s1 - a)) / (s2 - s1)
            
            if x < a {
                returnValue = 0
            }else if x >= a && x < s1{
                returnValue = -p * (x-a)
            }else if x >= s1 && x <= s2{ //between supports
                returnValue = -p * (s1 - a) * (s2 - x) / (s2-s1)
                //= P * (dist from load to support) * (dist past 1st support) / (dist betw supports)
            }else if x > s2{
                returnValue = 0
            }
            
        }else if a >= s1 && a <= s2{ //the load is between the supports
            
            if a == s1 || a == s2{
                a = a + 0.01
            }
            
            R1 = (p * (b - (l - s2))) / (s2-s1)
            R2 = (p * (a-s1)) / (s2 - s1)
            
            if x < s1 {
                returnValue = 0
            }else if x >= s1 && x < a{
                returnValue = R1 * (x - s1)
            }else if x >= a && x <= s2{
                returnValue = ((R1 * (a - s1)) - R2 * (x - a))
            }else if x > s2{
                returnValue = 0
            }
            
        }else if a > s2{ //the load is after the second support
            
            R1 = (p * (l - s2 - b)) / (s2 - s1)
            R2 = (p * (l - b - s1)) / (s2 - s1)
            
            if x < s1 {
                returnValue = 0
            }else if x >= s1 && x <= s2{
                returnValue = -R1 * (x - s1)
            }else if x > s2 && x <= a{
                returnValue = -p * ((a - s1) - (x-s1))  //think the issue is right here
            }else if x > a{
                returnValue = 0
            }
            
        }
        
        return returnValue
    }

    func genericConcentratedLoadDeflection(_ location:Double,conLoadVal:Double, conLoadLoc:Double, beam:MWBeamGeometry)->Double{
        var returnValue:Double = 0
        
        
        let p:Double=conLoadVal
        let E:Double = BeamGeo.E * 144  // change to feet
        let I:Double = BeamGeo.I / 20736 //change to feet
        
        let s1:Double = beam.supportLocationA
        let s2:Double = beam.supportLocationB
        
        //var R1:Double = 0
        //var R2:Double = 0
        
        //variable "x" is the location of interest
        //variable "a" is the location of load from the start
        
        //calulate the reactions
        if conLoadLoc < s1{ //the load is before the first support
            
            let x = s2 - location
            let l:Double = s2-s1
            let a:Double = s1 - conLoadLoc
            let x1:Double = s1 - location
            
            if location < conLoadLoc {
                //calculate the delta at the load , get the slope from suport and project out to the additional distance
                
                //delta at load 
                let deltaAtLoad = (p * a * (2*a*(s2-s1) + (3 * a * a) - (a * a))) / (6 * E * I)
                
                //get the slope
                let slope = deltaAtLoad / a
                
                //get the additional deflection projection
                let totalDeflection = deltaAtLoad + (slope * (x1-a))
                
                returnValue = totalDeflection
                
            }else if location > conLoadLoc && location < s1{
                
                returnValue = p * x1 * (2 * a * l + 3 * a * x1 - x1 * x1) / (6 * E * I)
                
            }else if location >= s1 && location <= s2{ //between supports
                returnValue = (-p * a * x * (l * l - x * x)) / (6 * E * I * l)
            }else if location > s2{
                returnValue = 0
            }
            
        }else if conLoadLoc >= s1 && conLoadLoc <= s2{ //the load is between the supports
            let l:Double = s2-s1
            let a:Double = conLoadLoc - s1
            let b:Double = l-a
            
            let x = location - s1
            
            //R1 = p * b / l
            //R2 = p * a / l
            
            if location < s1 {
                
                let x1 = s1 - location
                
                returnValue = -(p * a * b * x1 * (l + b)) / (6 * E * I * l)
                
                
            }else if location >= s1 && location <= conLoadLoc{
                
                returnValue = (p * b * x * (l * l - b * b - x * x)) / (6 * E * I * l)
                
            }else if location >= conLoadLoc && location <= s2{
                
                returnValue = (p * a * (l-x) * (2 * l * x - x * x - a * a)) / (6 * E * I * l)
                
            }else if location > s2{
                
                let x1 = location - s2
                
                returnValue = -(p * a * b * x1 * (l + a)) / (6 * E * I * l)
            }
            
        }else if conLoadLoc > s2{ //the load is after the second support
            let x1:Double = location - s2
            let a:Double = conLoadLoc - s2
            let l:Double = s2-s1
            let x:Double = location - s1
            
            //R1 = p * a / l
            //R2 = p * (l + a) / l
            
            if location > conLoadLoc{
                //find the deflection at the load location
                let deltaAtLoad = (p * a * (2 * a * l + 3 * a * a - a * a)) / (6 * E * I)
                
                //get the slope
                let slope = deltaAtLoad / a
                
                //get the additional deflection projection
                let totalDeflection = deltaAtLoad + (slope * (x1-a))
                
                returnValue = totalDeflection
                
            }else if location >= s2 && location <= conLoadLoc{
                
                returnValue = (p * x1 * (2 * a * l + 3 * a * x1 - x1 * x1)) / (6 * E * I)
                
            }else if location > s1 && location <= s2{
                returnValue = -(p * a * x * (l * l - x * x)) / (6 * E * I * l)
                
                
            }else if location < s1{
                returnValue = 0
            }
            
        }
        
        return returnValue
    }
    
    
    ////Concentrated Load functions
    fileprivate func concentratedLoadShear(_ location:Double)->Double{
        let returnValue:Double = genericConcentratedLoadShear(location, conLoadVal: Load.loadValue, conLoadLoc: Load.loadStart, beam: BeamGeo)
        
        return returnValue
    }
    
    
    
    fileprivate func concentratedLoadMoment(_ location:Double)->Double{
        let returnValue:Double = genericConcentratedLoadMoment(location, conLoadVal: Load.loadValue, conLoadLoc: Load.loadStart, beam: BeamGeo)
        
        return returnValue
    }
    
    fileprivate func concentratedLoadDeflection(_ location:Double, E: Double, I:Double)->Double{
        let returnValue:Double = genericConcentratedLoadDeflection(location, conLoadVal: Load.loadValue, conLoadLoc: Load.loadStart, beam: BeamGeo)
        
        
        return returnValue * 12 // change to inches
    }
    //// end concentrated load functions
    
    //linear Load functions
    fileprivate func linearLoadShear(_ location:Double)->Double{
        var tempResult:Double = 0
        let loadLength:Double = Load.loadEnd - Load.loadStart
        let loadMagSlope:Double = ((Load.loadValue2 - Load.loadValue)/loadLength)
        var tempLoadMag:Double = Load.loadValue
        var tempLoadPos:Double = Load.loadStart
        let stepDistance:Double = 0.001
        
        
        //set the array of concentrated loads
        if Load.loadValue == 0 { //we know that the load slopes up
            
            while tempLoadPos<=Load.loadEnd{
                
                
                let a:Double=tempLoadPos
                let x:Double=location
                let p:Double=tempLoadMag
                
                //tempResult = tempResult + stepDistance*p*b/l
               tempResult = tempResult + genericConcentratedLoadShear(x, conLoadVal: p * stepDistance, conLoadLoc: a, beam: BeamGeo)
                
                tempLoadPos = tempLoadPos + stepDistance
                tempLoadMag = Load.loadValue + ((tempLoadPos-Load.loadStart) * loadMagSlope)
            } //end while
            
            
            
        }else{ //the load slopes down
            
            
            
            while tempLoadMag>=0{
                
                let a:Double=tempLoadPos
                let x:Double=location
                let p:Double=tempLoadMag
                
                //tempResult = tempResult + stepDistance * p * b / l
                tempResult = tempResult + genericConcentratedLoadShear(x, conLoadVal: p * stepDistance, conLoadLoc: a, beam: BeamGeo)
                
                tempLoadPos = tempLoadPos + stepDistance
                tempLoadMag = Load.loadValue + ((tempLoadPos-Load.loadStart) * loadMagSlope) //the slope should be neg
                
            } //end while
            
        }//end if
        
        
        let returnValue:Double = tempResult
        return returnValue
    }
    
    fileprivate func linearLoadMoment(_ location:Double)->Double{
        var tempResult:Double = 0
        let loadLength:Double = Load.loadEnd - Load.loadStart
        let loadMagSlope:Double = ((Load.loadValue2 - Load.loadValue)/loadLength)
        var tempLoadMag:Double = Load.loadValue
        var tempLoadPos:Double = Load.loadStart
        let stepDistance:Double = 0.001
        
        
        //set the array of concentrated loads
        if Load.loadValue == 0 { //we know that the load slopes up
            
            while tempLoadPos<=Load.loadEnd{
                
                let a:Double=tempLoadPos
                let x:Double=location
                let p:Double=tempLoadMag
                
               
                //tempResult = tempResult + stepDistance*p*b*x/l
                tempResult = tempResult + genericConcentratedLoadMoment(x, conLoadVal: p * stepDistance, conLoadLoc: a, beam: BeamGeo)
                
                tempLoadPos = tempLoadPos + stepDistance
                tempLoadMag = Load.loadValue + ((tempLoadPos-Load.loadStart) * loadMagSlope)
            } //end while
            
            
            
        }else{ //the load slopes down
            
            
            
            while tempLoadMag>=0{
                
                let a:Double=tempLoadPos
                let x:Double=location
                let p:Double=tempLoadMag
                
                
                //tempResult = tempResult + stepDistance * p * b * x / l
                tempResult = tempResult + genericConcentratedLoadMoment(x, conLoadVal: p * stepDistance, conLoadLoc: a, beam: BeamGeo)
                
                tempLoadPos = tempLoadPos + stepDistance
                tempLoadMag = Load.loadValue + ((tempLoadPos-Load.loadStart) * loadMagSlope) //the slope should be neg
                
            } //end while
            
        }//end if
        
        
        let returnValue:Double = tempResult
        return returnValue
    }
    
    fileprivate func linearLoadDeflection(_ location:Double, E: Double, I:Double)->Double{
        var tempResult:Double = 0
        let loadLength:Double = Load.loadEnd - Load.loadStart
        let loadMagSlope:Double = ((Load.loadValue2 - Load.loadValue)/loadLength)
        var tempLoadMag:Double = Load.loadValue
        var tempLoadPos:Double = Load.loadStart
        let stepDistance:Double = 0.01
        
        
        //set the array of concentrated loads
        if Load.loadValue == 0 { //we know that the load slopes up
            
            while tempLoadPos<=Load.loadEnd{
                
                let a:Double=tempLoadPos
                let x:Double=location
                let p:Double=tempLoadMag
                
                //tempResult = tempResult + stepDistance*p*b*x*(l*l-b*b-x*x)/(6*Efeet*Ifeet*l)
                
                tempResult = tempResult + genericConcentratedLoadDeflection(x, conLoadVal: p * stepDistance, conLoadLoc: a, beam: BeamGeo)
              
                
                tempLoadPos = tempLoadPos + stepDistance
                tempLoadMag = Load.loadValue + ((tempLoadPos-Load.loadStart) * loadMagSlope)
            } //end while
            
            
            
        }else{ //the load slopes down
            
            while tempLoadMag>=0{
            
                let a:Double=tempLoadPos
                let x:Double=location
                let p:Double=tempLoadMag
                
                //tempResult = tempResult + stepDistance*p*b*x*(l*l-b*b-x*x)/(6*Efeet*Ifeet*l)
                
                tempResult = tempResult + genericConcentratedLoadDeflection(x, conLoadVal: p * stepDistance, conLoadLoc: a, beam: BeamGeo)
                
                
                tempLoadPos = tempLoadPos + stepDistance
                tempLoadMag = Load.loadValue + ((tempLoadPos-Load.loadStart) * loadMagSlope) //the slope should be neg
                
            } //end while
            
        }//end if
        
        
        let returnValue:Double = tempResult*12
        return returnValue
        
    }
    ////end Linear load functions
    
    
    
}//end class

