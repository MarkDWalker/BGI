//
//  vc_DesignType.swift
//  BeamGrapherForIpadV_0.0.3
//
//  Created by Mark Walker on 6/16/17.
//  Copyright © 2017 Mark Walker. All rights reserved.
//

import UIKit

class vc_DesignType: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource{
    
    @IBOutlet weak var picker: UIPickerView!
    
    var delegate:DesignTypeDisplayer!
    var currentDesignType = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if (currentDesignType == "Wood Design"){
            picker.selectRow(0, inComponent: 0, animated: true)
        }else if (currentDesignType == "LVL Design"){
           picker.selectRow(1, inComponent: 0, animated: true)
        }else if (currentDesignType == "Steel W Design"){
            picker.selectRow(2, inComponent: 0, animated: true)
        }else if (currentDesignType == "Flitch Design"){
            picker.selectRow(3, inComponent: 0, animated: true)
        }
        // Do any additional setup after loading the view.
    }
   
    

    // DataSource
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 4
    }
    
    // Delegate
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        var theString:String = ""
        if (row == 0){
            theString = "Wood Design"
        }else if (row == 1){
            theString = "LVL Design"
        }else if (row == 2){
            theString = "Steel W Design"
        }else if (row == 3){
            theString = "Flitch Design"
        }
        return theString
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
       
        
    }
    
    
    @IBAction func save_Click(_ sender: UIButton) {
        if delegate != nil{
            var theTypeString = "xxxx"
            if (picker.selectedRow(inComponent: 0) == 0)
            {
                theTypeString = "Wood Design"
            }else if (picker.selectedRow(inComponent: 0) == 1)
            {
                theTypeString = "LVL Design"
            }else if (picker.selectedRow(inComponent: 0) == 2)
            {
                theTypeString = "Steel W Design"
            }else if (picker.selectedRow(inComponent: 0) == 3)
            {
                theTypeString = "Flitch Design"
            }
            
            delegate.updateDesignTypeDisplay(theType: theTypeString)
        }
        
        self.dismiss(animated: true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
