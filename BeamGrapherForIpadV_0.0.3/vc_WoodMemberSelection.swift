//
//  vc_WoodMemberSelection.swift
//  BeamGrapherForIpadV_0.0.3
//
//  Created by Mark Walker on 6/24/17.
//  Copyright © 2017 Mark Walker. All rights reserved.
//

import UIKit

class vc_WoodMemberSelection: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var sectionTable: UITableView!
    
    var memberSelectDelegate:hasMemberRowToUpdate!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sectionTable.delegate = self
        sectionTable.dataSource = self

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func saveClick(_ sender: Any) {
        
        if memberSelectDelegate != nil && sectionTable.indexPathForSelectedRow != nil{
            memberSelectDelegate.updateMemberRow(row: (sectionTable.indexPathForSelectedRow?.row)!)
            
            self.dismiss(animated: true, completion: nil)
        }
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        let rowCount = 28
        return rowCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        
        let tempSectionData = MWWoodSectionDesignData()
        let Cell1 = sectionTable.dequeueReusableCell(withIdentifier: "sectionCell", for: indexPath) as! CustomCell_SectionData
        
        if (tableView.restorationIdentifier == "sectionTable"){
            
            
            
            let bgColorView = UIView()
            bgColorView.backgroundColor = UIColor(red: 0.4, green: 0.6, blue: 1, alpha: 1)
            Cell1.selectedBackgroundView = bgColorView
            
            tempSectionData.setSectionData(indexPath.row)
            
            Cell1.sectionLabel!.text = tempSectionData.shape as String
            Cell1.depthLabel!.text = ("\(tempSectionData.depth)")
            Cell1.widthLabel.text = ("\(tempSectionData.width)")
            Cell1.areaLabel.text = ("\(tempSectionData.area)")
            Cell1.inertiaLabel.text = ("\(tempSectionData.I)")
            Cell1.modLabel.text = ("\(tempSectionData.sectionModulus)")
            
            
            
            if indexPath.row % 2 == 0 {
                Cell1.backgroundColor = UIColor(red: 0.96, green: 0.96, blue: 0.96, alpha: 1)
                
            }else{
                Cell1.backgroundColor = UIColor.white
            }
            
            
        }
        return Cell1
    }
    

}
