
//  MWNSViewForTBStatus.swift
//  
//
//  Created by Mark Walker on 9/17/15.
//
//

import UIKit

class MWNSViewForTBStatus: UIView {

    //var initialViewColor = NSColor(calibratedHue: 0.96, saturation: 0.96, brightness: 0.96, alpha: 1)
    
    var initialViewColor = UIColor.init(red: 0.96, green: 0.96, blue: 0.96, alpha: 0.85)
    

    var gColor1:UIColor = UIColor.red
    var gColor2:UIColor = UIColor.white
    
    var circleColor:UIColor = UIColor.red
    
    var circlePath:UIBezierPath = UIBezierPath()
    
    
    override func draw(_ dirtyRect: CGRect) {
        super.draw(dirtyRect)
        
        //create the rounded corners of the nsview
//        let clippedPath = UIBezierPath(roundedRect: dirtyRect, byRoundingCorners: UIRectCorner(rawValue: 5), cornerRadii: CGSize(dictionaryRepresentation: 5 as! CFDictionary)!)
        
        
        
        let clippedPath = UIBezierPath(roundedRect: dirtyRect, cornerRadius: 5)
        clippedPath.addClip()

        //draw the view
        initialViewColor.setFill()
        UIRectFill(self.bounds)
        
        circleColor.setFill()
        //circlePath.stroke()
        circlePath.fill()
        
  
        
    }
    
    
    fileprivate func drawLabel(_ labelString:String){
        
        
        
        let theLabel = UITextField(frame: CGRect(x: 10, y: 2, width: 400, height: 30))
        
        
        //theLabel.background = false
        theLabel.borderStyle = UITextBorderStyle.none
        
        theLabel.text = labelString
        theLabel.font = UIFont.boldSystemFont(ofSize: 12.0)
        //theLabel.textColor = UIColor.white
        
   
        
        self.addSubview(theLabel)
    }
    
    fileprivate func drawCircle(){
        
        
//        let theRect:CGRect = CGRect(x: self.frame.width - 55,y: 5, width: 40, height: 15)
//        
//        let sPt = CGPoint(x: self.frame.width - 50, y: 5)
//        let pt2 = CGPoint(x: self.frame.width - 25, y: 5)
//        let pt3 = CGPoint(x: self.frame.width - 25, y: 35)
//        let pt4 = CGPoint(x: self.frame.width - 50, y: 35)
//        
//        circlePath.move(to: sPt)
//        circlePath.addLine(to: pt2)
//        circlePath.addLine(to: pt3)
//        circlePath.addLine(to: pt4)
//        circlePath.addLine(to: sPt)
        
        let ovalPath = UIBezierPath(ovalIn: CGRect(x: self.frame.width - 50, y: 5, width: 35, height: 23))
        circlePath = ovalPath
        
        
        
    }
    
    
    func setAndDrawContent(_ labelString:String, passColor:UIColor){
        //self.subviews.removeAll()
        
        for _ in self.subviews{
            removeFromSuperview()
        }
        
        drawLabel(labelString)
        circleColor = passColor
        drawCircle()
    }
    
    
    
}