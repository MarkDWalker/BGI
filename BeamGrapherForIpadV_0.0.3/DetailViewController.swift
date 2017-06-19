    //
//  DetailViewController.swift
//  BeamGrapherForIpadV_0.0.3
//
//  Created by Mark Walker on 6/6/15.
//  Copyright (c) 2015 Mark Walker. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController,DesignTypeDisplayer{
    
    @IBOutlet weak var designTypeBtn: UIBarButtonItem!
    
    var loadGraph:MWLoadGraphView =  MWLoadGraphView()
    var shearGraph = MWBeamGraphView()
    var momentGraph = MWBeamGraphView()
    var deflectionGraph = MWBeamGraphView()
    
    
    //these one (1) item is udpated by the the left pane via the splitview
    var a:MWBeamAnalysis = MWBeamAnalysis()
    
    //var selectedLoadIndex:Int = 0
    //var loadCollection = [MWLoadData]()
    //var beam = MWBeamGeometry(theLength: 10.00, theE: 1600.00, theI: 200.00)
    
    
    //var myShearGraphTotal = MWLoadComboResult()
    //var myMomentGraphTotal = MWLoadComboResult()
    //var myDeflectionGraphTotal = MWLoadComboResult()
    
    
    
    var but_toShearTable:UIButton = UIButton(type:UIButtonType.system)
    
    var but_toMomentTable:UIButton = UIButton(type:UIButtonType.system)
    var but_toDeflectionTable:UIButton = UIButton(type:UIButtonType.system)
    var but_toCalcs:UIButton = UIButton(type:UIButtonType.system)
    
    
    @IBOutlet weak var segControl: UISegmentedControl!
    
    @IBOutlet weak var detailDescriptionLabel: UILabel!
    
    @IBAction func click_segControl(_ sender: UISegmentedControl) {
        updateGraphs()
    }
    
    var detailItem: AnyObject? {
        didSet {
            // Update the view.
            self.configureView()
        }
    }
    
    func configureView() {
        // Update the user interface for the detail item.
        if let detail: AnyObject = self.detailItem {
            if let label = self.detailDescriptionLabel {
                label.text = detail.description
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.configureView()
        
        self.view.addSubview(loadGraph)
        self.view.addSubview(shearGraph)
        self.view.addSubview(momentGraph)
        self.view.addSubview(deflectionGraph)
        
        ///////////Dictionary for the layout constraints
        var myDict = Dictionary<String, UIView>()
        

        
        self.loadGraph.translatesAutoresizingMaskIntoConstraints = false
        self.shearGraph.translatesAutoresizingMaskIntoConstraints = false
        self.momentGraph.translatesAutoresizingMaskIntoConstraints = false
        self.deflectionGraph.translatesAutoresizingMaskIntoConstraints = false
        
        myDict["LG"] = self.loadGraph
        myDict["SG"] = self.shearGraph
        myDict["MG"] = self.momentGraph
        myDict["DG"] = self.deflectionGraph
        
        //Layout Constraints
        self.view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-[LG(>=300)]-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: myDict))
        self.view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-[SG(>=300)]-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: myDict))
        
        self.view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-[MG(>=300)]-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: myDict))
        
        self.view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-[DG(>=300)]-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: myDict))
        
        
        
        self.view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-80-[LG(>=75)]-[SG(==LG)]-[MG(==SG)]-[DG(==SG)]-15-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: myDict))
        //
        
        
        //the initial load was added in the master view controller
        
        //        // this is the initial load
        //        var cLoad:MWLoadData = MWLoadData()
        //
        //
        //        //add the inital values to the default load
        //        cLoad.addValues("L1", theLoadValue:2, theLoadType: .concentrated, theLoadStart: 2, theLoadEnd: 10,theBeamGeo: beam)
        //
        //        //add the initial load
        //        loadCollection.append(cLoad)
        
        
        //set the button actions
        self.but_toShearTable.addTarget(self, action: #selector(DetailViewController.but_toShearTable_clicked(_:)), for: UIControlEvents.touchUpInside)
        
        self.but_toMomentTable.addTarget(self, action: #selector(DetailViewController.but_toMomentTable_clicked(_:)), for: UIControlEvents.touchUpInside)
        
        self.but_toDeflectionTable.addTarget(self, action: #selector(DetailViewController.but_toDeflectionTable_clicked(_:)), for: UIControlEvents.touchUpInside)
        
        self.but_toCalcs.addTarget(self, action: #selector(DetailViewController.but_toCalcs_clicked(_:)), for: UIControlEvents.touchUpInside)
        print("Done adding the action")
        
        
        designTypeBtn.possibleTitles = Set(["Wood Design", "LVL Design", "Steel W Design", "Flitch Design"])
        
        designTypeBtn.setTitleTextAttributes([
            NSFontAttributeName : UIFont(name: "HelveticaNeue", size: 13)!,
            NSForegroundColorAttributeName : UIColor.darkGray],
                                              for: UIControlState.normal)
        
    }// end viewdidload
    
    
    @IBAction func but_toShearTable_clicked(_ sender: UIButton) {
        performSegue(withIdentifier: "tabularData", sender: sender)
    }
    
    @IBAction func but_toMomentTable_clicked(_ sender: UIButton) {
        performSegue(withIdentifier: "tabularData", sender: sender)
    }
    
    @IBAction func but_toDeflectionTable_clicked(_ sender: UIButton) {
        performSegue(withIdentifier: "tabularData", sender: sender)
    }
    
    @IBAction func but_toCalcs_clicked(_ sender: UIButton){
        performSegue(withIdentifier: "Calcs", sender: sender)
    }
    
    
        
//        @IBAction func clickLoadType(_ sender: AnyObject) {
//            
//            let row = loadListTableView.row(for: sender as! NSView)
//            
//            let vc_setLoadType = storyboard?.instantiateController(withIdentifier: "loadtypeselectvc") as! vc_RadioSelectLoadType
//            
//            vc_setLoadType.buttonRow = row
//            vc_setLoadType.beam = projectBeamCollection[selectedBeamListRow].BeamGeo
//            vc_setLoadType.load = projectBeamCollection[selectedBeamListRow].loadCollection[row]
//            vc_setLoadType.delegate = self
//            
//            self.presentViewController(vc_setLoadType, asPopoverRelativeTo: sender.frame, of: sender as! NSView, preferredEdge: NSRectEdge.maxX , behavior: NSPopoverBehavior.transient)
//            
//        }
        
       
        
    
    
    @IBAction func designBtn_Click(_ sender: Any) {
        let vcWoodDesign = storyboard?.instantiateViewController(withIdentifier: "vcWoodDesign") as! vc_WoodBeamDesign
        
        
        self.present(vcWoodDesign, animated: true, completion: nil)
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "designTypeSelector"{
            let vcDesignTypeController = segue.destination as! vc_DesignType
            vcDesignTypeController.currentDesignType = designTypeBtn.title!
            vcDesignTypeController.delegate = self
        }
        
        
        
        if segue.identifier == "Calcs"{
            let VC_Calcs:ViewController_Calcs = self.storyboard?.instantiateViewController(withIdentifier: "VC_Calcs") as! ViewController_Calcs
            
            VC_Calcs.loadImages = loadGraph.getLoadSnapShots()
            self.present(VC_Calcs, animated: true, completion: nil)
            print("\(a.loadCollection.count)")
            
            VC_Calcs.shearImages = self.getBeamGraphSnapShots(self.shearGraph)
            VC_Calcs.momentImages = self.getBeamGraphSnapShots(self.momentGraph)
            VC_Calcs.deflectionImages = self.getBeamGraphSnapShots(self.deflectionGraph)
            
            VC_Calcs.loadCollection = a.loadCollection
            
        }else if segue.identifier == "tabularData"{
            //create the view controller
            let VC_DataGrid:ViewController_DataGrid = self.storyboard?.instantiateViewController(withIdentifier: "VC_DataGrid") as! ViewController_DataGrid
            
            if sender as! UIButton == but_toShearTable{ //if the shear button
                VC_DataGrid.gridTitle = "Shear Data"
                VC_DataGrid.lengthUnits = "feet"
                VC_DataGrid.valueUnits = "kips"
                
                if a.selectedLoadIndex < a.shearComboResults.resultsCollection.count && a.selectedLoadIndex >= 0 && segControl.selectedSegmentIndex == 1{
                    VC_DataGrid.gridData = a.shearComboResults.resultsCollection[a.selectedLoadIndex].theDataCollection
                
                }else{
                    VC_DataGrid.gridData = a.shearComboResults.graphTotals.theDataCollection
                }
                
            }else if sender as! UIButton == but_toMomentTable{
                VC_DataGrid.gridTitle = "Moment Data"
                VC_DataGrid.lengthUnits = "feet"
                VC_DataGrid.valueUnits = "foot-kips"
                
                if a.selectedLoadIndex < a.momentComboResults.resultsCollection.count && a.selectedLoadIndex >= 0 && segControl.selectedSegmentIndex == 1{
                    VC_DataGrid.gridData = a.momentComboResults.resultsCollection[a.selectedLoadIndex].theDataCollection
                    
                }else{
                    VC_DataGrid.gridData = a.momentComboResults.graphTotals.theDataCollection
                }
                
            }else if sender as! UIButton == but_toDeflectionTable{
                VC_DataGrid.gridTitle = "Deflection Data"
                VC_DataGrid.lengthUnits = "feet"
                VC_DataGrid.valueUnits = "inches"
                
                if a.selectedLoadIndex < a.deflectionComboResults.resultsCollection.count && a.selectedLoadIndex >= 0 && segControl.selectedSegmentIndex == 1{
                    VC_DataGrid.gridData = a.deflectionComboResults.resultsCollection[a.selectedLoadIndex].theDataCollection
                    
                }else{
                    VC_DataGrid.gridData = a.deflectionComboResults.graphTotals.theDataCollection
                }
            }
            
            self.present(VC_DataGrid, animated: true, completion: nil)
            
        }
        
        
    } //end function
    
    
    @IBAction func unwindToList(_ segue: UIStoryboardSegue) {
        
    }
    
    
    override func viewDidLayoutSubviews() {
    }
    
    override func viewDidAppear(_ animated: Bool) {
        updateGraphs()
    }
    
    func updateGraphs(){
        
        //Clear the previous GraphTotals
        a.shearComboResults.clearResultsCollection()
        a.momentComboResults.clearResultsCollection()
        a.deflectionComboResults.clearResultsCollection()
        
        
        
        if (a.loadCollection.count > 0){
            
            
            //now create the remainder of the result graphs for the rest fo the load collection, load[1], load[2]....
            //and add each one to the combo result
            for i:Int in 0..<a.loadCollection.count{
                
                let localShearGraph = MWStructuralGraphData(theBeamGeo: a.BeamGeo, theLoad: a.loadCollection[i], theCalcType: calcTypeEnum.shear)
                let localMomentGraph = MWStructuralGraphData(theBeamGeo: a.BeamGeo, theLoad: a.loadCollection[i], theCalcType: calcTypeEnum.moment)
                let localDeflectionGraph = MWStructuralGraphData(theBeamGeo: a.BeamGeo, theLoad: a.loadCollection[i], theCalcType: calcTypeEnum.deflection)
                
                
                
                a.shearComboResults.addLoadedBeamGraphData(localShearGraph)
                a.momentComboResults.addLoadedBeamGraphData(localMomentGraph)
                a.deflectionComboResults.addLoadedBeamGraphData(localDeflectionGraph)
                
            }// end for
            
            
            //now put the load combo results into the actual beam view object that are subviews
            shearGraph.loadDataCollection(theBeam: a.BeamGeo, theTitle: "Shear", theLoadComboResult: a.shearComboResults, xPadding: 80, yPadding: 30, optionalMaxUnits:"kips")
            
            momentGraph.loadDataCollection(theBeam: a.BeamGeo, theTitle: "Moment", theLoadComboResult: a.momentComboResults, xPadding: 80, yPadding: 30, optionalMaxUnits: "ft-Kips")
            
            deflectionGraph.loadDataCollection(theBeam: a.BeamGeo, theTitle: "Deflection", theLoadComboResult: a.deflectionComboResults, xPadding: 80, yPadding: 30, optionalMaxUnits: "inches")
            
            
            //redraw the view objects
            var shearPointsToLabel=[CGPoint]()
            var momentPointsToLabel=[CGPoint]()
            var deflectionPointsToLabel=[CGPoint]()
            
            if a.selectedLoadIndex < a.shearComboResults.resultsCollection.count && a.selectedLoadIndex >= 0 && segControl.selectedSegmentIndex == 1{
                shearPointsToLabel = a.shearComboResults.resultsCollection[a.selectedLoadIndex].theDataCollection
                momentPointsToLabel = a.momentComboResults.resultsCollection[a.selectedLoadIndex].theDataCollection
                deflectionPointsToLabel = a.deflectionComboResults.resultsCollection[a.selectedLoadIndex].theDataCollection
                
                shearGraph.drawAllWithLabelsOn(shearPointsToLabel, selectedLoadIndex:a.selectedLoadIndex, maxTitleLocation:false, totals:false)
                momentGraph.drawAllWithLabelsOn(momentPointsToLabel, selectedLoadIndex:a.selectedLoadIndex, maxTitleLocation: true, totals:false)
                deflectionGraph.drawAllWithLabelsOn(deflectionPointsToLabel, selectedLoadIndex:a.selectedLoadIndex, maxTitleLocation: true, totals:false)
                
            }else{
                shearPointsToLabel = a.shearComboResults.graphTotals.theDataCollection
                momentPointsToLabel = a.momentComboResults.graphTotals.theDataCollection
                deflectionPointsToLabel = a.deflectionComboResults.graphTotals.theDataCollection
                
                shearGraph.drawAllWithLabelsOn(shearPointsToLabel, selectedLoadIndex:a.selectedLoadIndex, maxTitleLocation:false, totals:true)
                momentGraph.drawAllWithLabelsOn(momentPointsToLabel, selectedLoadIndex:a.selectedLoadIndex, maxTitleLocation: true, totals:true)
                deflectionGraph.drawAllWithLabelsOn(deflectionPointsToLabel, selectedLoadIndex:a.selectedLoadIndex, maxTitleLocation: true, totals:true)
            }
            
            //        shearPointsToLabel = myShearGraphTotal.graphTotals.theDataCollection
            //        momentPointsToLabel = myMomentGraphTotal.graphTotals.theDataCollection
            //        deflectionPointsToLabel = myDeflectionGraphTotal.graphTotals.theDataCollection
            
            
            
            
            ////////////////////////
            
            
            
            //for the load graph
            //this gives the load graph view the appropriate data
            loadGraph.loadCollection = a.loadCollection
            loadGraph.loadDataCollection(a.BeamGeo, theLoadCollection: a.loadCollection, xPadding: 80, yPadding: 50)
            
            //This should redraw the based upon the new data
            self.loadGraph.drawGraphs(a.selectedLoadIndex) //for the load
            
            
            //layout the custom buttons
            let buttonFrame = CGRect(x: shearGraph.frame.width - 100, y: 5, width: 75, height: 31)
            self.but_toShearTable.frame = buttonFrame
            self.but_toMomentTable.frame = buttonFrame
            self.but_toDeflectionTable.frame = buttonFrame
            
            //but_toShearTable.backgroundColor = UIColor.groupTableViewBackgroundColor()
            but_toShearTable.setTitle("Tabular ->", for: UIControlState())
            but_toMomentTable.setTitle("Tabular ->", for: UIControlState())
            but_toDeflectionTable.setTitle("Tabular ->", for: UIControlState())
            //b1.titleLabel?.font = UIFont.systemFontOfSize(12)
            shearGraph.addSubview(but_toShearTable)
            momentGraph.addSubview(but_toMomentTable)
            deflectionGraph.addSubview(but_toDeflectionTable)
            
            let buttonFrame2 = CGRect(x: shearGraph.frame.width - 100,y: 5, width: 75, height: 31)
            self.but_toCalcs.frame = buttonFrame2
            but_toCalcs.setTitle("Calcs ->", for: UIControlState())
            loadGraph.addSubview(but_toCalcs)
            
            
            
            loadGraph.setNeedsDisplay()
            shearGraph.setNeedsDisplay()
            momentGraph.setNeedsDisplay()
            deflectionGraph.setNeedsDisplay()
            
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func getBeamGraphSnapShots(_ graph:MWBeamGraphView)-> [UIImage]{
        var theImages:[UIImage] = [UIImage]()
        let loadIndexToRestoreUponCompletion:Int = a.selectedLoadIndex
        let segIndexToRestoreUponCompletion:Int = segControl.selectedSegmentIndex
        
        
        
        //turn off the buttons we do not want to see in snapshots
        but_toShearTable.isHidden = true
        but_toMomentTable.isHidden = true
        but_toDeflectionTable.isHidden = true
        but_toCalcs.isHidden = true
        
        segControl.selectedSegmentIndex = 1
        
        
        for i:Int in 0 ..< a.loadCollection.count{
            a.selectedLoadIndex = i
            self.updateGraphs()
            theImages.append(graph.getSnapshot())
        }
        
        //get the last set of images
        segControl.selectedSegmentIndex = 0
        a.selectedLoadIndex = -1
        self.updateGraphs()
        theImages.append(graph.getSnapshot())
        
        
        //turn the buttons back on
        but_toShearTable.isHidden = false
        but_toMomentTable.isHidden = false
        but_toDeflectionTable.isHidden = false
        but_toCalcs.isHidden = false
        
        //restore the selected load and segment control
        a.selectedLoadIndex = loadIndexToRestoreUponCompletion
        segControl.selectedSegmentIndex = segIndexToRestoreUponCompletion
        
        return theImages
    }
    
    
    func updateDesignTypeDisplay(theType:String){
        designTypeBtn.title = theType
       
    }
    
    
}
