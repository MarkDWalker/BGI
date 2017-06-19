//
//  vc_WoodBeamDesign.swift
//  BeamGrapherForIpadV_0.0.3
//
//  Created by Mark Walker on 6/17/17.
//  Copyright © 2017 Mark Walker. All rights reserved.
//

import UIKit

class vc_WoodBeamDesign: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var sectionTable: UITableView!
    @IBOutlet weak var gradeTable: UITableView!
    
    
    var design = MWWoodBeamDesign()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        sectionTable.delegate = self
        sectionTable.dataSource = self
        
        
        gradeTable.delegate = self
        gradeTable.dataSource = self
        // Do any additional setup after loading the view.
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
        if tableView.restorationIdentifier == "sectionTable"{
            rowCount = 30
        } else if tableView.restorationIdentifier == "gradeTable"{
            rowCount = 10
        }
        
        return rowCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //let theSection:Int = indexPath.section
        //let theRow:Int = indexPath.row
        
        
        
        guard indexPath.row != 0  else{
            let cellTitle = tableView.dequeueReusableCell(withIdentifier: "titleCell", for: indexPath) as! CustomCell_TitleCell
            if tableView.restorationIdentifier == "sectionTable"{
                cellTitle.titleLabel!.text = "Member Selection"
            }else if tableView.restorationIdentifier == "gradeTable"{
                 cellTitle.titleLabel!.text = "Grade Selection"
            }
            return cellTitle
        }
        
        
        let tempSectionData = MWWoodSectionDesignData()
        let tempGradeData = MWWoodDesignValues()
        
        
        //section Table
        let cell = tableView.dequeueReusableCell(withIdentifier: "sectionCell", for: indexPath) as! CustomCell_SectionData
        
        //grade Table
        let gradeCell = tableView.dequeueReusableCell(withIdentifier: "gradeCell", for: indexPath) as! CustomCell_GradeData
        
        
        if (tableView.restorationIdentifier == "sectionTable"){
            
            tempSectionData.setSectionData(indexPath.row)
            
            cell.sectionLabel!.text = tempSectionData.shape as String
            cell.depthLabel!.text = ("\(tempSectionData.depth)")
            cell.widthLabel.text = ("\(tempSectionData.width)")
            cell.areaLabel.text = ("\(tempSectionData.area)")
            cell.inertiaLabel.text = ("\(tempSectionData.I)")
            cell.modLabel.text = ("\(tempSectionData.sectionModulus)")
            
            
        }else if (tableView.restorationIdentifier == "gradeTable"){  //grade Table
            let row = indexPath.row
            
            if row == 0 {
                tempGradeData.setValues(speciesEnum.syp, theGrade: woodGradeEnum.denseSelectStructural, memberWidth: design.a.selectedWoodSection.depth)
            }else if row == 1{
                tempGradeData.setValues(speciesEnum.syp, theGrade: woodGradeEnum.selectStructural, memberWidth: design.a.selectedWoodSection.depth)
            }else if row == 2{
                tempGradeData.setValues(speciesEnum.syp, theGrade: woodGradeEnum.nonDenseSelectStructural, memberWidth: design.a.selectedWoodSection.depth)
            }else if row == 3{
                tempGradeData.setValues(speciesEnum.syp, theGrade: woodGradeEnum.no1Dense, memberWidth: design.a.selectedWoodSection.depth)
            }else if row == 4{
                tempGradeData.setValues(speciesEnum.syp, theGrade: woodGradeEnum.no1, memberWidth: design.a.selectedWoodSection.depth)
            }else if row == 5{
                tempGradeData.setValues(speciesEnum.syp, theGrade: woodGradeEnum.no1NonDense, memberWidth: design.a.selectedWoodSection.depth)
            }else if row == 6{
                tempGradeData.setValues(speciesEnum.syp, theGrade: woodGradeEnum.no2Dense, memberWidth: design.a.selectedWoodSection.depth)
            }else if row == 7{
                tempGradeData.setValues(speciesEnum.syp, theGrade: woodGradeEnum.no2, memberWidth: design.a.selectedWoodSection.depth)
            }else if row == 8{
                tempGradeData.setValues(speciesEnum.syp, theGrade: woodGradeEnum.no2NonDense, memberWidth: design.a.selectedWoodSection.depth)
            }else if row == 9{
                tempGradeData.setValues(speciesEnum.syp, theGrade: woodGradeEnum.no3AndStud, memberWidth: design.a.selectedWoodSection.depth)
            }
            
            
            
            gradeCell.gradeLabel.text = tempGradeData.limits.grade.rawValue as String
            
            
            if tempGradeData.limits.species == speciesEnum.syp {
                gradeCell.speciesLabel.text = "SYP"
            }
            
            gradeCell.fbLabel.text = ("\(tempGradeData.limits.Fb)")
            
            gradeCell.fvLabel.text = ("\(tempGradeData.limits.Fv)")
            
            gradeCell.eLabel.text = ("\(tempGradeData.limits.E)")
            
            
            
            return gradeCell
        }
        
        
        
        
        
        
        return cell
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
