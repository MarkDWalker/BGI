//
//  vc_EditCLFactor.swift
//  BeamGrapherForIpadV_0.0.3
//
//  Created by Mark Walker on 7/7/17.
//  Copyright © 2017 Mark Walker. All rights reserved.
//

import UIKit

protocol EditCellController{
    
    func cellChanged()
    
}

class vc_EditCLFactor: UIViewController,UITableViewDataSource, UITableViewDelegate, EditCellController {

    @IBOutlet weak var criteriaTable: UITableView!
    @IBOutlet weak var leTable: UITableView!
    @IBOutlet weak var geometryTable: UITableView!
    
    var receiverDelegate:MWFactorReceiver?
    var factor = "Cl"
    
    var clCalc = MWWoodCLCalculator()
    var selectedLoadingCondition = clLoadingCondition.AnyOtherLoadingCondition
    var a = MWBeamAnalysis()
    
    var w = 1.0
    var d = 1.0
    var lu = 1.0
    var fbStar = 1.0
    var eMin = 1.0
    
    
    func cellChanged(){
        
        let table = geometryTable
        let cell0 = geometryTable.cellForRow(at: IndexPath(row: 0, section: 0)) as! CustomCell_2Column_Edit2
        let cell1 = geometryTable.cellForRow(at: IndexPath(row: 1, section: 0)) as! CustomCell_2Column_Edit2
        let cell2 = geometryTable.cellForRow(at: IndexPath(row: 2, section: 0)) as! CustomCell_2Column_Edit2
        let cell3 = geometryTable.cellForRow(at: IndexPath(row: 3, section: 0)) as! CustomCell_2Column_Edit2
        let cell4 = geometryTable.cellForRow(at: IndexPath(row: 4, section: 0)) as! CustomCell_2Column_Edit2
        
        
        guard let testw = Double(cell0.label2.text!) else{
            criteriaTable.reloadData()
            geometryTable.reloadData()
            return
        }
        
        guard let testd = Double(cell1.label2.text!) else{
            criteriaTable.reloadData()
            geometryTable.reloadData()
            return
        }
        
        guard let testlu = Double(cell2.label2.text!) else{
            criteriaTable.reloadData()
            geometryTable.reloadData()
            return
        }
        
        guard let testfbstar = Double(cell3.label2.text!) else{
            criteriaTable.reloadData()
            geometryTable.reloadData()
            return
        }
        
        guard let testemin = Double(cell4.label2.text!) else{
            criteriaTable.reloadData()
            geometryTable.reloadData()
            return
        }
        
        w = testw
        d = testd
        lu = testlu
        fbStar = testfbstar
        eMin = testemin
        
        
        clCalc.setValues(w, d: d, Lu: lu, Emin: eMin, FbStar: fbStar, loadCondition: selectedLoadingCondition)
        criteriaTable.reloadData()
        geometryTable.reloadData()
        
        criteriaTable.selectRow(at: IndexPath(row: 5, section: 0), animated: true, scrollPosition: UITableViewScrollPosition.middle)

    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        criteriaTable.delegate = self
        criteriaTable.dataSource = self
        
        leTable.delegate = self
        leTable.dataSource = self
        
        geometryTable.delegate = self
        geometryTable.dataSource = self

        
        //set the local variable
        w = a.selectedWoodSection.width
        d = a.selectedWoodSection.depth
        fbStar = a.selectedWoodDesignValues.FbStar
        eMin = a.selectedWoodDesignValues.limits.Emin
        
        
//        leTable.isEnabled = false
//        geometryTable.isEnabled = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let table = tableView
        
        guard indexPath.row != -1 else{
            return
        }
        
        
        
        if table.restorationIdentifier == "criteriaTable"{
            if indexPath.row == 5{
                leTable.allowsSelection = true
                geometryTable.allowsSelection = true
            }else{
                leTable.allowsSelection = false
                geometryTable.allowsSelection = false
            }
        }else if table.restorationIdentifier == "leTable"{
            switch indexPath.row{
            case 0: selectedLoadingCondition = clLoadingCondition.Cantilever_UniformlyDistributed
            case 1: selectedLoadingCondition = clLoadingCondition.Cantilever_ConcentratedLoadAtUnsupportedEnds
            case 2: selectedLoadingCondition = clLoadingCondition.SimpleSpan_UniformlyDistributedLoad
            case 3: selectedLoadingCondition = clLoadingCondition.SimpleSpan_ConcentratedLoadAtCenterWithNoIntermediateSupportAtCenter
            case 4: selectedLoadingCondition = clLoadingCondition.SimpleSpan_ConcentratedLoadAtCenterWithLateralSupportAtCenter
            case 5: selectedLoadingCondition = clLoadingCondition.SimpleSpan_TwoEqualConcrentratedLoadsAtThirdPointsWithLateralSupportsAtThirdPoints
            case 6: selectedLoadingCondition = clLoadingCondition.SimpleSpan_ThreeEqualConcrentratedLoadsAtFourthPointsWithLateralSupportsAtFourthPoints
            case 7: selectedLoadingCondition = clLoadingCondition.SimpleSpan_FourEqualConcrentratedLoadsAtFifthPointsWithLateralSupportsAtFifthPoints
            case 8: selectedLoadingCondition = clLoadingCondition.SimpleSpan_FiveEqualConcrentratedLoadsAtSixthPointsWithLateralSupportsAtSixthPoints
            case 9: selectedLoadingCondition = clLoadingCondition.SimpleSpan_SixEqualConcrentratedLoadsAtSeventhPointsWithLateralSupportsAtSeventhPoints
            case 10: selectedLoadingCondition = clLoadingCondition.SimpleSpan_SevenOrMoreEqualConcentratedLoadsEvenlySpacedWithLateralSupportAtPointsOfLoadApplication
            case 11: selectedLoadingCondition = clLoadingCondition.SimpleSpan_SevenOrMoreEqualConcentratedLoadsEvenlySpacedWithLateralSupportAtPointsOfLoadApplication
            case 12: selectedLoadingCondition = clLoadingCondition.AnyOtherLoadingCondition
            default: selectedLoadingCondition = clLoadingCondition.AnyOtherLoadingCondition
                
            }
            
            clCalc.loadingCondition = selectedLoadingCondition
            
            criteriaTable.reloadData()
            criteriaTable.selectRow(at: IndexPath(row: 5, section: 0), animated: true, scrollPosition: UITableViewScrollPosition.middle)
        }
        

    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        var rowCount = 0
        guard let tableID = tableView.restorationIdentifier else{
            return 0
        }
        
        switch tableID{
        case ("criteriaTable"): rowCount = 6
        case ("leTable"): rowCount = 13
        case ("geometryTable"): rowCount = 5
        default: rowCount = 0
        }
        
        return rowCount
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let dummycell = tableView.cellForRow(at: indexPath)
        let row = indexPath.row
        
        if tableView.restorationIdentifier == "criteriaTable"{
            let cell = tableView.dequeueReusableCell(withIdentifier: "2ColumnCell", for: indexPath) as! CustomCell_2Column
            let cl = clCalc.calculatedCl
            
            if row == 0{
                cell.label1.text = "depth / width < 2..";
                cell.label2.text = "Cd = 1.00"
            }else if row == 1{
                cell.label1.text = "depth / width between 2 & 4, end bracing provided"
                cell.label2.text = "Cd = 1.00"
            }else if row == 2{
                cell.label1.text = "depth / width between 4 & 5, end bracing & subfloor provided"
                cell.label2.text = "Cd = 1.00"
            }else if row == 3{
                cell.label1.text = "depth / width between 5 & 6, brace@8' + ends & subfloor provided"
                cell.label2.text = "Cd = 1.00"
            }else if row == 4{
                 cell.label1.text = "depth / width between 6 & 7, contiuous top & bottom bracing"
                cell.label2.text = "Cd = 1.00"
            }else if row == 5{
                cell.label1.text = "Calculate based upon unbraced length lu"
                cell.label2.text = "Cd = " + (NSString(format: "%0.4f", cl) as String)
            }
        
            if indexPath.row % 2 == 0 {
                cell.backgroundColor = UIColor(red: 0.96, green: 0.96, blue: 0.96, alpha: 1)
                
            }else{
                cell.backgroundColor = UIColor.white
            }
            return cell
            
        }else if tableView.restorationIdentifier == "leTable"{
            let cell = tableView.dequeueReusableCell(withIdentifier: "2ColumnCell", for: indexPath) as! CustomCell_2Column

            if clCalc.luOverd < 7{
                if row == 0{
                    cell.label1.text = "Cantilever - Uniformly distributed"
                    cell.label2.text = "le = 1.33 x lu"
                }else if row == 1{
                    cell.label1.text = "Cantilever - Concentrated loat at unsupported ends"
                    cell.label2.text = "le = 1.87 x lu"
                }else if row == 2{
                    cell.label1.text = "Simple Span - Uniformly distributed load"
                    cell.label2.text = "le = 2.06 x lu"
                }else if row == 3{
                    cell.label1.text = "Simple Span - Concentrated load at center with no intermediate support at center"
                    cell.label2.text = "le = 1.80 x lu"
                }else if row == 4{
                    cell.label1.text = "Simple Span - Concentrated Load at center with lateral support at center";
                    cell.label2.text = "le = 1.11 x lu"
                }else if row == 5{
                    cell.label1.text = "Simple Span - Two equal concrentrated loads at 1/3 points with lateral supports at 1/3 points"
                    cell.label2.text = "le = 1.68 x lu"
                }else if row == 6{
                    cell.label1.text = "Simple Span -  Three equal concentrated loads at 1/4 points with lateral support at 1/4 points"
                    cell.label2.text = "le = 1.54 x lu"
                }else if row == 7{
                    cell.label1.text = "Simple Span - Four equal concentrated loads at 1/5 points with lateral support at 1/5 points"
                    cell.label2.text = "le = 1.68 x lu"
                }else if row == 8{
                    cell.label1.text = "Simple Span - Five equal concentrated loads at 1/6 points with lateral support at 1/6 points"
                    cell.label2.text = "le = 1.73 x lu"
                }else if row == 9{
                    cell.label1.text = "Simple Span - Six equal concentrated loads at 1/7 points with lateral support at 1/7 points"
                    cell.label2.text = "le = 1.78 x lu"
                }else if row == 10{
                    cell.label1.text = "Simple Span - Seven or more equal concentrated loads, evenly spaced, with lateral support at points of load application"
                    cell.label2.text = "le = 1.84 x lu"
                }else if row == 11{
                    cell.label1.text = "Simple Span: Equal end moments"
                    cell.label2.text = "le = 1.84 x lu"
                }else if row == 12{
                    cell.label1.text = "Any loading condition than listed above"
                    cell.label2.text = "le = 2.06 x lu"
                }
                
            }else if clCalc.luOverd >= 7 && clCalc.luOverd <= 14.3{
                
                
                if row == 0{
                    cell.label1.text = "Cantilever - Uniformly Distributed"
                    cell.label2.text = "le = 0.90 x lu + 3d"
                }else if row == 1{
                    cell.label1.text = "Cantilever - Concentrated loat at unsupported ends"
                    cell.label2.text = "le = 1.44 x lu + 3d"
                }else if row == 2{
                    cell.label1.text = "Simple Span - Uniformly Distributed Load"
                    cell.label2.text = "le = 1.63 x lu + 3d"
                }else if row == 3{
                    cell.label1.text = "Simple Span - Concentrated Load At Center With No Intermediate Support At Center"
                    cell.label2.text = "le = 1.37 x lu + 3d"
                }else if row == 4{
                    cell.label1.text = "Simple Span - Concentrated Load At Center With Lateral Support At Center"
                    cell.label2.text = "le = 1.11 x lu"
                }else if row == 5{
                    cell.label1.text = "Simple Span - Two Equal Concrentrated Loads At 1/3 Points With Lateral Supports At 1/3 Points"
                    cell.label2.text = "le = 1.68 x lu"
                }else if row == 6{
                    cell.label1.text = "Simple Span -  Three equal concentrated loads at 1/4 points with lateral support at 1/4 points"
                    cell.label2.text = "le = 1.54 x lu"
                }else if row == 7{
                    cell.label1.text = "Simple Span - Four equal concentrated loads at 1/5 points with lateral support at 1/5 points"
                    cell.label2.text = "le = 1.68 x lu"
                }else if row == 8{
                    cell.label1.text = "Simple Span - Five equal concentrated loads at 1/6 points with lateral support at 1/6 points"
                    cell.label2.text = "le = 1.73 x lu"
                }else if row == 9{
                    cell.label1.text = "Simple Span - Six equal concentrated loads at 1/7 points with lateral support at 1/7 points"
                    cell.label2.text = "le = 1.78 x lu"
                }else if row == 10{
                    cell.label1.text = "Simple Span - Seven Or More Equal Concentrated Loads, Evenly Spaced, With Lateral Support At Points Of Load Application"
                    cell.label2.text = "le = 1.84 x lu"
                }else if row == 11{
                    cell.label1.text = "Simple Span  - Equal End Moments"
                    cell.label2.text = "le = 1.84 x lu"
                }else if row == 12{
                    cell.label1.text = "Any Other Loading Condition"
                    cell.label2.text = "le = 1.63 x lu + 3d"
                }
            
            }else if clCalc.luOverd > 14.3{
                
                
                if row == 0{
                    cell.label1.text = "Cantilever - Uniformly distributed"
                    cell.label2.text = "le = 0.90 x lu + 3d"
                }else if row == 1{
                    cell.label1.text = "Cantilever - Concentrated loat at unsupported ends"
                    cell.label2.text = "le = 1.44 x lu + 3d"
                }else if row == 2{
                    cell.label1.text = "Simple Span - Uniformly distributed load"
                    cell.label2.text = "le = 1.63 x lu + 3d"
                }else if row == 3{
                    cell.label1.text = "Simple Span - Concentrated load at center with no intermediate support at center"
                    cell.label2.text = "le = 1.37 x lu + 3d"
                }else if row == 4{
                    cell.label1.text = "Simple Span - Concentrated Load at center with lateral support at center"
                    cell.label2.text = "le = 1.11 x lu"
                }else if row == 5{
                    cell.label1.text = "Simple Span - Two equal concrentrated loads at 1/3 points with lateral supports at 1/3 points"
                    cell.label2.text = "le = 1.68 x lu"
                }else if row == 6{
                    cell.label1.text = "Simple Span -  Three equal concentrated loads at 1/4 points with lateral support at 1/4 points"
                    cell.label2.text = "le = 1.54 x lu"
                }else if row == 7{
                    cell.label1.text = "Simple Span - Four equal concentrated loads at 1/5 points with lateral support at 1/5 points"
                    cell.label2.text = "le = 1.68 x lu"
                }else if row == 8{
                    cell.label1.text = "Simple Span - Five equal concentrated loads at 1/6 points with lateral support at 1/6 points"
                    cell.label2.text = "le = 1.73 x lu"
                }else if row == 9{
                    cell.label1.text = "Simple Span - Six equal concentrated loads at 1/7 points with lateral support at 1/7 points"
                    cell.label2.text = "le = 1.78 x lu"
                }else if row == 10{
                    cell.label1.text = "Simple Span - Seven or more equal concentrated loads, evenly spaced, with lateral support at points of load application"
                    cell.label2.text = "le = 1.84 x lu"
                }else if row == 11{
                    cell.label1.text = "Simple Span: Equal end moments"
                    cell.label2.text = "le = 1.84 x lu"
                }else if row == 12{
                    cell.label1.text = "Any loading condition than listed above"
                    cell.label2.text = "le = 1.84 x lu"
                }

            }
            
            if indexPath.row % 2 == 0 {
                cell.backgroundColor = UIColor(red: 0.96, green: 0.96, blue: 0.96, alpha: 1)
                
            }else{
                cell.backgroundColor = UIColor.white
            }
            return cell
            
        }else if tableView.restorationIdentifier == "geometryTable"{
            let cell2 = tableView.dequeueReusableCell(withIdentifier: "editCell", for: indexPath) as! CustomCell_2Column_Edit2

            cell2.delegate = self
            if row == 0{
                cell2.label1.text = "member width (w)"
                cell2.label2.text = String(w)
            }else if row == 1{
                cell2.label1.text = "member depth (d)"
                cell2.label2.text = String(d)
            }else if row == 2{
                cell2.label1.text = "unbranced length (lu)"
                cell2.label2.text = String(lu)
                return cell2
            }else if row == 3{
                cell2.label1.text = "Fb*"
                cell2.label2.text = String(fbStar)
            }else if row == 4{
                cell2.label1.text = "Emin"
                cell2.label2.text = String(eMin)
            }
            
            if indexPath.row % 2 == 0 {
                cell2.backgroundColor = UIColor(red: 0.96, green: 0.96, blue: 0.96, alpha: 1)
                
            }else{
                cell2.backgroundColor = UIColor.white
            }
            
            return cell2
            
        }

       
        
        
        return dummycell!
    }
    
    
    
    
    @IBAction func click_Save(_ sender: AnyObject) {
        
        guard receiverDelegate != nil else{
            return
        }
        
        if criteriaTable.indexPathForSelectedRow?.row == 5{
            receiverDelegate?.sendReceiveFactor(factor, theDouble: clCalc.calculatedCl, secondDouble: 1.0, thirdDouble: 1.0)
        }else{
            receiverDelegate?.sendReceiveFactor(factor, theDouble: 1.0, secondDouble: 1.0, thirdDouble: 1.0)
        }
        
        self.dismiss(animated: true, completion: nil)
    }



}
