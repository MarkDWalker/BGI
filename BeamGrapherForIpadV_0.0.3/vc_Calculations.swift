//
//  ViewController_Calculations.swift
//  BeamDesigner
//
//  Created by Mark Walker on 4/5/15.
//  Copyright (c) 2015 Mark Walker. All rights reserved.
//

import UIKit

class vc_Calculations: UIViewController, UIDocumentInteractionControllerDelegate{

    var calcType = "Wood"
    var woodBeamDesign = MWWoodBeamDesign()
    //var lvlBeamDesign = MWLVLBeamDesign()
    //var steelWBeamDesign = MWSteelWBeamDesign()
    
    var fh:MWTextFormatHelper = MWTextFormatHelper()
    
    var steelWAttString:NSMutableAttributedString = NSMutableAttributedString()
    
    
    //dictionarys for standard text attributes
    
    var loadGraphImage = UIImage()
    var momentGraphImage = UIImage()
    var shearGraphImage = UIImage()
    var deflectionGraphImage = UIImage()
    
    var beamAndLoadImage = UIImage()
    
    
    var loadListImage = UIImage()
   
    
    
    
    var cd:NSMutableAttributedString = NSMutableAttributedString()
    
    @IBOutlet var tView: UITextView!
    
    
    var insertIndex:Int{
    
        return (tView.textStorage.length)
        
    }
    
    
    func getBeamGeoImage() -> UIImage{
        let imageRef = beamAndLoadImage.cgImage!.cropping(to: CGRect(x: 0, y: 200, width: (beamAndLoadImage.cgImage?.width)!, height: 450))
        
        let result:UIImage = UIImage(cgImage: imageRef!, scale: 2, orientation: beamAndLoadImage.imageOrientation)
        
        return result;
        
    }
    
    func getloadListImage() -> UIImage{
        let imageRef = beamAndLoadImage.cgImage!.cropping(to: CGRect(x: 0, y: 650, width: (beamAndLoadImage.cgImage?.width)!, height: 450))
        
        let result:UIImage = UIImage(cgImage: imageRef!, scale: 2, orientation: beamAndLoadImage.imageOrientation)
        
        return result;
        
    }
    

    
    
    
    @IBAction func clickBack(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if calcType == "Wood"{
            writeWoodCalculations()
        }else if calcType == "LVL"{
           // writeLVLCalculations()
        }else if calcType == "SteelW"{
           // writeSteelWCalculations()
        }else{
            //do nothing
        }
    }
    
    fileprivate func ititle(_ theString:String){
        tView.textStorage.insert(fh.nBAttString(theString), at: insertIndex)
        
        //tView.append(fh.nBAttString(theString), atIndex: insertIndex)
    
        Swift.print(theString)
//        tView.insertText(fh.nBAttString(theString))
    }
    
    fileprivate func inorm(_ theString:String){
        tView.textStorage.insert(fh.nAttString(theString), at: insertIndex)
    }
    fileprivate func isub(_ theString:String){
        tView.textStorage.insert(fh.subAttString(theString), at: insertIndex)
    }
    
    fileprivate func isuper(_ theString:String){
        tView.textStorage.insert(fh.superAttString(theString), at: insertIndex)
    }
    
    fileprivate func inormRedHL(_ theString:String){
        tView.textStorage.insert(fh.nAttStringRedHL(theString), at: insertIndex)
    }
    
    fileprivate func inormGreenHL(_ theString:String){
        tView.textStorage.insert(fh.nAttStringGreenHL(theString), at: insertIndex)
    }
    
    fileprivate func iNL(){
        //tView.insertNewline(self)
        
        tView.textStorage.append(NSAttributedString(string: "\n"))
        
    }
    
    func conToString(_ number:Double)->String{
        let returnString:String = String(format:"%.2f", number)
        return returnString
    }
    
    
    fileprivate func iImage(_ theImage:UIImage){
        let ta = NSTextAttachment()
        ta.image = theImage
        let attrStringWithImage = NSAttributedString(attachment: ta)
        tView.textStorage.insert(attrStringWithImage, at: insertIndex)
        
    }
   
    
    func writeWoodBeamData(){
        
        //Write Title line
        ititle("BEAM DESIGN CALCULATIONS")
        iNL()
        
        //Write the desciption name
        
        
        inorm("Beam Description: " + woodBeamDesign.a.BeamGeo.title)
        iNL(); iNL()
        
//        inorm("NOTE: TOP CHORD ASSUMED FULLY RESTRAINED")
//        iNL(); iNL()
        
        //write member data
        ititle("Member Geometry")
        iNL()
        
        
        //Write Member Length
        inorm("Span = " + conToString(woodBeamDesign.a.BeamGeo.length) + " feet, ")
        inorm("Design Section = " + (woodBeamDesign.a.selectedWoodSection.shape as String))
        iNL()
        iNL()
        iNL()
        
        iImage(getBeamGeoImage())
        
        iImage(getloadListImage())
        
        iNL()
        iNL()
        iNL()
        
        iImage(loadGraphImage)
        
        iNL()
        //Write Shape Title
        inorm("Normal Section Dimensions")
        iNL()
        
        //Write the Member Dimensions and properties
        
        inorm("Member Width = " + conToString(woodBeamDesign.a.selectedWoodSection.width) + " inches, Member Depth = " + conToString(woodBeamDesign.a.selectedWoodSection.depth) + " inches");
        iNL()
        inorm("Moment of Inertia (in graphs) = " + conToString(woodBeamDesign.a.BeamGeo.I) + " inches"); isuper("4")
        iNL()
        inorm("Moment of Inertia (in design) = " + conToString(woodBeamDesign.a.selectedWoodSection.I) + " inches"); isuper("4")
        iNL()
        iNL()
    }
    
    func writeWoodGradeData(){
        //Grade Information Heading
        ititle("Selected Grade and Adjustment Factors")
        iNL()
        
        //write selected species Name
        inorm("Species: " + String(woodBeamDesign.a.selectedWoodDesignValues.limits.species.rawValue))
        iNL()
        
        //write selected grade name
        inorm("Grade: " + String(woodBeamDesign.a.selectedWoodDesignValues.limits.grade.rawValue))
        iNL()
        
        //write selected tabluar allowable stress values
        inorm("F"); isub("b"); inorm(": " + conToString(woodBeamDesign.a.selectedWoodDesignValues.limits.Fb) + " psi, F"); isub("v")
        inorm(": " + conToString(woodBeamDesign.a.selectedWoodDesignValues.limits.Fv) + " psi, " + "Modulus of Elasticity = " + conToString(woodBeamDesign.a.BeamGeo.E) + " ksi")
        iNL()
        iNL()
        
        //write adjustment factors heading
        ititle("Specified Adjustment Factors")
        iNL()
        
       //write adjustment values line 1
        inorm("C"); isub("d")
        inorm(" = " + conToString(woodBeamDesign.a.selectedWoodDesignValues.wF.Cd) + ", C"); isub("m"); inorm("F"); isub("b")
        inorm(" = " + conToString(woodBeamDesign.a.selectedWoodDesignValues.wF.CmFb) + ", " + "C"); isub("m"); inorm("F"); isub("v")
        inorm(" = " + conToString(woodBeamDesign.a.selectedWoodDesignValues.wF.CmFv) + ", " + "C"); isub("m"); inorm("E = " + conToString(woodBeamDesign.a.selectedWoodDesignValues.wF.CmE))
        iNL()
        
        
        //Write Adjustment Values line 2
        inorm(" C"); isub("t"); inorm("F"); isub("b"); inorm(" = " + conToString(woodBeamDesign.a.selectedWoodDesignValues.wF.CtFb) + ", " + "C"); isub("t")
        inorm("F"); isub("v"); inorm(" = " + conToString(woodBeamDesign.a.selectedWoodDesignValues.wF.CtFv) + ", " + "C"); isub("t"); inorm("E = " + conToString(woodBeamDesign.a.selectedWoodDesignValues.wF.CtE));
        inorm("C"); isub("L"); inorm(" = \(woodBeamDesign.a.selectedWoodDesignValues.wF.Cl)")
        iNL()
        
        //write Adjustment Values line 3
        inorm("C"); isub("f"); inorm(" = " + conToString(woodBeamDesign.a.selectedWoodDesignValues.wF.Cf) + ", " + "C"); isub("fu")
        inorm(" = " + conToString(woodBeamDesign.a.selectedWoodDesignValues.wF.Cfu) + ", " + "C"); isub("r"); inorm(" = " + conToString(woodBeamDesign.a.selectedWoodDesignValues.wF.Cr))
        iNL()
        iNL()
        
        
        //write adjusted allowable stresses
        ititle( "Adjusted Allowable Design Stresses")
        iNL()
        
        inorm("F"); isub("b"); inorm(" Allowable =  F"); isub("b");inorm(" x  C"); isub("d"); inorm(" x C"); isub("m"); inorm("F"); isub("b"); inorm(" x C"); isub("t");
        inorm(" x C"); isub("L");inorm(" x C"); isub("f");
        inorm(" x C");isub("fu"); inorm(" x C"); isub("r")
        iNL()
        inorm("F"); isub("b"); inorm(" Allowable =  " + conToString(woodBeamDesign.a.selectedWoodDesignValues.limits.Fb) + " x " + conToString(woodBeamDesign.a.selectedWoodDesignValues.wF.Cd) + " x " + conToString(woodBeamDesign.a.selectedWoodDesignValues.wF.CmFb) + " x " + conToString(woodBeamDesign.a.selectedWoodDesignValues.wF.CtFb) + " x " + conToString(woodBeamDesign.a.selectedWoodDesignValues.wF.Cl) + " x " + conToString(woodBeamDesign.a.selectedWoodDesignValues.wF.Cf) + " x " + conToString(woodBeamDesign.a.selectedWoodDesignValues.wF.Cfu) + " x " + conToString(woodBeamDesign.a.selectedWoodDesignValues.wF.Cr))
        iNL()
        inorm("F"); isub("b"); inorm(" Allowable = " + conToString(woodBeamDesign.a.selectedWoodDesignValues.FbAdjust) + " psi")
        iNL()
        iNL()
        
        inorm("F"); isub("v"); inorm(" Allowable =  F"); isub("v"); inorm(" x C"); isub("d"); inorm(" x C"); isub("m")
        inorm("F"); isub("v"); inorm(" x C"); isub("t"); inorm("F"); isub("v")
        iNL()
        
        inorm("F"); isub("v"); inorm(" Allowable =  " + conToString(woodBeamDesign.a.selectedWoodDesignValues.limits.Fv) + " x " + conToString(woodBeamDesign.a.selectedWoodDesignValues.wF.Cd) + " x " + conToString(woodBeamDesign.a.selectedWoodDesignValues.wF.CmFv) + " x " + conToString(woodBeamDesign.a.selectedWoodDesignValues.wF.CtFv))
        iNL()
        inorm("F"); isub("v"); inorm(" Allowable = " + conToString(woodBeamDesign.a.selectedWoodDesignValues.FvAdjust) + " psi")
        iNL()
        iNL()
        
        inorm("E_Adjusted =  E x C"); isub("m"); inorm("E x C"); isub("t"); inorm("E");
        iNL()
        inorm("E_Adjusted =  " + conToString(woodBeamDesign.a.selectedWoodDesignValues.limits.E) + " x " + conToString(woodBeamDesign.a.selectedWoodDesignValues.wF.CmE) + " x " + conToString(woodBeamDesign.a.selectedWoodDesignValues.wF.CtE))
        iNL()
        inorm("E_Adjusted = " + conToString(woodBeamDesign.a.selectedWoodDesignValues.EAdjust) + " psi")
        iNL()
    }
    
    func writeWoodMomentData(){
        let M:NSString = NSString(format:"%.2f", woodMaxM().m)
        
        let fb:NSString = conToString(woodBeamDesign.woodDesignSectionCollection[woodMaxM().index].bendingStress * 1000) as NSString
        let bmoment:NSString = conToString(woodBeamDesign.a.selectedWoodSection.width) as NSString
        let dmoment:NSString = conToString(woodBeamDesign.a.selectedWoodSection.depth) as NSString
        
        //insert the force data heading
        ititle("Force Data")
        iNL()
        
        
        let maxMoment = "Maximum Moment Value = " + conToString(woodMaxM().m) + " foot-kips--> location: x = " + conToString(woodMaxM().x) + " feet"
        inorm(maxMoment)
        iNL()
        iImage(momentGraphImage)
        iNL()
        let maxShear = "Maximum Shear Value = " + conToString(woodMaxV().v) + " kips--> location: x = " + conToString(woodMaxV().x) + " feet"
        inorm(maxShear)
        iNL()
        iNL()
        iImage(shearGraphImage)
        iNL()
        let maxDeflection = "Maximum Deflection Value = " + conToString(woodMaxD().d) + " inches--> location: x = " + conToString(woodMaxD().x) + " feet"
        inorm(maxDeflection)
        iNL()
        iImage(deflectionGraphImage)
        iNL()
        iNL()
        
        ititle("Bending Stress")
        iNL()
        
        inorm("Calculate the actual maximum bending stress in the member...")
        iNL()
        inorm("f"); isub("b"); inorm(" = MC/I or f"); isub("b"); inorm(" = M/S or for a rectangular wood section, f"); isub("b");
        inorm(" = (6*M)/(b*d*d)")
        iNL()
        
        inorm("f"); isub("b"); inorm(" = (6 x " + (M as String) + " foot-kips) / (" + (bmoment as String) + " inches x " + (dmoment as String) + " (inches )x" + (dmoment as String) + " inches)")
        iNL()
        
        if fb.doubleValue > woodBeamDesign.a.selectedWoodDesignValues.FbAdjust{
            inorm("f"); isub("b"); inorm(" = " + (fb as String) + " psi > " + conToString(woodBeamDesign.a.selectedWoodDesignValues.FbAdjust) + " psi "); inormRedHL("BENDING - NO GOOD -");
        }else{
            inorm("f"); isub("b"); inorm(" = " + (fb as String) + " psi <= " + conToString(woodBeamDesign.a.selectedWoodDesignValues.FbAdjust) + " psi "); inormGreenHL("BENDING - STRESSES ACCEPTABLE -");
        }
        inorm(".")
        iNL()
    }
    
    func writeWoodShearData(){
        let V:NSString = NSString(format:"%.2f", woodMaxV().v)
        let fv:NSString = conToString(abs(woodBeamDesign.woodDesignSectionCollection[woodMaxV().index].shearStress) * 1000) as NSString
        let bshear:NSString = conToString(woodBeamDesign.a.selectedWoodSection.width) as NSString
        let dshear:NSString = conToString(woodBeamDesign.a.selectedWoodSection.depth) as NSString
        
        
        ititle("Shear Stress")
        iNL()
        
        inorm("Calculate the actual maximum shear stress in the member...")
        inorm("f"); isub("v"); inorm(" = (3 x V)/ (2 x b x d)")
        iNL()
        
        inorm("f"); isub("v"); inorm(" = (3 x " + (V as String) + " kips) / (2 x " + (bshear as String) + " inches x " + (dshear as String) + " inches)")
        iNL()
        
        if fv.doubleValue > woodBeamDesign.a.selectedWoodDesignValues.FvAdjust{
            inorm("f"); isub("v"); inorm(" = " + (fv as String) + " psi > " + conToString(woodBeamDesign.a.selectedWoodDesignValues.FvAdjust) + " psi "); inormRedHL("SHEAR - NO GOOD -")
        }else{
            inorm("f"); isub("v"); inorm(" = " + (fv as String) + " psi <= " + conToString(woodBeamDesign.a.selectedWoodDesignValues.FvAdjust) + " psi "); inormGreenHL("SHEAR - STRESSES ACCEPTABLE -");
        }
        inorm(".")
        iNL()
    }
    
    func writeWoodDeflectionData(){
        
        let D:NSString = NSString(format:"%.2f", woodMaxD().d)
        let L:NSString = NSString(format:"%.2f", woodBeamDesign.a.BeamGeo.length)
        let dLimit = woodBeamDesign.a.BeamGeo.length * 12 / 240
        let dLimitNSString = NSString(format:"%.2f", dLimit)
        
        ititle("Deflection Check")
        iNL()
        inorm("Deflection limit = L/240 -> (" + (L as String) + " x 12) / 240 = " + (dLimitNSString as String) + " Inches")
        iNL()
        
        if woodMaxD().d > dLimit{
            inorm("Max Deflection = " + (D as String) + " Inches "); inormRedHL("DEFLECTION - NO GOOD -")
        }else{
            inorm("Max Deflection = " + (D as String) + " Inches "); inormGreenHL("DEFLECTION - OK - ")
        }
        
        inorm(".")
        
    }
    
    func writeWoodCalculations(){
        writeWoodBeamData()
        iNL()
        writeWoodGradeData()
        iNL()
        writeWoodMomentData()
        iNL()
        writeWoodShearData()
        iNL()
        writeWoodDeflectionData()
        iNL()
    }
    
    
//    func writeLVLBeamData(){
//        
//        //Write Title line
//        ititle("LVL BEAM DESIGN CALCULATIONS")
//        iNL()
//        
//        //Write the desciption name
//        
//        
//        inorm("Beam Description: " + lvlBeamDesign.a.BeamGeo.title)
//        iNL(); iNL()
//        
//        //        inorm("NOTE: TOP CHORD ASSUMED FULLY RESTRAINED")
//        //        iNL(); iNL()
//        
//        //write member data
//        ititle("Member Geometry")
//        iNL()
//        
//        
//        //Write Member Length
//        inorm("Span = " + conToString(lvlBeamDesign.a.BeamGeo.length) + " feet, ")
//        inorm("Design Section = " + (lvlBeamDesign.a.selectedLVLSection.shape as String))
//        iNL()
//        
//        //Write Shape Title
//        inorm("Normal Section Dimensions")
//        iNL()
//        
//        //Write the Member Dimensions and properties
//        
//        inorm("Member Width = " + conToString(lvlBeamDesign.a.selectedLVLSection.width) + " inches, Member Depth = " + conToString(lvlBeamDesign.a.selectedLVLSection.depth) + " inches");
//        iNL()
//        inorm("Moment of Inertia (in graphs) = " + conToString(lvlBeamDesign.a.BeamGeo.I) + " inches"); isuper("4")
//        iNL()
//        inorm("Moment of Inertia (in design) = " + conToString(lvlBeamDesign.a.selectedLVLSection.I) + " inches"); isuper("4")
//        iNL()
//        iNL()
//    }

    
//    func writeLVLGradeData(){
//        //Grade Information Heading
//        ititle("Selected Grade and Adjustment Factors")
//        iNL()
//        
//        //write selected species Name
//        inorm("Species: " + String(lvlBeamDesign.a.selectedLVLDesignValues.limits.manufacturer.rawValue))
//        iNL()
//        
//        //write selected grade name
//        inorm("Grade: " + String(lvlBeamDesign.a.selectedLVLDesignValues.limits.grade.rawValue))
//        iNL()
//        
//        //write selected tabluar allowable stress values
//        inorm("F"); isub("b"); inorm(": " + conToString(lvlBeamDesign.a.selectedLVLDesignValues.limits.Fb) + " psi, F"); isub("v")
//        inorm(": " + conToString(lvlBeamDesign.a.selectedLVLDesignValues.limits.Fv) + " psi, " + "Modulus of Elasticity = " + conToString(lvlBeamDesign.a.BeamGeo.E) + " ksi")
//        iNL()
//        iNL()
//        
//        //write adjustment factors heading
//        ititle("Specified Adjustment Factors")
//        iNL()
//        
//        //write adjustment values line 1
//        inorm("C"); isub("d")
//        inorm(" = " + conToString(lvlBeamDesign.a.selectedLVLDesignValues.wF.Cd) + ", C"); isub("m"); inorm("F"); isub("b")
//        inorm(" = " + conToString(lvlBeamDesign.a.selectedLVLDesignValues.wF.CmFb) + ", " + "C"); isub("m"); inorm("F"); isub("v")
//        inorm(" = " + conToString(lvlBeamDesign.a.selectedLVLDesignValues.wF.CmFv) + ", " + "C"); isub("m"); inorm("E = " + conToString(lvlBeamDesign.a.selectedLVLDesignValues.wF.CmE))
//        iNL()
//        
//        
//        //Write Adjustment Values line 2
//        inorm(" C"); isub("t"); inorm("F"); isub("b"); inorm(" = " + conToString(lvlBeamDesign.a.selectedLVLDesignValues.wF.CtFb) + ", " + "C"); isub("t")
//        inorm("F"); isub("v"); inorm(" = " + conToString(lvlBeamDesign.a.selectedLVLDesignValues.wF.CtFv) + ", " + "C"); isub("t"); inorm("E = " + conToString(lvlBeamDesign.a.selectedLVLDesignValues.wF.CtE));
//        inorm("C"); isub("L"); inorm(" = \(lvlBeamDesign.a.selectedLVLDesignValues.wF.Cl)")
//        iNL()
//        
//        //write Adjustment Values line 3
//        inorm("C"); isub("f"); inorm(" = " + conToString(lvlBeamDesign.a.selectedLVLDesignValues.wF.Cf) + ", " + "C"); isub("fu")
//        inorm(" = " + conToString(lvlBeamDesign.a.selectedLVLDesignValues.wF.Cfu) + ", " + "C"); isub("r"); inorm(" = " + conToString(lvlBeamDesign.a.selectedLVLDesignValues.wF.Cr))
//        iNL()
//        iNL()
//        
//        
//        //write adjusted allowable stresses
//        ititle( "Adjusted Allowable Design Stresses")
//        iNL()
//        
//        inorm("F"); isub("b"); inorm(" Allowable =  F"); isub("b");inorm(" x  C"); isub("d"); inorm(" x C"); isub("m"); inorm("F"); isub("b"); inorm(" x C"); isub("t");
//        inorm(" x C"); isub("L");inorm(" x C"); isub("f");
//        inorm(" x C");isub("fu"); inorm(" x C"); isub("r")
//        iNL()
//        inorm("F"); isub("b"); inorm(" Allowable =  " + conToString(lvlBeamDesign.a.selectedLVLDesignValues.limits.Fb) + " x " + conToString(lvlBeamDesign.a.selectedLVLDesignValues.wF.Cd) + " x " + conToString(lvlBeamDesign.a.selectedLVLDesignValues.wF.CmFb) + " x " + conToString(lvlBeamDesign.a.selectedLVLDesignValues.wF.CtFb) + " x " + conToString(lvlBeamDesign.a.selectedLVLDesignValues.wF.Cl) + " x " + conToString(lvlBeamDesign.a.selectedLVLDesignValues.wF.Cf) + " x " + conToString(lvlBeamDesign.a.selectedLVLDesignValues.wF.Cfu) + " x " + conToString(lvlBeamDesign.a.selectedLVLDesignValues.wF.Cr))
//        iNL()
//        inorm("F"); isub("b"); inorm(" Allowable = " + conToString(lvlBeamDesign.a.selectedLVLDesignValues.FbAdjust) + " psi")
//        iNL()
//        iNL()
//        
//        inorm("F"); isub("v"); inorm(" Allowable =  F"); isub("v"); inorm(" x C"); isub("d"); inorm(" x C"); isub("m")
//        inorm("F"); isub("v"); inorm(" x C"); isub("t"); inorm("F"); isub("v")
//        iNL()
//        
//        inorm("F"); isub("v"); inorm(" Allowable =  " + conToString(lvlBeamDesign.a.selectedLVLDesignValues.limits.Fv) + " x " + conToString(lvlBeamDesign.a.selectedLVLDesignValues.wF.Cd) + " x " + conToString(lvlBeamDesign.a.selectedLVLDesignValues.wF.CmFv) + " x " + conToString(lvlBeamDesign.a.selectedLVLDesignValues.wF.CtFv))
//        iNL()
//        inorm("F"); isub("v"); inorm(" Allowable = " + conToString(lvlBeamDesign.a.selectedLVLDesignValues.FvAdjust) + " psi")
//        iNL()
//        iNL()
//        
//        inorm("E_Adjusted =  E x C"); isub("m"); inorm("E x C"); isub("t"); inorm("E");
//        iNL()
//        inorm("E_Adjusted =  " + conToString(lvlBeamDesign.a.selectedLVLDesignValues.limits.E) + " x " + conToString(lvlBeamDesign.a.selectedLVLDesignValues.wF.CmE) + " x " + conToString(lvlBeamDesign.a.selectedLVLDesignValues.wF.CtE))
//        iNL()
//        inorm("E_Adjusted = " + conToString(lvlBeamDesign.a.selectedLVLDesignValues.EAdjust) + " psi")
//        iNL()
//    }
//
//    
//    func writeLVLMomentData(){
//        let M:NSString = NSString(format:"%.2f", LVLMaxM().m)
//        let fb:NSString = conToString( lvlBeamDesign.LVLDesignSectionCollection[LVLMaxM().index].bendingStress * 1000) as NSString
//        let bmoment:NSString = conToString(lvlBeamDesign.a.selectedLVLSection.width) as NSString
//        let dmoment:NSString = conToString(lvlBeamDesign.a.selectedLVLSection.depth) as NSString
//        
//        //insert the force data heading
//        ititle("Force Data")
//        iNL()
//        
//        
//        let maxMoment = "Maximum Moment Value = " + conToString(LVLMaxM().m) + " foot-kips--> location: x = " + conToString(LVLMaxM().x) + " feet"
//        inorm(maxMoment)
//        iNL()
//        let maxShear = "Maximum Shear Value = " + conToString(LVLMaxV().v) + " kips--> location: x = " + conToString(LVLMaxV().x) + " feet"
//        inorm(maxShear)
//        iNL()
//        let maxDeflection = "Maximum Deflection Value = " + conToString(LVLMaxD().d) + " inches--> location: x = " + conToString(LVLMaxD().x) + " feet"
//        inorm(maxDeflection)
//        iNL()
//        iNL()
//        
//        ititle("Bending Stress")
//        iNL()
//        
//        inorm("Calculate the actual maximum bending stress in the member...")
//        iNL()
//        inorm("f"); isub("b"); inorm(" = MC/I or f"); isub("b"); inorm(" = M/S or for a rectangular wood section, f"); isub("b");
//        inorm(" = (6*M)/(b*d*d)")
//        iNL()
//        
//        inorm("f"); isub("b"); inorm(" = (6 x " + (M as String) + " foot-kips) / (" + (bmoment as String) + " inches x " + (dmoment as String) + " (inches )x" + (dmoment as String) + " inches)")
//        iNL()
//        
//        if fb.doubleValue > lvlBeamDesign.a.selectedLVLDesignValues.FbAdjust{
//            inorm("f"); isub("b"); inorm(" = " + (fb as String) + " psi > " + conToString(lvlBeamDesign.a.selectedLVLDesignValues.FbAdjust) + " psi "); inormRedHL("BENDING - NO GOOD -");
//        }else{
//            inorm("f"); isub("b"); inorm(" = " + (fb as String) + " psi <= " + conToString(lvlBeamDesign.a.selectedLVLDesignValues.FbAdjust) + " psi "); inormGreenHL("BENDING - STRESSES ACCEPTABLE -");
//        }
//        inorm(".")
//        iNL()
//    }
//    
//    func writeLVLShearData(){
//        let V:NSString = NSString(format:"%.2f", LVLMaxV().v)
//        let fv:NSString = conToString(abs(lvlBeamDesign.LVLDesignSectionCollection[LVLMaxV().index].shearStress) * 1000) as NSString
//        let bshear:NSString = conToString(lvlBeamDesign.a.selectedLVLSection.width) as NSString
//        let dshear:NSString = conToString(lvlBeamDesign.a.selectedLVLSection.depth) as NSString
//        
//        
//        ititle("Shear Stress")
//        iNL()
//        
//        inorm("Calculate the actual maximum shear stress in the member...")
//        inorm("f"); isub("v"); inorm(" = (3 x V)/ (2 x b x d)")
//        iNL()
//        
//        inorm("f"); isub("v"); inorm(" = (3 x " + (V as String) + " kips) / (2 x " + (bshear as String) + " inches x " + (dshear as String) + " inches)")
//        iNL()
//        
//        if fv.doubleValue > lvlBeamDesign.a.selectedLVLDesignValues.FvAdjust{
//            inorm("f"); isub("v"); inorm(" = " + (fv as String) + " psi > " + conToString(lvlBeamDesign.a.selectedLVLDesignValues.FvAdjust) + " psi "); inormRedHL("SHEAR - NO GOOD -")
//        }else{
//            inorm("f"); isub("v"); inorm(" = " + (fv as String) + " psi <= " + conToString(lvlBeamDesign.a.selectedLVLDesignValues.FvAdjust) + " psi "); inormGreenHL("SHEAR - STRESSES ACCEPTABLE -");
//        }
//        inorm(".")
//        iNL()
//    }
//    
//    func writeLVLDeflectionData(){
//        
//        let D:NSString = NSString(format:"%.2f", LVLMaxD().d)
//        let L:NSString = NSString(format:"%.2f", lvlBeamDesign.a.BeamGeo.length)
//        let dLimit = lvlBeamDesign.a.BeamGeo.length * 12 / 240
//        let dLimitNSString = NSString(format:"%.2f", dLimit)
//        
//        ititle("Deflection Check")
//        iNL()
//        inorm("Deflection limit = L/240 -> (" + (L as String) + " x 12) / 240 = " + (dLimitNSString as String) + " Inches")
//        iNL()
//        
//        if LVLMaxD().d > dLimit{
//            inorm("Max Deflection = " + (D as String) + " Inches "); inormRedHL("DEFLECTION - NO GOOD -")
//        }else{
//            inorm("Max Deflection = " + (D as String) + " Inches "); inormGreenHL("DEFLECTION - OK - ")
//        }
//        
//        inorm(".")
//        
//    }
//
//    
//    
//    func writeLVLCalculations(){
//        writeLVLBeamData()
//        iNL()
//        writeLVLGradeData()
//        iNL()
//        writeLVLMomentData()
//        iNL()
//        writeLVLShearData()
//        iNL()
//        writeLVLDeflectionData()
//        iNL()
//    }
//    
    
    
    
    
//    func writeSteelWBeamData(){
//        
//        //Write Title line
//        ititle("BEAM DESIGN CALCULATIONS")
//        iNL()
//        
//        //Write the desciption name
//        
//        
//        inorm("Beam Description: " + steelWBeamDesign.a.BeamGeo.title)
//        iNL(); iNL()
//        
//        //        inorm("NOTE: TOP CHORD ASSUMED FULLY RESTRAINED")
//        //        iNL(); iNL()
//        
//        //write member data
//        ititle("Member Geometry")
//        iNL()
//        
//        
//        //Write Member Length
//        inorm("Span = " + conToString(steelWBeamDesign.a.BeamGeo.length) + " feet")
//        iNL()
//        
//        //Write Shape Title
//        inorm("Specified Section Properties")
//        iNL()
//        
//        //Write the Member Dimensions and properties
//        inorm("Selected W Section = " + (steelWBeamDesign.a.selectedSteelWSection.shape as String))
//        iNL()
//        
//        inorm("Member Width = " + conToString(steelWBeamDesign.a.selectedSteelWSection.width) + " inches, Member Depth = " + conToString(steelWBeamDesign.a.selectedSteelWSection.depth) + " inches");
//        iNL()
//        
//        inorm("Shape Area (total) = " + conToString(steelWBeamDesign.a.selectedSteelWSection.area) + " inches"); isuper("2")
//        iNL()
//        
//        inorm("Shear Area (for shear resistance) = " + conToString(steelWBeamDesign.a.selectedSteelWSection.vArea) + " inches"); isuper("2")
//        iNL()
//        
//        inorm("Section Modulus = " + conToString(steelWBeamDesign.a.selectedSteelWSection.sectionModulus) + " inches"); isuper("3")
//        iNL()
//        
//        inorm("Moment of Inertia (in graphs) = " + conToString(steelWBeamDesign.a.BeamGeo.I) + " inches"); isuper("4")
//        iNL()
//        inorm("Moment of Inertia (in design) = " + conToString(steelWBeamDesign.a.selectedSteelWSection.I) + " inches"); isuper("4")
//        iNL()
//        iNL()
//    }
//    
//    func writeSteelWGradeData(){
//        //Grade Information Heading
//        ititle("Selected Grade and Safety Factors")
//        iNL()
//        
//        //write selected grade name
//        inorm("Grade: " + String(steelWBeamDesign.a.selectedSteelWDesignValues.limits.grade.rawValue) + " yield stress")
//        iNL()
//        
//        //write adjustment values line 1
//        inorm("F"); isub("b"); inorm(" factor of safety")
//        inorm(" = " + conToString(steelWBeamDesign.a.selectedSteelWDesignValues.steelFactors.fbSafetyFactor))
//        iNL()
//        
//        inorm("F"); isub("v"); inorm(" factor of safety")
//        inorm(" = " + conToString(steelWBeamDesign.a.selectedSteelWDesignValues.steelFactors.fvSafetyFactor))
//        iNL()
//            
//        inorm("E factor of safety = 1.0")
//        iNL(); iNL()
//        
//        
//        
//        //write adjusted allowable stresses
//        ititle( "Adjusted Allowable Design Stresses")
//        iNL()
//        
//        inorm("F"); isub("b"); inorm(" Allowable =  F"); isub("b"); inorm(" x  ");inorm(conToString(steelWBeamDesign.a.selectedSteelWDesignValues.steelFactors.fbSafetyFactor)); inorm(" = "); inorm(conToString(steelWBeamDesign.a.selectedSteelWDesignValues.limits.Fb)); inorm(" psi x "); inorm(conToString(steelWBeamDesign.a.selectedSteelWDesignValues.steelFactors.fbSafetyFactor)); inorm(" = "); inorm(conToString(steelWBeamDesign.a.selectedSteelWDesignValues.FbAdjust)); inorm(" psi")
//        iNL()
//        
//        inorm("F"); isub("v"); inorm(" Allowable =  F"); isub("v"); inorm(" x  ");inorm(conToString(steelWBeamDesign.a.selectedSteelWDesignValues.steelFactors.fvSafetyFactor)); inorm(" = "); inorm(conToString(steelWBeamDesign.a.selectedSteelWDesignValues.limits.Fv)); inorm(" psi x "); inorm(conToString(steelWBeamDesign.a.selectedSteelWDesignValues.steelFactors.fvSafetyFactor)); inorm(" = "); inorm(conToString(steelWBeamDesign.a.selectedSteelWDesignValues.FvAdjust)); inorm(" psi")
//        iNL()
//        
//            }
//    
//    func writeSteelWMomentData(){
//        let M:NSString = NSString(format:"%.2f", steelWMaxM().m)
//        let fb:NSString = conToString(steelWBeamDesign.steelWDesignSectionCollection[steelWMaxM().index].bendingStress * 1000) as NSString
//        
//        //insert the force data heading
//        ititle("Force Data")
//        iNL()
//        
//        
//        let maxMoment = "Maximum Moment Value = " + conToString(steelWMaxM().m) + " foot-kips--> location: x = " + conToString(steelWMaxM().x) + " feet"
//        inorm(maxMoment)
//        iNL()
//        let maxShear = "Maximum Shear Value = " + conToString(steelWMaxV().v) + " kips--> location: x = " + conToString(steelWMaxV().x) + " feet"
//        inorm(maxShear)
//        iNL()
//        let maxDeflection = "Maximum Deflection Value = " + conToString(steelWMaxD().d) + " inches--> location: x = " + conToString(steelWMaxD().x) + " feet"
//        inorm(maxDeflection)
//        iNL()
//        iNL()
//        
//        ititle("Bending Stress")
//        iNL()
//        
//        inorm("Calculate the actual maximum bending stress in the member...")
//        iNL()
//        
//        inorm("f"); isub("b"); inorm(" = MC/I or f"); isub("b"); inorm(" = M/S")
//        iNL()
//        
//        inorm("f"); isub("b");
//        inorm(" = " + (M as String) + " foot-kips x 12 * 1000 / ")
//        inorm(conToString(steelWBeamDesign.a.selectedSteelWSection.sectionModulus) + " inches")
//        isuper("3")
//        iNL()
//        
//        if fb.doubleValue > steelWBeamDesign.a.selectedSteelWDesignValues.FbAdjust{
//            inorm("f"); isub("b"); inorm(" = " + (fb as String) + " psi > " + conToString(steelWBeamDesign.a.selectedSteelWDesignValues.FbAdjust) + " psi "); inormRedHL("BENDING - NO GOOD -");
//        }else{
//            inorm("f"); isub("b"); inorm(" = " + (fb as String) + " psi <= " + conToString(steelWBeamDesign.a.selectedSteelWDesignValues.FbAdjust) + " psi "); inormGreenHL("BENDING - STRESSES ACCEPTABLE -");
//        }
//        inorm(".")
//        iNL()
//    }
//    
//    func writeSteelWShearData(){
//        let V:NSString = NSString(format:"%.2f", steelWMaxV().v)
//        let fv:NSString = conToString(abs(steelWBeamDesign.steelWDesignSectionCollection[steelWMaxV().index].shearStress) * 1000) as NSString
//        
//        
//        
//        ititle("Shear Stress")
//        iNL()
//        
//        inorm("Calculate the actual maximum shear stress in the member...")
//        inorm("f"); isub("v"); inorm(" =  3 x V / (2 x tw x d)")
//        iNL()
//        
//        inorm("f"); isub("v"); inorm(" = 3 x" + (V as String) + " kips x 1000 / (2 x" + conToString(steelWBeamDesign.a.selectedSteelWSection.webThickness)  + " inches x " + conToString(steelWBeamDesign.a.selectedSteelWSection.depth) + " inches)");
//        //isuper("2")
//        iNL()
//        
//        if fv.doubleValue > steelWBeamDesign.a.selectedSteelWDesignValues.FvAdjust{
//            inorm("f"); isub("v"); inorm(" = " + (fv as String) + " psi > " + conToString(steelWBeamDesign.a.selectedSteelWDesignValues.FvAdjust) + " psi "); inormRedHL("SHEAR - NO GOOD -")
//        }else{
//            inorm("f"); isub("v"); inorm(" = " + (fv as String) + " psi <= " + conToString(steelWBeamDesign.a.selectedSteelWDesignValues.FvAdjust) + " psi "); inormGreenHL("SHEAR - STRESSES ACCEPTABLE -");
//        }
//        inorm(".")
//        iNL()
//    }
//    
//    func writeSteelWDeflectionData(){
//        
//        let D:NSString = NSString(format:"%.2f", steelWMaxD().d)
//        let L:NSString = NSString(format:"%.2f", steelWBeamDesign.a.BeamGeo.length)
//        let dLimit = steelWBeamDesign.a.BeamGeo.length * 12 / 240
//        let dLimitNSString = NSString(format:"%.2f", dLimit)
//        
//        ititle("Deflection Check")
//        iNL()
//        inorm("Deflection limit = L/240 -> (" + (L as String) + " x 12) / 240 = " + (dLimitNSString as String) + " Inches")
//        iNL()
//        
//        if steelWMaxD().d > dLimit{
//            inorm("Max Deflection = " + (D as String) + " Inches "); inormRedHL("DEFLECTION - NO GOOD -")
//        }else{
//            inorm("Max Deflection = " + (D as String) + " Inches "); inormGreenHL("DEFLECTION - OK - ")
//        }
//        
//        inorm(".")
//        
//    }
//    
//    func writeSteelWCalculations(){
//        writeSteelWBeamData()
//        iNL()
//        writeSteelWGradeData()
//        iNL()
//        writeSteelWMomentData()
//        iNL()
//        writeSteelWShearData()
//        iNL()
//        writeSteelWDeflectionData()
//        iNL()
//        
//    }
    
//    func writeSteelLBeamData(){
//        
//        //Write Title line
//        ititle("BEAM DESIGN CALCULATIONS")
//        iNL()
//        
//        //Write the desciption name
//        
//        
//        inorm("Beam Description: " + steelWBeamDesign.a.BeamGeo.title)
//        iNL(); iNL()
//        
//        //        inorm("NOTE: TOP CHORD ASSUMED FULLY RESTRAINED")
//        //        iNL(); iNL()
//        
//        //write member data
//        ititle("Member Geometry")
//        iNL()
//        
//        
//        //Write Member Length
//        inorm("Span = " + conToString(steelWBeamDesign.a.BeamGeo.length) + " feet")
//        iNL()
//        
//        //Write Shape Title
//        inorm("Specified Section Properties")
//        iNL()
//        
//        //Write the Member Dimensions and properties
//        ititle("Selected Angle Section = " + (steelWBeamDesign.a.selectedSteelWSection.shape as String))
//        iNL()
//        
//        inorm("Member Width = " + conToString(steelWBeamDesign.a.selectedSteelWSection.width) + " inches, Member Depth = " + conToString(steelWBeamDesign.a.selectedSteelWSection.depth) + " inches");
//        iNL()
//        
//        inorm("Shape Area (total) = " + conToString(steelWBeamDesign.a.selectedSteelWSection.area) + " inches"); isuper("2")
//        iNL()
//        
//        inorm("Shear Area (for shear resistance) = " + conToString(steelWBeamDesign.a.selectedSteelWSection.vArea) + " inches"); isuper("2")
//        iNL()
//        
//        inorm("Section Modulus = " + conToString(steelWBeamDesign.a.selectedSteelWSection.sectionModulus) + " inches"); isuper("3")
//        iNL()
//        
//        inorm("Moment of Inertia (in graphs) = " + conToString(steelWBeamDesign.a.BeamGeo.I) + " inches"); isuper("4")
//        iNL()
//        inorm("Moment of Inertia (in design) = " + conToString(steelWBeamDesign.a.selectedSteelWSection.I) + " inches"); isuper("4")
//        iNL()
//        iNL()
//    }
//    
//    func writeSteelLGradeData(){
//        //Grade Information Heading
//        ititle("Selected Grade and Safety Factors")
//        iNL()
//        
//        //write selected grade name
//        inorm("Grade: " + String(steelWBeamDesign.a.selectedSteelWDesignValues.limits.grade.rawValue) + " yield stress")
//        iNL()
//        
//        //write adjustment values line 1
//        inorm("F"); isub("b"); inorm(" factor of safety")
//        inorm(" = " + conToString(steelWBeamDesign.a.selectedSteelWDesignValues.steelFactors.angleFSFb))
//        iNL()
//        
//        inorm("F"); isub("v"); inorm(" factor of safety")
//        inorm(" = " + conToString(steelWBeamDesign.a.selectedSteelWDesignValues.sF.angleFSFv))
//        iNL()
//        
//        inorm("E factor of safety = 1.0")
//        iNL(); iNL()
//        
//        
//        
//        //write adjusted allowable stresses
//        ititle( "Adjusted Allowable Design Stresses")
//        iNL()
//        
//        inorm("F"); isub("b"); inorm(" Allowable =  F"); isub("b"); inorm(" x  ");inorm(conToString(designValues.sF.angleFSFb)); inorm(" = "); inorm(conToString(designValues.limits.Fb)); inorm(" psi x "); inorm(conToString(steelWBeamDesign.a.selectedSteelWDesignValues.sF.angleFSFb)); inorm(" = "); inorm(conToString(steelWBeamDesign.a.selectedSteelWDesignValues.FbAngleAdjust)); inorm(" psi")
//        iNL()
//        
//        inorm("F"); isub("v"); inorm(" Allowable =  F"); isub("v"); inorm(" x  ");inorm(conToString(designValues.sF.angleFSFv)); inorm(" = "); inorm(conToString(designValues.limits.Fv)); inorm(" psi x "); inorm(conToString(steelWBeamDesign.a.selectedSteelWDesignValues.sF.angleFSFv)); inorm(" = "); inorm(conToString(steelWBeamDesign.a.selectedSteelWDesignValues.FvAngleAdjust)); inorm(" psi")
//        iNL()
//        
//    }
//
//    
//    func writeSteelLCalculations(){
//        writeSteelLBeamData()
//        iNL()
//        writeSteelLGradeData()
//        iNL()
//        writeSteelWMomentData()
//        iNL()
//        writeSteelWShearData()
//        iNL()
//        writeDeflectionData()
//        iNL()
//        
//    }
    
    fileprivate func woodMaxM()->(x:Double, m:Double, index:Int){
        
        var x:Double = 0
        var m:Double = 0
        var index:Int = 0
        
        for i in 0...woodBeamDesign.woodDesignSectionCollection.count-1{
            if woodBeamDesign.woodDesignSectionCollection[i].designMoment > m{
                x = woodBeamDesign.woodDesignSectionCollection[i].location
                m = woodBeamDesign.woodDesignSectionCollection[i].designMoment
                index = i
            }//end if
        }//end for
        
        return (x,m,index)
    }//end func
    
    fileprivate func woodMaxV()->(x:Double, v:Double, index:Int){
        var x:Double = 0
        var v:Double = 0
        var index:Int = 0
        
        
        for i in 0...woodBeamDesign.woodDesignSectionCollection.count-1{
            if abs(woodBeamDesign.woodDesignSectionCollection[i].designShear) > v{
                x = woodBeamDesign.woodDesignSectionCollection[i].location
                v = abs(woodBeamDesign.woodDesignSectionCollection[i].designShear)
                index = i
            }//end if
        }//end for
        
        return (x,v, index)
    }//end func
    
    fileprivate func woodMaxD()->(x:Double, d:Double, index:Int){
        var x:Double = 0
        var d:Double = 0
        var index:Int = 0
        
        for i in 0...woodBeamDesign.woodDesignSectionCollection.count-1{
            if woodBeamDesign.woodDesignSectionCollection[i].deflection > d{
                x = woodBeamDesign.woodDesignSectionCollection[i].location
                d = woodBeamDesign.woodDesignSectionCollection[i].deflection
                index = i
            }//end if
        }//end for
        
        return (x,d,index)
    }//end func
    
    
    
//    fileprivate func LVLMaxM()->(x:Double, m:Double, index:Int){
//        var x:Double = 0
//        var m:Double = 0
//        var index:Int = 0
//        
//        for i in 0...lvlBeamDesign.LVLDesignSectionCollection.count-1{
//            if lvlBeamDesign.LVLDesignSectionCollection[i].designMoment > m{
//                x = lvlBeamDesign.LVLDesignSectionCollection[i].location
//                m = lvlBeamDesign.LVLDesignSectionCollection[i].designMoment
//                index = i
//            }//end if
//        }//end for
//        
//        return (x,m,index)
//    }//end func
//    
//    fileprivate func LVLMaxV()->(x:Double, v:Double, index:Int){
//        var x:Double = 0
//        var v:Double = 0
//        var index:Int = 0
//        
//        
//        for i in 0...lvlBeamDesign.LVLDesignSectionCollection.count-1{
//            if abs(lvlBeamDesign.LVLDesignSectionCollection[i].designShear) > v{
//                x = lvlBeamDesign.LVLDesignSectionCollection[i].location
//                v = abs(lvlBeamDesign.LVLDesignSectionCollection[i].designShear)
//                index = i
//            }//end if
//        }//end for
//        
//        return (x,v, index)
//    }//end func
//    
//    fileprivate func LVLMaxD()->(x:Double, d:Double, index:Int){
//        var x:Double = 0
//        var d:Double = 0
//        var index:Int = 0
//        
//        for i in 0...lvlBeamDesign.LVLDesignSectionCollection.count-1{
//            if lvlBeamDesign.LVLDesignSectionCollection[i].deflection > d{
//                x = lvlBeamDesign.LVLDesignSectionCollection[i].location
//                d = lvlBeamDesign.LVLDesignSectionCollection[i].deflection
//                index = i
//            }//end if
//        }//end for
//        
//        return (x,d,index)
//    }//end func
//    
//    
//    
//    fileprivate func steelWMaxM()->(x:Double, m:Double, index:Int){
//        var x:Double = 0
//        var m:Double = 0
//        var index:Int = 0
//        
//        for i in 0...steelWBeamDesign.steelWDesignSectionCollection.count-1{
//            if steelWBeamDesign.steelWDesignSectionCollection[i].designMoment > m{
//                x = steelWBeamDesign.steelWDesignSectionCollection[i].location
//                m = steelWBeamDesign.steelWDesignSectionCollection[i].designMoment
//                index = i
//            }//end if
//        }//end for
//        
//        return (x,m,index)
//    }//end func
//    
//    fileprivate func steelWMaxV()->(x:Double, v:Double, index:Int){
//        var x:Double = 0
//        var v:Double = 0
//        var index:Int = 0
//        
//        
//        for i in 0...steelWBeamDesign.steelWDesignSectionCollection.count-1{
//            if abs(steelWBeamDesign.steelWDesignSectionCollection[i].designShear) > v{
//                x = steelWBeamDesign.steelWDesignSectionCollection[i].location
//                v = abs(steelWBeamDesign.steelWDesignSectionCollection[i].designShear)
//                index = i
//            }//end if
//        }//end for
//        
//        return (x,v, index)
//    }//end func
//    
//    fileprivate func steelWMaxD()->(x:Double, d:Double, index:Int){
//        var x:Double = 0
//        var d:Double = 0
//        var index:Int = 0
//        
//        for i in 0...steelWBeamDesign.steelWDesignSectionCollection.count-1{
//            if steelWBeamDesign.steelWDesignSectionCollection[i].deflection > d{
//                x = steelWBeamDesign.steelWDesignSectionCollection[i].location
//                d = steelWBeamDesign.steelWDesignSectionCollection[i].deflection
//                index = i
//            }//end if
//        }//end for
//        
//        return (x,d,index)
//    }//end func
//    
//    
    
    func highlightRange(){
        
        let myFont = UIFont(name: "Marker Felt Thin", size: 16)!
        let theString:NSString = tView.text! as NSString
        let calclength:Int = theString.length
        
        let myRange:NSRange = NSMakeRange(0,calclength-10)
        
        
        //tView.font(myFont, range:myRange)
        
        tView.textStorage.addAttribute(NSFontAttributeName, value: myFont, range: myRange)
        
        let range1:NSRange = NSMakeRange(0, Int(calclength/2))
        let range2:NSRange = NSMakeRange(Int(calclength/2), Int(calclength/2))
        
        
        
        tView.textStorage.addAttribute(NSForegroundColorAttributeName, value: UIColor.blue, range: range1)
        
        tView.textStorage.addAttribute(NSBackgroundColorAttributeName, value: UIColor.yellow, range: range2)

    }
    
    
    
    
    //PDF Creation
    
    
    var fileName:String = "BeamDesign.pdf"
    var path:String = NSTemporaryDirectory()
    var pdfPathWithFilename:String = ""
    var documentInteractionController:UIDocumentInteractionController = UIDocumentInteractionController()
    
    @IBAction func click_PDF(_ sender: UIButton) {
        
        pdfPathWithFilename = path + fileName
        let myURL:URL = URL(fileURLWithPath: pdfPathWithFilename)
        
        //this is where I will create the PDF
        print("Create PDF fired!")
        
        let pageSize:CGSize = CGSize(width: 612,height: 792) //612,792 is 8.5x11
        
        
        UIGraphicsBeginPDFContextToFile(pdfPathWithFilename, CGRect.zero, nil)
        
        drawPDFContent(pageSize)
        
        UIGraphicsEndPDFContext()
        //end create the PDF
        
        
        //This will allow open in
        documentInteractionController = UIDocumentInteractionController(url: myURL)
        
        documentInteractionController.delegate = self
        documentInteractionController.uti = "com.adobe.pdf"
        let originRect:CGRect = CGRect(x: sender.frame.origin.x - 530, y: sender.frame.origin.y, width: 10, height: 10)
       documentInteractionController.presentOpenInMenu(from: originRect, in: sender, animated: true)
        //end open in
        Swift.print("Open in should have appeared")
    }
    
    
    
    
    
    func drawPDFContent(_ pageSize:CGSize){
        let leftMargin = 50
        let topMargin = 50

        Swift.print("Size.width = \(tView.textStorage.size().width)")
        Swift.print("Size.height = \(tView.textStorage.size().height)")
        
        let pageRect = CGRect(x: leftMargin, y: topMargin, width: Int(pageSize.width) - leftMargin - leftMargin, height: Int(pageSize.height) - topMargin - topMargin)
    
        
        //Page 1
        UIGraphicsBeginPDFPageWithInfo(CGRect(x: 0, y: 0, width: 612, height: 792), nil)
        let pdfOutput = tView.textStorage.attributedSubstring(from: NSMakeRange(0, 113))
        pdfOutput.draw(in: pageRect)
        
        
        //Page 2
        UIGraphicsBeginPDFPageWithInfo(CGRect(x: 0, y: 0, width: 612, height: 792), nil)
        let pdfOutput2 = tView.textStorage.attributedSubstring(from: NSMakeRange(113, 938))
        pdfOutput2.draw(in: pageRect)

        //Page 3
        UIGraphicsBeginPDFPageWithInfo(CGRect(x: 0, y: 0, width: 612, height: 792), nil)
        let pdfOutput3 = tView.textStorage.attributedSubstring(from: NSMakeRange(1051, 747))
        pdfOutput3.draw(in: pageRect)
        
        
    }
    
    
    
    
    
  
}

