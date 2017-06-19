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
            rowCount = 12
        }
        
        return rowCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //let theSection:Int = indexPath.section
        //let theRow:Int = indexPath.row
        
        let returnCell = UITableViewCell()
        
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
        
       
        
        
        if (tableView.restorationIdentifier == "sectionTable"){
            let Cell1 = sectionTable.dequeueReusableCell(withIdentifier: "sectionCell", for: indexPath) as! CustomCell_SectionData
            
            tempSectionData.setSectionData(indexPath.row)
            
            Cell1.sectionLabel!.text = tempSectionData.shape as String
            Cell1.depthLabel!.text = ("\(tempSectionData.depth)")
            Cell1.widthLabel.text = ("\(tempSectionData.width)")
            Cell1.areaLabel.text = ("\(tempSectionData.area)")
            Cell1.inertiaLabel.text = ("\(tempSectionData.I)")
            Cell1.modLabel.text = ("\(tempSectionData.sectionModulus)")
            
            return Cell1
            
       }else if (tableView.restorationIdentifier == "gradeTable"){  //grade Table
             let Cell2 = gradeTable.dequeueReusableCell(withIdentifier: "gradeCell", for: indexPath) as! CustomCell_GradeData
            
            let row = indexPath.row
            
            if row == 1 {
                
                let Cell3 = gradeTable.dequeueReusableCell(withIdentifier: "woodGradeHeaderCell", for: indexPath) as! CustomCell_WoodGradeHeader
                
                return Cell3
                
            }else if row == 2 {
                tempGradeData.setValues(speciesEnum.syp, theGrade: woodGradeEnum.denseSelectStructural, memberWidth: design.a.selectedWoodSection.depth)
            }else if row == 3{
                tempGradeData.setValues(speciesEnum.syp, theGrade: woodGradeEnum.selectStructural, memberWidth: design.a.selectedWoodSection.depth)
            }else if row == 4{
                tempGradeData.setValues(speciesEnum.syp, theGrade: woodGradeEnum.nonDenseSelectStructural, memberWidth: design.a.selectedWoodSection.depth)
            }else if row == 5{
                tempGradeData.setValues(speciesEnum.syp, theGrade: woodGradeEnum.no1Dense, memberWidth: design.a.selectedWoodSection.depth)
            }else if row == 6{
                tempGradeData.setValues(speciesEnum.syp, theGrade: woodGradeEnum.no1, memberWidth: design.a.selectedWoodSection.depth)
            }else if row == 7{
                tempGradeData.setValues(speciesEnum.syp, theGrade: woodGradeEnum.no1NonDense, memberWidth: design.a.selectedWoodSection.depth)
            }else if row == 8{
                tempGradeData.setValues(speciesEnum.syp, theGrade: woodGradeEnum.no2Dense, memberWidth: design.a.selectedWoodSection.depth)
            }else if row == 9{
                tempGradeData.setValues(speciesEnum.syp, theGrade: woodGradeEnum.no2, memberWidth: design.a.selectedWoodSection.depth)
            }else if row == 10{
                tempGradeData.setValues(speciesEnum.syp, theGrade: woodGradeEnum.no2NonDense, memberWidth: design.a.selectedWoodSection.depth)
            }else if row == 11{
                tempGradeData.setValues(speciesEnum.syp, theGrade: woodGradeEnum.no3AndStud, memberWidth: design.a.selectedWoodSection.depth)
            }
            
            
            
            Cell2.gradeLabel.text = tempGradeData.limits.grade.rawValue as String
            
            
            if tempGradeData.limits.species == speciesEnum.syp {
                Cell2.speciesLabel.text = "SYP"
            }
            
            Cell2.fbLabel.text = ("\(tempGradeData.limits.Fb)")
            
            Cell2.fvLabel.text = ("\(tempGradeData.limits.Fv)")
            
            Cell2.eLabel.text = ("\(tempGradeData.limits.E)")
            
            
            
            return  Cell2
        }
    
        
        
        return returnCell
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
