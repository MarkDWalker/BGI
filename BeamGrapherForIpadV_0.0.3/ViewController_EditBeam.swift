//
//  ViewController_EditBeam.swift
//  
//
//  Created by Mark Walker on 6/7/15.
//
//

import UIKit

class ViewController_EditBeam: UIViewController {
    
    var delegate:MyEditBeamGeoDelegator?
    var beamGeo:MWBeamGeometry = MWBeamGeometry()
    var myNums:iosNumUtil = iosNumUtil()
    
    @IBOutlet weak var tv_Description: UITextField!
    @IBOutlet weak var tv_Length: UITextField!
    @IBOutlet weak var tv_DataPoints: UITextField!
    @IBOutlet weak var tv_E: UITextField!
    @IBOutlet weak var tv_I: UITextField!
    

    @IBOutlet weak var tv_SupportLocA: UITextField!
    @IBOutlet weak var tv_SupportLocB: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tv_Description.text = beamGeo.title
        tv_Length.text = "\(beamGeo.length)"
        tv_DataPoints.text = "\(beamGeo.dataPointCount)"
        tv_E.text = "\(beamGeo.E)"
        tv_I.text = "\(beamGeo.I)"
        
        tv_SupportLocA.text = "\(beamGeo.supportLocationA)"
        tv_SupportLocB.text = "\(beamGeo.supportLocationB)"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func click_Cancel(_ sender: UIButton) {
         print("It fired")
        self.dismiss(animated: true, completion: nil)
    }
  
    @IBAction func click_Update(_ sender: UIButton) {
        var lengthError:Bool = false
        var supportError:Bool = false
        beamGeo.title = tv_Description.text!
        
        
        let length:Double = myNums.txtToD(tv_Length.text!)
        if length > 0 && length < 1000 {
            beamGeo.length = length
        }else{
            lengthError = true
            let alert:UIAlertController = UIAlertController(title: "Length Error", message: "Check length entry!", preferredStyle: UIAlertControllerStyle.actionSheet)
            self.present(alert, animated: true, completion: nil)
        }
        
        //check the datapoint count, do not let it go below 3
        let dataPoints:Int = myNums.txtToI(tv_DataPoints.text!)
        if dataPoints < 4 {
            beamGeo.dataPointCount = 3
        }else{
            beamGeo.dataPointCount = dataPoints
        }
        
        //Check the validity of the E value. It is limited from zero to ten million
        let E:Double = myNums.txtToD(tv_E.text!)
        if E > 0 && E <= 10000000 {
            beamGeo.E = E
        }else {
            //do not change the the E value
        }
        
        let I:Double = myNums.txtToD(tv_I.text!)
        if I > 0 && I <= 10000000 {
            beamGeo.I = I
        }else{
            //do not change the I value
        }
        
        let s1 = myNums.txtToD(tv_SupportLocA.text!)
        let s2 = myNums.txtToD(tv_SupportLocB.text!)
        
        if (s2 <= s1) {
            supportError = true
        }
        
        if (s1 < 0){
            supportError = true
        }
        
        if (s2 > length){
            supportError = true
        }
        
        
        if (supportError == false){
            beamGeo.supportLocationA = s1
            beamGeo.supportLocationB = s2
        }
        
        if lengthError == false && supportError == false && self.delegate != nil{
            delegate?.updateBeamGeo(beamGeo)
            delegate?.updateGraphs()
            self.dismiss(animated: true, completion: nil)
        }
        
       
        
        
    }

}
