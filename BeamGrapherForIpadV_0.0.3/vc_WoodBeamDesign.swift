//
//  vc_WoodBeamDesign.swift
//  BeamGrapherForIpadV_0.0.3
//
//  Created by Mark Walker on 6/17/17.
//  Copyright © 2017 Mark Walker. All rights reserved.
//

import UIKit

class vc_WoodBeamDesign: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var sectionLabel: UILabel!
    @IBOutlet weak var gradeLabel: UILabel!
    
    @IBOutlet weak var factorTable: UITableView!
    
    var design = MWWoodBeamDesign()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        factorTable.delegate = self
        factorTable.dataSource = self
        
        
        
        
        
    }
    
    private func updateLabels(){
        
        var shape = design.a.selectedWoodSection.shape
        var d = design.a.selectedWoodSection.depth
        var w = design.a.selectedWoodSection.width
        var area = design.a.selectedWoodSection.area
        var I = design.a.selectedWoodSection.I
        var S = design.a.selectedWoodSection.sectionModulus
        
        sectionLabel.text = shape + "  |  w = " + "\(w)" + "  |  d = " + "\(d)" + "  |  a = " + "/(area)" + "  |  I"
        + "\(I)" + "  |  S = " + "\(S)"
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
            
            return Cell3
            
        }
    
        
        
        return returnCell!
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
