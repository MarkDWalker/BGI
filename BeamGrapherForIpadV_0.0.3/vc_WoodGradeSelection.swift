//
//  vc_WoodGradeSelection.swift
//  BeamGrapherForIpadV_0.0.3
//
//  Created by Mark Walker on 6/24/17.
//  Copyright © 2017 Mark Walker. All rights reserved.
//

import UIKit

class vc_WoodGradeSelection: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var gradeTable: UITableView!
    
     var design = MWWoodBeamDesign()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        gradeTable.delegate = self
        gradeTable.dataSource = self
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        let rowCount = 12
        return rowCount
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
       
        
        let tempGradeData = MWWoodDesignValues()
        
        
        
            let Cell2 = gradeTable.dequeueReusableCell(withIdentifier: "gradeCell", for: indexPath) as! CustomCell_GradeData
            
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
            
            
            
            Cell2.gradeLabel.text = tempGradeData.limits.grade.rawValue as String
            
            
            if tempGradeData.limits.species == speciesEnum.syp {
                Cell2.speciesLabel.text = "SYP"
            }
            
            Cell2.fbLabel.text = ("\(tempGradeData.limits.Fb)")
            
            Cell2.fvLabel.text = ("\(tempGradeData.limits.Fv)")
            
            Cell2.eLabel.text = ("\(tempGradeData.limits.E)")
            
            
            
            if indexPath.row == 0 || indexPath.row % 2 == 0 {
                Cell2.backgroundColor = UIColor.green
                
            }else{
                Cell2.backgroundColor = UIColor.white
            }
            
            return Cell2
            
        }

}
