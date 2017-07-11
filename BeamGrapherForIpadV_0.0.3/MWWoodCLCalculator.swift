//
//  MWWoodCLCalculator.swift
//  BeamDesigner
//
//  Created by Mark Walker on 5/11/15.
//  Copyright (c) 2015 Mark Walker. All rights reserved.
//

import UIKit

enum clLoadingCondition:String{
    
    case Cantilever_UniformlyDistributed = "Cantilever - Uniformly Distributed"
    case Cantilever_ConcentratedLoadAtUnsupportedEnds = "Cantilever - Concentrated Load At Unsupported Ends"
    case SimpleSpan_UniformlyDistributedLoad = "Simple Span - Uniformly Distributed Load"
    case SimpleSpan_ConcentratedLoadAtCenterWithNoIntermediateSupportAtCenter = "Simple Span - Concentrated Load At Center With No Intermediate Support At Center"
    case SimpleSpan_ConcentratedLoadAtCenterWithLateralSupportAtCenter = "Simple Span - Concentrated Load At Center With Lateral Support At Center"
    case SimpleSpan_TwoEqualConcrentratedLoadsAtThirdPointsWithLateralSupportsAtThirdPoints = "Simple Span - Two Equal Concrentrated Loads At 1/3 Points With Lateral Supports At 1/3 Points"
    case SimpleSpan_ThreeEqualConcrentratedLoadsAtFourthPointsWithLateralSupportsAtFourthPoints = "Simple Span - Three Equal Concrentrated Loads At 1/4 Points With Lateral Supports At 1/4 Points"
    case SimpleSpan_FourEqualConcrentratedLoadsAtFifthPointsWithLateralSupportsAtFifthPoints = "Simple Span - Four Equal Concrentrated Loads At 1/5 Points With Lateral Supports At 1/5 Points"
    case SimpleSpan_FiveEqualConcrentratedLoadsAtSixthPointsWithLateralSupportsAtSixthPoints = "Simple Span - Five Equal Concrentrated Loads At 1/6 Points With Lateral Supports At 1/6 Points"
    case SimpleSpan_SixEqualConcrentratedLoadsAtSeventhPointsWithLateralSupportsAtSeventhPoints = "Simple Span - Six Equal Concrentrated Loads At 1/7 Points With Lateral Supports At 1/7 Points"
    case SimpleSpan_SevenOrMoreEqualConcentratedLoadsEvenlySpacedWithLateralSupportAtPointsOfLoadApplication = "Simple Span - Seven Or More Equal Concentrated Loads, Evenly Spaced, With Lateral Support At Points Of Load Application"
    case SimpleSpan_EqualEndMoments = "Simple Span  - Equal End Moments"
    case AnyOtherLoadingCondition = "Any Other Loading Condition"
    
}



class MWWoodCLCalculator: NSObject{
    
    
    
    var width:Double = 1
    var depth:Double = 1
    var Lu:Double = 1
    var Emin:Double = 1
    var FbStar:Double = 1
    
    var loadingCondition = clLoadingCondition.AnyOtherLoadingCondition
    
    var luOverd:Double{
        return Lu/depth
    }
    
    //Readonly Value le
    var le:Double{
        var returnVal:Double = 1
        if luOverd <= 7{
            if loadingCondition == .Cantilever_UniformlyDistributed{
            returnVal = (1.33 * Lu)
            }else if loadingCondition == .Cantilever_ConcentratedLoadAtUnsupportedEnds{
                returnVal = (1.87 * Lu)
            }else if loadingCondition == .SimpleSpan_UniformlyDistributedLoad{
                returnVal = (2.06 * Lu)
            }else if loadingCondition == .SimpleSpan_ConcentratedLoadAtCenterWithNoIntermediateSupportAtCenter{
                returnVal = (1.80 * Lu)
            }else if loadingCondition == .SimpleSpan_ConcentratedLoadAtCenterWithLateralSupportAtCenter{
                returnVal = (1.11 * Lu)
            }else if loadingCondition == .SimpleSpan_TwoEqualConcrentratedLoadsAtThirdPointsWithLateralSupportsAtThirdPoints{
                returnVal = (1.68 * Lu)
            }else if loadingCondition == .SimpleSpan_ThreeEqualConcrentratedLoadsAtFourthPointsWithLateralSupportsAtFourthPoints{
                returnVal = (1.54 * Lu)
            }else if loadingCondition == .SimpleSpan_FourEqualConcrentratedLoadsAtFifthPointsWithLateralSupportsAtFifthPoints{
                returnVal = (1.68 * Lu)
            }else if loadingCondition == .SimpleSpan_FiveEqualConcrentratedLoadsAtSixthPointsWithLateralSupportsAtSixthPoints{
                returnVal = (1.73 * Lu)
            }else if loadingCondition == .SimpleSpan_SixEqualConcrentratedLoadsAtSeventhPointsWithLateralSupportsAtSeventhPoints{
                returnVal = (1.78 * Lu)
            }else if loadingCondition == .SimpleSpan_SevenOrMoreEqualConcentratedLoadsEvenlySpacedWithLateralSupportAtPointsOfLoadApplication{
                returnVal = (1.84 * Lu)
            }else if loadingCondition == .SimpleSpan_EqualEndMoments{
                returnVal = (1.84 * Lu)
            }else if loadingCondition == .AnyOtherLoadingCondition{
                returnVal = (2.06 * Lu)
            }
            
        }else if luOverd > 7 && Lu/depth <= 14.3{
            if loadingCondition == .Cantilever_UniformlyDistributed{
                returnVal = (0.90 * Lu + (3 * depth))
            }else if loadingCondition == .Cantilever_ConcentratedLoadAtUnsupportedEnds{
                returnVal = (1.44 * Lu + (3 * depth))
            }else if loadingCondition == .SimpleSpan_UniformlyDistributedLoad{
                returnVal = (1.63 * Lu + (3 * depth))
            }else if loadingCondition == .SimpleSpan_ConcentratedLoadAtCenterWithNoIntermediateSupportAtCenter{
                returnVal = (1.37 * Lu + (3 * depth))
            }else if loadingCondition == .SimpleSpan_ConcentratedLoadAtCenterWithLateralSupportAtCenter{
                returnVal = (1.11 * Lu + (3 * depth))
            }else if loadingCondition == .SimpleSpan_TwoEqualConcrentratedLoadsAtThirdPointsWithLateralSupportsAtThirdPoints{
                returnVal = (1.68 * Lu)
            }else if loadingCondition == .SimpleSpan_ThreeEqualConcrentratedLoadsAtFourthPointsWithLateralSupportsAtFourthPoints{
                returnVal = (1.54 * Lu)
            }else if loadingCondition == .SimpleSpan_FourEqualConcrentratedLoadsAtFifthPointsWithLateralSupportsAtFifthPoints{
                returnVal = (1.68 * Lu)
            }else if loadingCondition == .SimpleSpan_FiveEqualConcrentratedLoadsAtSixthPointsWithLateralSupportsAtSixthPoints{
                returnVal = (1.73 * Lu)
            }else if loadingCondition == .SimpleSpan_SixEqualConcrentratedLoadsAtSeventhPointsWithLateralSupportsAtSeventhPoints{
                returnVal = (1.78 * Lu)
            }else if loadingCondition == .SimpleSpan_SevenOrMoreEqualConcentratedLoadsEvenlySpacedWithLateralSupportAtPointsOfLoadApplication{
                returnVal = (1.84 * Lu)
            }else if loadingCondition == .SimpleSpan_EqualEndMoments{
                returnVal = (1.84 * Lu)
            }else if loadingCondition == .AnyOtherLoadingCondition{
                returnVal = (1.63 * Lu + (3 * depth))
            }
            
        }else if luOverd > 14.3{
            
            
            if loadingCondition == .Cantilever_UniformlyDistributed{
                returnVal = (0.90 * Lu + (3 * depth))
            }else if loadingCondition == .Cantilever_ConcentratedLoadAtUnsupportedEnds{
                returnVal = (1.44 * Lu + (3 * depth))
            }else if loadingCondition == .SimpleSpan_UniformlyDistributedLoad{
                returnVal = (1.63 * Lu + (3 * depth))
            }else if loadingCondition == .SimpleSpan_ConcentratedLoadAtCenterWithNoIntermediateSupportAtCenter{
                returnVal = (1.37 * Lu + (3 * depth))
            }else if loadingCondition == .SimpleSpan_ConcentratedLoadAtCenterWithLateralSupportAtCenter{
                returnVal = (1.11 * Lu)
            }else if loadingCondition == .SimpleSpan_TwoEqualConcrentratedLoadsAtThirdPointsWithLateralSupportsAtThirdPoints{
                returnVal = (1.68 * Lu)
            }else if loadingCondition == .SimpleSpan_ThreeEqualConcrentratedLoadsAtFourthPointsWithLateralSupportsAtFourthPoints{
                returnVal = (1.54 * Lu)
            }else if loadingCondition == .SimpleSpan_FourEqualConcrentratedLoadsAtFifthPointsWithLateralSupportsAtFifthPoints{
                returnVal = (1.68 * Lu)
            }else if loadingCondition == .SimpleSpan_FiveEqualConcrentratedLoadsAtSixthPointsWithLateralSupportsAtSixthPoints{
                returnVal = (1.73 * Lu)
            }else if loadingCondition == .SimpleSpan_SixEqualConcrentratedLoadsAtSeventhPointsWithLateralSupportsAtSeventhPoints{
                returnVal = (1.78 * Lu)
            }else if loadingCondition == .SimpleSpan_SevenOrMoreEqualConcentratedLoadsEvenlySpacedWithLateralSupportAtPointsOfLoadApplication{
                returnVal = (1.84 * Lu)
            }else if loadingCondition == .SimpleSpan_EqualEndMoments{
                returnVal = (1.84 * Lu)
            }else if loadingCondition == .AnyOtherLoadingCondition{
                returnVal = (1.84 * Lu)
            }
        }
        return returnVal
    }
    
    //Readonly Value Rb
    var Rb:Double{
    return sqrt((le * depth) / (width * width))
    }
    
    //Readonly Value Fbe
    var Fbe:Double {
        get{
            return ((1.2 * Emin * 1000) / (Rb * Rb))
        }
    }
    
    
    //complicated CL Equations broken into parts
    var ClPart1and2:Double{
        get{
            return (1+(Fbe/FbStar)) / 1.9
        }
    }
    
    var ClPart3:Double{
        get{
            return ((Fbe/FbStar) / 0.95)
        }
    }
    
    var calculatedCl:Double{
        get{
            return ClPart1and2 - sqrt((pow(ClPart1and2,2)) - ClPart3)
        }
    }
    
    
    func setValues(_ w:Double, d:Double, Lu:Double, Emin:Double, FbStar:Double, loadCondition:clLoadingCondition){
        
        width = w
        depth = d
        self.Lu = Lu
        self.Emin = Emin
        self.FbStar = FbStar
        self.loadingCondition = loadCondition
        
        
    }
    

}
