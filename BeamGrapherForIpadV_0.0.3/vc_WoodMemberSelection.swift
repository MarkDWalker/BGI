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
            bgColorView.backgroundColor = UIColor.red
            Cell1.selectedBackgroundView = bgColorView
            
            tempSectionData.setSectionData(indexPath.row)
            
            Cell1.sectionLabel!.text = tempSectionData.shape as String
            Cell1.depthLabel!.text = ("\(tempSectionData.depth)")
            Cell1.widthLabel.text = ("\(tempSectionData.width)")
            Cell1.areaLabel.text = ("\(tempSectionData.area)")
            Cell1.inertiaLabel.text = ("\(tempSectionData.I)")
            Cell1.modLabel.text = ("\(tempSectionData.sectionModulus)")
            
            
            
            if indexPath.row == 0 || indexPath.row % 2 == 0 {
                Cell1.backgroundColor = UIColor.green
                
            }else{
                Cell1.backgroundColor = UIColor.white
            }
            
            
        }
        return Cell1
    }
    

    @IBAction func clickSave(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }

}
