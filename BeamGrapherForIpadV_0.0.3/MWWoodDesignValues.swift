//
//  MWWoodDesignValues.swift
//  BeamDesigner
//
//  Created by Mark Walker on 3/26/15.
//  Copyright (c) 2015 Mark Walker. All rights reserved.
//

import UIKit

class MWWoodDesignValues: NSObject, NSCoding {
    
    //MARK: Public Vars
    
        //Mark:Material Limits,Properies
        var limits:MWWoodMaterialLimits = MWWoodMaterialLimits()
        //end Material Limits-Properties
        
        //MARK: WoodFactors
        var wF:MWWoodFactors = MWWoodFactors()
        //end wood factors
        
        
    
    var FbAdjust:Double = 1850.00
    var FvAdjust:Double = 175.00
    var EAdjust:Double = 1700.00
    var FbStar:Double = 1850.00 //variable for use in calculating the Cl adjustment factor
    
    //MARK:Public Functions
        override init(){
            
            super.init()
            //this line sets the programmers desired startup values
            setValues(limits.species, theGrade:limits.grade, memberWidth:7.5)
            setAdjustedValues()
        }
        
        
        init(theSpecies:speciesEnum, theGrade:woodGradeEnum, memberWidth:Double){
            
            super.init()
        
            setValues(limits.species, theGrade:limits.grade, memberWidth:memberWidth)
        }
    
    func setCustomValues(_ Fy:Double, Fb:Double, Fv:Double, E:Double, Emin:Double){
        
        self.limits.Fy = Fy
        self.limits.Fb = Fb
        self.limits.Fv = Fv
        self.limits.E = E
        self.limits.Emin = Emin
        
        setAdjustedValues()
    }
    
    
    func setValues(_ theSpecies:speciesEnum,theGrade:woodGradeEnum,memberWidth:Double){
        limits.species = theSpecies
        limits.grade = theGrade
        
        if limits.species == speciesEnum.syp{
            if memberWidth >= 1.5 && memberWidth <= 4 {
                if limits.grade == .denseSelectStructural{
                    limits.Fb = 3050; limits.Ft = 1650; limits.Fv = 175.00;
                    limits.Fcp = 660; limits.Fc = 2250; limits.E = 1900; limits.Emin = 690 //ksi
                }else if limits.grade == .selectStructural{
                    limits.Fb = 2850; limits.Ft = 1600; limits.Fv = 175.00;
                    limits.Fcp = 565; limits.Fc = 2100; limits.E = 1800; limits.Emin = 660 //ksi
                }else if limits.grade == .nonDenseSelectStructural{
                    limits.Fb = 2650; limits.Ft = 1350; limits.Fv = 175.00;
                    limits.Fcp = 480; limits.Fc = 1950; limits.E = 1700; limits.Emin = 620 //ksi
                }else if limits.grade == .no1Dense{
                    limits.Fb = 2000; limits.Ft = 1100; limits.Fv = 175.00;
                    limits.Fcp = 660; limits.Fc = 2000; limits.E = 1800; limits.Emin = 660 //ksi
                }else if limits.grade == .no1{
                    limits.Fb = 1850; limits.Ft = 1050; limits.Fv = 175.00;
                    limits.Fcp = 565; limits.Fc = 1850; limits.E = 1700; limits.Emin = 620 //ksi
                }else if limits.grade == .no1NonDense{
                    limits.Fb = 1700; limits.Ft = 900; limits.Fv = 175.00;
                    limits.Fcp = 480; limits.Fc = 1700; limits.E = 1600; limits.Emin = 580 //ksi
                }else if limits.grade == .no2Dense{
                    limits.Fb = 1700; limits.Ft = 875; limits.Fv = 175.00;
                    limits.Fcp = 660; limits.Fc = 1850; limits.E = 1700; limits.Emin = 620 //ksi
                }else if limits.grade == .no2{
                    limits.Fb = 1500; limits.Ft = 825; limits.Fv = 175.00;
                    limits.Fcp = 565; limits.Fc = 1650; limits.E = 1600; limits.Emin = 580 //ksi
                }else if limits.grade == .no2NonDense{
                    limits.Fb = 1350; limits.Ft = 775; limits.Fv = 175.00;
                    limits.Fcp = 480; limits.Fc = 1600; limits.E = 1400; limits.Emin = 510 //ksi
                }else if limits.grade == .no3AndStud{
                    limits.Fb = 850; limits.Ft = 475; limits.Fv = 175.00;
                    limits.Fcp = 565; limits.Fc = 975; limits.E = 1400; limits.Emin = 510 //ksi
                }//end if
                
            }else if memberWidth >= 4.01 && memberWidth <= 6 {
                if limits.grade == .denseSelectStructural{
                    limits.Fb = 2700; limits.Ft = 1500; limits.Fv = 175.00;
                    limits.Fcp = 660; limits.Fc = 2150; limits.E = 1900.00; limits.Emin = 690 //ksi
                }else if limits.grade == .selectStructural{
                    limits.Fb = 2550; limits.Ft = 1400; limits.Fv = 175.00;
                    limits.Fcp = 565; limits.Fc = 2000; limits.E = 1800.00; limits.Emin = 660 //ksi
                }else if limits.grade == .nonDenseSelectStructural{
                    limits.Fb = 2350; limits.Ft = 1200; limits.Fv = 175.00;
                    limits.Fcp = 480; limits.Fc = 1850; limits.E = 1700; limits.Emin = 620 //ksi
                }else if limits.grade == .no1Dense{
                    limits.Fb = 1750; limits.Ft = 950; limits.Fv = 175.00;
                    limits.Fcp = 660; limits.Fc = 1900; limits.E = 1800; limits.Emin = 660 //ksi
                }else if limits.grade == .no1{
                    limits.Fb = 1650; limits.Ft = 900; limits.Fv = 175.00;
                    limits.Fcp = 565; limits.Fc = 1750; limits.E = 1700; limits.Emin = 620 //ksi
                }else if limits.grade == .no1NonDense{
                    limits.Fb = 1500; limits.Ft = 800; limits.Fv = 175.00;
                    limits.Fcp = 480; limits.Fc = 1600; limits.E = 1600; limits.Emin = 580 //ksi
                }else if limits.grade == .no2Dense{
                    limits.Fb = 1450; limits.Ft = 775; limits.Fv = 175.00;
                    limits.Fcp = 660; limits.Fc = 1750; limits.E = 1700; limits.Emin = 620 //ksi
                }else if limits.grade == .no2{
                    limits.Fb = 1250; limits.Ft = 725; limits.Fv = 175.00;
                    limits.Fcp = 565; limits.Fc = 1600; limits.E = 1600; limits.Emin = 580 //ksi
                }else if limits.grade == .no2NonDense{
                    limits.Fb = 1150; limits.Ft = 675; limits.Fv = 175.00;
                    limits.Fcp = 480; limits.Fc = 1500; limits.E = 1400; limits.Emin = 510 //ksi
                }else if limits.grade == .no3AndStud{
                    limits.Fb = 750; limits.Ft = 425; limits.Fv = 175.00;
                    limits.Fcp = 565; limits.Fc = 925; limits.E = 1400; limits.Emin = 510 //ksi
                }//end if
                
            }else if memberWidth >= 6.01 && memberWidth <= 8 {
                if limits.grade == .denseSelectStructural{
                    limits.Fb = 2450; limits.Ft = 1350; limits.Fv = 175.00;
                    limits.Fcp = 660.00; limits.Fc = 2050; limits.E = 1900.00; limits.Emin = 690 //ksi
                }else if limits.grade == .selectStructural{
                    limits.Fb = 2300; limits.Ft = 1300; limits.Fv = 175.00;
                    limits.Fcp = 565.00; limits.Fc = 1900; limits.E = 1800.00; limits.Emin = 660 //ksi
                }else if limits.grade == .nonDenseSelectStructural{
                    limits.Fb = 2100; limits.Ft = 1100; limits.Fv = 175.00;
                    limits.Fcp = 480; limits.Fc = 1750; limits.E = 1700; limits.Emin = 620 //ksi
                }else if limits.grade == .no1Dense{
                    limits.Fb = 1650; limits.Ft = 875; limits.Fv = 175.00;
                    limits.Fcp = 660.00; limits.Fc = 1800; limits.E = 1800; limits.Emin = 660 //ksi
                }else if limits.grade == .no1{
                    limits.Fb = 1500; limits.Ft = 825; limits.Fv = 175.00;
                    limits.Fcp = 565; limits.Fc = 1650; limits.E = 1700; limits.Emin = 620 //ksi
                }else if limits.grade == .no1NonDense{
                    limits.Fb = 1350; limits.Ft = 725; limits.Fv = 175.00;
                    limits.Fcp = 480; limits.Fc = 1550; limits.E = 1600; limits.Emin = 580 //ksi
                }else if limits.grade == .no2Dense{
                    limits.Fb = 1400; limits.Ft = 675; limits.Fv = 175.00;
                    limits.Fcp = 660.00; limits.Fc = 1700; limits.E = 1700; limits.Emin = 620 //ksi
                }else if limits.grade == .no2{
                    limits.Fb = 1200; limits.Ft = 650; limits.Fv = 175.00;
                    limits.Fcp = 565; limits.Fc = 1550; limits.E = 1600; limits.Emin = 580 //ksi
                }else if limits.grade == .no2NonDense{
                    limits.Fb = 1100; limits.Ft = 600; limits.Fv = 175.00;
                    limits.Fcp = 480; limits.Fc = 1450; limits.E = 1400; limits.Emin = 510 //ksi
                }else if limits.grade == .no3AndStud{
                    limits.Fb = 700; limits.Ft = 400; limits.Fv = 175.00;
                    limits.Fcp = 565; limits.Fc = 875; limits.E = 1400; limits.Emin = 510 //ksi
                }//end if
                
            }else if memberWidth >= 8 && memberWidth <= 10 {
                if limits.grade == .denseSelectStructural{
                    limits.Fb = 2150; limits.Ft = 1200; limits.Fv = 175.00;
                    limits.Fcp = 660.00; limits.Fc = 2000; limits.E = 1900.00; limits.Emin = 690 //ksi
                }else if limits.grade == .selectStructural{
                    limits.Fb = 2050; limits.Ft = 1100; limits.Fv = 175.00;
                    limits.Fcp = 565.00; limits.Fc = 1850; limits.E = 1800.00; limits.Emin = 660 //ksi
                }else if limits.grade == .nonDenseSelectStructural{
                    limits.Fb = 1850; limits.Ft = 950; limits.Fv = 175.00;
                    limits.Fcp = 480; limits.Fc = 1750; limits.E = 1700; limits.Emin = 620 //ksi
                }else if limits.grade == .no1Dense{
                    limits.Fb = 1450; limits.Ft = 775; limits.Fv = 175.00;
                    limits.Fcp = 660.00; limits.Fc = 1750; limits.E = 1800; limits.Emin = 660 //ksi
                }else if limits.grade == .no1{
                    limits.Fb = 1300; limits.Ft = 725; limits.Fv = 175.00;
                    limits.Fcp = 565; limits.Fc = 1600; limits.E = 1700; limits.Emin = 620 //ksi
                }else if limits.grade == .no1NonDense{
                    limits.Fb = 1200; limits.Ft = 650; limits.Fv = 175.00;
                    limits.Fcp = 480; limits.Fc = 1500; limits.E = 1600; limits.Emin = 580 //ksi
                }else if limits.grade == .no2Dense{
                    limits.Fb = 1200; limits.Ft = 625; limits.Fv = 175.00;
                    limits.Fcp = 660; limits.Fc = 1650; limits.E = 1700; limits.Emin = 620 //ksi
                }else if limits.grade == .no2{
                    limits.Fb = 1050; limits.Ft = 575; limits.Fv = 175.00;
                    limits.Fcp = 565; limits.Fc = 1500; limits.E = 1600; limits.Emin = 580 //ksi
                }else if limits.grade == .no2NonDense{
                    limits.Fb = 950; limits.Ft = 550; limits.Fv = 175.00;
                    limits.Fcp = 480; limits.Fc = 1400; limits.E = 1400; limits.Emin = 510 //ksi
                }else if limits.grade == .no3AndStud{
                    limits.Fb = 600; limits.Ft = 325; limits.Fv = 175.00;
                    limits.Fcp = 565; limits.Fc = 850; limits.E = 1400; limits.Emin = 510 //ksi
                }//end if
                
            }else if memberWidth >= 10.01 && memberWidth <= 12 {
                
                if limits.grade == .denseSelectStructural{
                    limits.Fb = 2050; limits.Ft = 1100; limits.Fv = 175.00;
                    limits.Fcp = 660.00; limits.Fc = 1950; limits.E = 1900.00; limits.Emin = 690 //ksi
                }else if limits.grade == .selectStructural{
                    limits.Fb = 1900; limits.Ft = 1050; limits.Fv = 175.00;
                    limits.Fcp = 565.00; limits.Fc = 1800; limits.E = 1800.00; limits.Emin = 660 //ksi
                }else if limits.grade == .nonDenseSelectStructural{
                    limits.Fb = 1750; limits.Ft = 900; limits.Fv = 175.00;
                    limits.Fcp = 480; limits.Fc = 1700; limits.E = 1700; limits.Emin = 620 //ksi
                }else if limits.grade == .no1Dense{
                    limits.Fb = 1350; limits.Ft = 725; limits.Fv = 175.00;
                    limits.Fcp = 660.00; limits.Fc = 1700; limits.E = 1800; limits.Emin = 660 //ksi
                }else if limits.grade == .no1{
                    limits.Fb = 1250; limits.Ft = 675; limits.Fv = 175.00;
                    limits.Fcp = 565; limits.Fc = 1600; limits.E = 1700; limits.Emin = 620 //ksi
                }else if limits.grade == .no1NonDense{
                    limits.Fb = 1150; limits.Ft = 600; limits.Fv = 175.00;
                    limits.Fcp = 480; limits.Fc = 1500; limits.E = 1600; limits.Emin = 580 //ksi
                }else if limits.grade == .no2Dense{
                    limits.Fb = 1150; limits.Ft = 575; limits.Fv = 175.00;
                    limits.Fcp = 660.00; limits.Fc = 1600; limits.E = 1700; limits.Emin = 620 //ksi
                }else if limits.grade == .no2{
                    limits.Fb = 975; limits.Ft = 550; limits.Fv = 175;
                    limits.Fcp = 565; limits.Fc = 1450; limits.E = 1900.00; limits.Emin = 580 //ksi
                }else if limits.grade == .no2NonDense{
                    limits.Fb = 900; limits.Ft = 525; limits.Fv = 175.00;
                    limits.Fcp = 480; limits.Fc = 1350; limits.E = 1400; limits.Emin = 510 //ksi
                }else if limits.grade == .no3AndStud{
                    limits.Fb = 575; limits.Ft = 325; limits.Fv = 175.00;
                    limits.Fcp = 565; limits.Fc = 825; limits.E = 1400; limits.Emin = 510 //ksi
                }//end if
                
            }//end if member width
            
        }//end species if
        
            setAdjustedValues()
        }//end function
    
    
    
    func setAdjustedValues(){
        FbAdjust = limits.Fb * wF.Cd * wF.CmFb * wF.CtFb * wF.Cl * wF.Cf * wF.Cfu * wF.Cr
        
        FvAdjust = limits.Fv * wF.Cd * wF.CmFv * wF.CtFv
        
        EAdjust = limits.E * wF.CmE * wF.CtE
        
        FbStar = limits.Fb * wF.Cd * wF.CmFb * wF.CtFb * wF.Cf * wF.Cr
        
    }
    
    
    //MARK: NSCoding Conformance
    required init?(coder aDecoder: NSCoder) {
        super.init()
        
        limits = aDecoder.decodeObject(forKey: "limits") as! MWWoodMaterialLimits
        wF = aDecoder.decodeObject(forKey: "wF") as! MWWoodFactors
        
        
        FbStar = aDecoder.decodeDouble(forKey: "FbStar")
        
        FbAdjust = aDecoder.decodeDouble(forKey: "FbAdjust")
        print("FbAdjust = \(FbAdjust)")
        FvAdjust = aDecoder.decodeDouble(forKey: "FvAdjust")
        EAdjust = aDecoder.decodeDouble(forKey: "EAdjust")
        
        
        setAdjustedValues()
    
    }
    
    
    func encode(with aCoder: NSCoder) {
        
        aCoder.encode(limits, forKey: "limits")
        aCoder.encode(wF, forKey: "wF")
        aCoder.encode(FbStar, forKey: "FbStar")
        
        aCoder.encode(FbAdjust, forKey: "FbAdjust")
        aCoder.encode(FvAdjust, forKey: "FvAdjust")
        aCoder.encode(EAdjust, forKey: "EAdjust")
    
    }
        
        
    } //end class
