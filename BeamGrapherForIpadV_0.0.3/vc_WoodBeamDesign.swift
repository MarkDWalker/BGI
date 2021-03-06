//
//  vc_WoodBeamDesign.swift
//  BeamGrapherForIpadV_0.0.3
//
//  Created by Mark Walker on 6/17/17.
//  Copyright © 2017 Mark Walker. All rights reserved.
//

import UIKit

class vc_WoodBeamDesign: UIViewController, UITableViewDelegate, UITableViewDataSource, hasMemberRowToUpdate, hasMemberGradeToUpdate, MyCellDelegator, MWFactorReceiver {
    var beamAndLoadImage = UIImage()
    
    
    
    var loadGraphImage = UIImage()
    var momentGraphImage = UIImage()
    var shearGraphImage = UIImage()
    var deflectionGraphImage = UIImage()
    
    @IBOutlet weak var statusBar: MWNSViewForTBStatus!
    @IBOutlet weak var sectionLabel: UILabel!
    @IBOutlet weak var gradeLabel: UILabel!
    
    @IBOutlet weak var factorTable: UITableView!
    
    @IBOutlet weak var stressTable: UITableView!
    
    
    var design = MWWoodBeamDesign()
    var statusColor = UIColor.green
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        design.updateDesignSectionCollections()
        
        
        
        
        factorTable.delegate = self
        factorTable.dataSource = self
        
        stressTable.delegate = self
        stressTable.dataSource = self
        
        updateLabels()
        updateStatusBar()
        
        
        
    }
    
    private func updateLabels(){
        
        let shape = design.a.selectedWoodSection.shape
        let d = design.a.selectedWoodSection.depth
        let w = design.a.selectedWoodSection.width
        let area = design.a.selectedWoodSection.area
        let I = design.a.selectedWoodSection.I
        let S = design.a.selectedWoodSection.sectionModulus
        
        let string1  = (shape as String) + "  |  w = " + "\(w)" + "  |  d = "
        let string2 = "\(d)" + "  |  a = " + "\(area)" + "  |  I = "
        let string3 =  "\(I)" + "  |  S = " + "\(S)"
        
        sectionLabel.text = string1 + string2 + string3
        
        
        let grade = design.a.selectedWoodDesignValues.limits.grade.rawValue
        let species = design.a.selectedWoodDesignValues.limits.species.rawValue
        let fbTab = design.a.selectedWoodDesignValues.limits.Fb
        let fvTab = design.a.selectedWoodDesignValues.limits.Fv
        let eTab = design.a.selectedWoodDesignValues.limits.E
        
        let string4 = (grade as String) + "  |  " + (species as String) + "  |  Fb = " + "\(fbTab)"
        let string5 = " psi" + "  |  Fv = " + "\(fvTab)" + " psi  |   E = " + "\(eTab)" + " ksi"
        
        gradeLabel.text = string4 + string5
        
    }
    
    func updateStatusBar(){
    
        //update the status bar
        let failColor = UIColor.init(red: 1, green: 0, blue: 0, alpha: 0.85)
        let warningColor = UIColor.init(red: 0.95, green: 0.95, blue: 0.00, alpha: 1)
        let passColor = UIColor.init(red: 0, green: 0.60, blue: 0.30, alpha: 1)
        let nullColor = UIColor.clear
        
        let stringZ = "\(design.a.BeamGeo.title)  |  "
        let stringA = "Wood Section   |   "
        let stringB = design.a.selectedWoodSection.shape as String
        let stringC = "  |  \(design.a.selectedWoodDesignValues.limits.grade.rawValue) "
        var statusString =  stringZ + stringA + stringB + stringC
        
        var worstFailPercent:Double = 0
        
        if design.woodDesignSectionCollection.count <= 0{
            statusColor = nullColor
            statusString = "no loads"
        }else{
            statusColor = passColor
            
            
            var failCount:Int = 0
            
            
            
            for i in 0...design.woodDesignSectionCollection.count-1{
                
                
                if design.woodDesignSectionCollection[i].bendingStress * 1000 > design.a.selectedWoodDesignValues.FbAdjust{
                    statusColor = failColor
                    failCount += 1
                }
                
                if abs(design.woodDesignSectionCollection[i].shearStress * 1000) >  design.a.selectedWoodDesignValues.FbAdjust{
                    statusColor = failColor
                    failCount += 1
                }
                
                if abs(( 12 * design.a.BeamGeo.length) / design.woodDesignSectionCollection[i].deflection) < Double(design.a.selectedWoodDesignValues.limits.deflectionLimit){
                    if failCount == 0{
                        statusColor = warningColor
                    }else{
                        statusColor = failColor
                    }
                    
                }
                
                let failPercentM =  design.woodDesignSectionCollection[i].bendingStress * 1000 / design.a.selectedWoodDesignValues.FbAdjust
                
                let failPercentV = abs(design.woodDesignSectionCollection[i].shearStress * 1000) /   design.a.selectedWoodDesignValues.FbAdjust
                
                if failPercentM > worstFailPercent{
                    worstFailPercent = failPercentM
                }
                
                if failPercentV > worstFailPercent{
                    worstFailPercent = failPercentV
                }
                
                
            }//end for
        }

        
        
        statusBar.setAndDrawContent(statusString, passColor: statusColor, passPercent:worstFailPercent)  //todo Add failPercent to this function
        statusBar.setNeedsDisplay()
        }
    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func back_Click(_ sender: Any) {
        
        self.dismiss(animated: true, completion: nil)
    }
    
    
//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        
//        let title:String = "Wood Section Selection"
//        
//        return title
//    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        var rowCount = 0
        if tableView.restorationIdentifier == "factorTable"{
            rowCount = 7
        }else if tableView.restorationIdentifier == "stressTable"{
            rowCount = design.woodDesignSectionCollection.count
        }
        
        return rowCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let returnCell = tableView.cellForRow(at: indexPath)
        
        if (tableView.restorationIdentifier == "factorTable"){
            let Cell3 = factorTable.dequeueReusableCell(withIdentifier: "factorCell", for: indexPath) as! CustomCell_FactorCell
            let row = indexPath.row
            
            if row == 0{
                Cell3.factorLabel.text = "Cd"
                Cell3.descriptionLabel.text = "Load Duration Factor"
                Cell3.fbFactorLabel.text = "\(design.a.selectedWoodDesignValues.wF.Cd)"
                Cell3.fvFactorLabel.text = "\(design.a.selectedWoodDesignValues.wF.Cd)"
                Cell3.eFactorLabel.text = "n/a"
            }else if row == 1{
                Cell3.factorLabel.text = "Cm"
                Cell3.descriptionLabel.text = "Wet Service Factor"
                Cell3.fbFactorLabel.text = "\(design.a.selectedWoodDesignValues.wF.CmFb)"
                Cell3.fvFactorLabel.text = "\(design.a.selectedWoodDesignValues.wF.CmFv)"
                Cell3.eFactorLabel.text = "n/a"
            }else if row == 2{
                Cell3.factorLabel.text = "Ct"
                Cell3.descriptionLabel.text = "Temperature Factor"
                Cell3.fbFactorLabel.text = "\(design.a.selectedWoodDesignValues.wF.CtFb)"
                Cell3.fvFactorLabel.text = "\(design.a.selectedWoodDesignValues.wF.CtFv)"
                Cell3.eFactorLabel.text = "\(design.a.selectedWoodDesignValues.wF.CtE)"
            }else if row == 3{
                Cell3.factorLabel.text = "Cf"
                Cell3.descriptionLabel.text = "Size Factor"
                Cell3.fbFactorLabel.text = "\(design.a.selectedWoodDesignValues.wF.Cf)"
                Cell3.fvFactorLabel.text = "n/a"
                Cell3.eFactorLabel.text = "n/a"
            }else if row == 4{
                Cell3.factorLabel.text = "Cfu"
                Cell3.descriptionLabel.text = "Flat Use Factor"
                Cell3.fbFactorLabel.text = "\(design.a.selectedWoodDesignValues.wF.Cfu)"
                Cell3.fvFactorLabel.text = "n/a"
                Cell3.eFactorLabel.text = "n/a"
            }else if row == 5{
                Cell3.factorLabel.text = "Cr"
                Cell3.descriptionLabel.text = "Repetitive Member Factor"
                Cell3.fbFactorLabel.text = "\(design.a.selectedWoodDesignValues.wF.Cr)"
                Cell3.fvFactorLabel.text = "n/a"
                Cell3.eFactorLabel.text = "n/a"
            }else if row==6{
                Cell3.factorLabel.text = "Cl"
                Cell3.descriptionLabel.text = "Beam Stability Factor"
                Cell3.fbFactorLabel.text = "\(design.a.selectedWoodDesignValues.wF.Cl)"
                Cell3.fvFactorLabel.text = "n/a"
                Cell3.eFactorLabel.text = "n/a"
            }
            Cell3.delegate = self
            
            if indexPath.row % 2 == 0 {
                Cell3.backgroundColor = UIColor(red: 0.96, green: 0.96, blue: 0.96, alpha: 1)
                
            }else{
                Cell3.backgroundColor = UIColor.white
            }
            return Cell3
            
        }else if (tableView.restorationIdentifier == "stressTable"){
       
            let row = indexPath.row
            let cell = stressTable.dequeueReusableCell(withIdentifier: "stressCell", for: indexPath) as! CustomCell_StressResults
            
            cell.pt.text = "\(row)"
            cell.x.text = NSString(format:"%.2f", design.woodDesignSectionCollection[row].location) as String
            
            cell.FbAdjusted.text = NSString(format:"%.2f", design.a.selectedWoodDesignValues.FbAdjust) as String
            
            
            
            if design.woodDesignSectionCollection[row].bendingStress * 1000 > design.a.selectedWoodDesignValues.FbAdjust{
                cell.FbAdjusted.textColor = UIColor.red
                
            }else{
                cell.FbAdjusted.textColor = UIColor.blue
            }
            
        
            cell.fbActual.text = NSString(format:"%.2f",design.woodDesignSectionCollection[row].bendingStress * 1000) as String
            if design.woodDesignSectionCollection[row].bendingStress * 1000 > design.a.selectedWoodDesignValues.FbAdjust{
                cell.fbActual.textColor = UIColor.red
            }else{
                cell.fbActual.textColor = UIColor.blue
            }

            cell.FvAdjusted.text = NSString(format:"%.2f",design.a.selectedWoodDesignValues.FvAdjust) as String
            if abs(design.woodDesignSectionCollection[row].shearStress * 1000) > design.a.selectedWoodDesignValues.FvAdjust{
                cell.FvAdjusted.textColor = UIColor.red
            }else{
                cell.FvAdjusted.textColor = UIColor.blue
            }
            
            cell.fvActual.text = NSString(format:"%.2f",abs(design.woodDesignSectionCollection[row].shearStress * 1000)) as String
            if abs(design.woodDesignSectionCollection[row].shearStress * 1000) > design.a.selectedWoodDesignValues.FvAdjust{
                cell.fvActual.textColor = UIColor.red
            }else{
                cell.fvActual.textColor = UIColor.blue
            }
            
            cell.deflection.text = NSString(format:"%.2f", abs(design.woodDesignSectionCollection[row].deflection)) as String
            
            if abs(( 12 * design.a.BeamGeo.length) / design.woodDesignSectionCollection[row].deflection) < Double(design.a.selectedWoodDesignValues.limits.deflectionLimit){
                cell.deflection.textColor = UIColor.red
            }else{
                cell.deflection.textColor = UIColor.blue
            }
            
            
            
            let dRatio:Double = (design.a.BeamGeo.length * 12) / (abs(design.woodDesignSectionCollection[row].deflection))
            if dRatio > 10000{
                cell.dRatio.text = "NA"
            }else{
                cell.dRatio.text = NSString(format:"%.2f", dRatio) as String
            }
            
            if abs((12 * design.a.BeamGeo.length) / design.woodDesignSectionCollection[row].deflection) < Double(design.a.selectedWoodDesignValues.limits.deflectionLimit){
                cell.dRatio.textColor = UIColor.red
            }else{
                cell.dRatio.textColor = UIColor.blue
            }
            
            if indexPath.row % 2 == 0 {
                cell.backgroundColor = UIColor(red: 0.96, green: 0.96, blue: 0.96, alpha: 1)
                
            }else{
                cell.backgroundColor = UIColor.white
            }
            
            
            return cell
        
        }
        
        return returnCell!
    }
    

    
    func updateMemberRow(row:Int){
        self.design.a.selectedWoodSection.setSectionData(row)
        self.design.updateDesignSectionCollections()
        updateLabels()
        stressTable.reloadData()
        updateStatusBar()
        
    }
    
    func updateGradeRow(row:Int){
        var speciesToSet = speciesEnum.syp
        var gradeToSet = woodGradeEnum.denseSelectStructural
        
        if row >= 0 && row <= 9{
            speciesToSet = .syp
        }
        
        if row == 0 {
            gradeToSet = .denseSelectStructural
        }else if row == 1{
            gradeToSet = .selectStructural
        }else if row == 2{
            gradeToSet = .nonDenseSelectStructural
        }else if row == 3{
            gradeToSet = .no1Dense
        }else if row == 4{
            gradeToSet = .no1
        }else if row == 5{
            gradeToSet = .no1NonDense
        }else if row == 6{
            gradeToSet = .no2Dense
        }else if row == 7{
            gradeToSet = .no2
        }else if row == 8{
            gradeToSet = .no2NonDense
        }else if row == 9{
            gradeToSet = .no3AndStud
        }
        
        
        //take the user selection update the model and save data
        design.a.selectedWoodDesignValues.setValues(speciesToSet, theGrade: gradeToSet, memberWidth: design.a.selectedWoodSection.depth)
        
        design.updateDesignSectionCollections()
        
        updateLabels()
        stressTable.reloadData()
        updateStatusBar()
    }
    
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "woodSectionSelect"{
            let vcSelectMember = segue.destination as! vc_WoodMemberSelection
            vcSelectMember.memberSelectDelegate = self
            
            
        }else if segue.identifier == "woodGradeSelect"{
            let vcSelectGrade = segue.destination as! vc_WoodGradeSelection
            vcSelectGrade.gradeSelectDelegate = self
            
        } else if segue.identifier == "beamCalculations"{
            let vcCalcs = segue.destination as! vc_Calculations
            vcCalcs.calcType = "Wood"
            vcCalcs.woodBeamDesign = self.design
            vcCalcs.loadGraphImage = self.loadGraphImage
            vcCalcs.momentGraphImage = self.momentGraphImage
            vcCalcs.shearGraphImage = self.shearGraphImage
            vcCalcs.deflectionGraphImage = self.deflectionGraphImage
            
            vcCalcs.beamAndLoadImage = self.beamAndLoadImage
            
        }else if segue.identifier == "editFactor"{
            let vcEditFactor = self.storyboard?.instantiateViewController(withIdentifier: "editFactor") as! vc_EditFactor
            let popController:UIPopoverController = UIPopoverController(contentViewController: vcEditFactor)
            
            let buttonPosition = (sender as AnyObject).convert(CGPoint.zero, to:factorTable)
            let selectedTableRowIndexPath = factorTable.indexPathForRow(at: buttonPosition)
            
            if selectedTableRowIndexPath != nil{
                vcEditFactor.receiverDelegate = self
                
                //adjust the size and location of the popover
                let size:CGSize = CGSize(width: 400,height: 350)
                popController.contentSize = size;
                var theFrame = (sender! as AnyObject).frame
                theFrame?.origin.x = 10
                //end adjust
                
                
                
                let row = selectedTableRowIndexPath?.row
                
                if row! >= 0 && row! <= 5{
                    if row == 0 {
                        vcEditFactor.tableColumnTitle = "Load Duration Factor (Cd)"
                        vcEditFactor.factor = "Cd"
                        vcEditFactor.view.frame.size = CGSize(width: 200, height: 220)
                        
                    }else if row == 1{
                        vcEditFactor.tableColumnTitle = "Wet Service Factor (Cm)"
                        vcEditFactor.factor = "Cm"
                        vcEditFactor.view.frame.size = CGSize(width: 500, height: 150)
                    }else if row == 2{
                        vcEditFactor.tableColumnTitle = "Temperature Factor (Ct)"
                        vcEditFactor.factor = "Ct"
                        vcEditFactor.view.frame.size = CGSize(width: 500, height: 210)
                    }else if row == 3{
                        vcEditFactor.tableColumnTitle = "Size Factor (Cf)"
                        vcEditFactor.factor = "Cf"
                        vcEditFactor.view.frame.size = CGSize(width: 500, height: 210)
                    }else if row == 4{
                        vcEditFactor.tableColumnTitle = "Flat Use Factor (Cfu)"
                        vcEditFactor.factor = "Cfu"
                        vcEditFactor.view.frame.size = CGSize(width: 500, height: 210)
                    }else if row == 5{
                        vcEditFactor.tableColumnTitle = "Repetative Member Factor (Cr)"
                        vcEditFactor.factor = "Cr"
                        vcEditFactor.view.frame.size = CGSize(width: 500, height: 210)
                    }
                    
                    
                    popController.present(from: theFrame!, in: (sender as! UIButton), permittedArrowDirections: UIPopoverArrowDirection.any, animated: true)
                }else if row == 6{
                    
                    let vcEditCL = self.storyboard?.instantiateViewController(withIdentifier: "editCLFactor") as! vc_EditCLFactor
                    
                    let popController2:UIPopoverController = UIPopoverController(contentViewController: vcEditCL)
                    
                    //adjust the size and location of the popover
                    let size:CGSize = CGSize(width: 850,height: 700)
                    popController2.contentSize = size;
                    var theFrame = (sender! as AnyObject).frame
                    theFrame?.origin.x = 10
                    //end adjust
                    
                    vcEditCL.title = "SPECIFY BEAM STABLIITY FACTOR (CL)"
                    vcEditCL.a = self.design.a
                    vcEditCL.receiverDelegate = self
                  
                    popController2.present(from: theFrame!, in: (sender as! UIButton), permittedArrowDirections: UIPopoverArrowDirection.any, animated: true)
                 
                }
            }
            
        }
    }
    
    
    
    
    
        //protocol Function for Factor Segue
        func callSegueFromCell(_ theSender: AnyObject, theSegueIdentifier:String){
            //try not to send self, just to avoid retain cycles(depends on how you handle the code on the next controller)
            self.performSegue(withIdentifier: theSegueIdentifier, sender:theSender)
        }
        
        
        
        
        func sendReceiveFactor(_ theFactor:String, theDouble:Double, secondDouble:Double, thirdDouble:Double){
            
            if theFactor == "Cd"{
                design.a.selectedWoodDesignValues.wF.Cd = theDouble
            }else if theFactor == "Cm"{
                design.a.selectedWoodDesignValues.wF.CmFb = theDouble
                design.a.selectedWoodDesignValues.wF.CmFv = secondDouble
                design.a.selectedWoodDesignValues.wF.CmE = thirdDouble
            }else if theFactor == "Ct"{
                design.a.selectedWoodDesignValues.wF.CtFb = theDouble
                design.a.selectedWoodDesignValues.wF.CtFv = secondDouble
                design.a.selectedWoodDesignValues.wF.CtE = thirdDouble
            }else if theFactor == "Cf"{
                design.a.selectedWoodDesignValues.wF.Cf = theDouble
            }else if theFactor == "Cfu"{
                design.a.selectedWoodDesignValues.wF.Cfu = theDouble
            }else if theFactor == "Cr"{
                design.a.selectedWoodDesignValues.wF.Cr = theDouble
            }else if theFactor == "Cl"{
                design.a.selectedWoodDesignValues.wF.Cl = theDouble
            }
            
            design.a.selectedWoodDesignValues.setAdjustedValues()
            factorTable.reloadData()
            stressTable.reloadData()
            updateStatusBar()
            
        }
    

}
