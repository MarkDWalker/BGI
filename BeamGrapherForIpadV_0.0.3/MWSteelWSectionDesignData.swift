//
//  MWSteelWSectionDesignData.swift
//  ResiBeam_V0.0.7
//
//  Created by Mark Walker on 8/21/16.
//  Copyright © 2016 Mark Walker. All rights reserved.
//

import UIKit

class MWSteelWSectionDesignData: NSObject {
    
    //MARK:Pubic Var
    var shapeSelected:Bool = true
    //var species:speciesEnum = .SYP
    //var grade:woodGradeEnum = .No2
    var shape:NSString = "W4x13"
    //var shapeType:NSString = "Rectangular"  //Rectangular, I , or L
    var depth:Double = 7.25 //value in inches
    var width:Double = 1.75 //value in inches
    var area:Double = 12.69 //value in inches^2
    var sectionModulus:Double = 15.33 //value in inches^3
    var I:Double = 1
    var vArea:Double  = 1//value for shear calculation
    
    
    
    
    
    var selectedShapeIndex:Int = 0
    
    
    
    //steel only
    var webThickness:Double = 0.25 //value used to calculate the Shear area (vArea) for steel beams) in inches
    var bf:Double = 1.0
    var tf:Double = 1.0
    var h:Double = 1.0
    var rt:Double = 1.0
    
    
    //MARK:Public Functions
    override init(){
        super.init()
    }
    
    init(selectedRow:Int){
        super.init()
        self.selectedShapeIndex = selectedRow
        
        
        setSectionData(selectedRow)
        I = width * depth * depth * depth/12
        vArea = depth * width
    }
    
    
    
    func setSectionData(_ selectedRow:Int){
        
        selectedShapeIndex = selectedRow
        
        if selectedRow == 0 {
            self.shapeSelected = true; self.shape = "W4x13"
            self.depth = 4.16
            self.width = 4.06
            self.area = 3.83
            self.sectionModulus = 5.46
            self.I = 11.3
            self.webThickness = 0.28
            self.bf = 4.06
            self.tf = 0.345
            self.h = 2.75
            self.rt = 1.10
            
        }else if selectedRow == 1{
            self.shapeSelected = true; self.shape = "W5x16"
            self.depth = 5.01
            self.width = 5.00
            self.area = 4.68
            self.sectionModulus = 8.51
            self.I = 21.3
            self.webThickness = 0.24
            self.bf = 5.00
            self.tf = 0.36
            self.h = 3.50
            self.rt = 1.37
            
        }else if selectedRow == 2{
            self.shapeSelected = true; self.shape = "W5x19"
            self.depth = 5.15
            self.width = 5.03
            self.area = 5.54
            self.sectionModulus = 10.2
            self.I = 26.2
            self.webThickness = 0.27
            self.bf = 5.03
            self.tf = 0.43
            self.h = 3.50
            self.rt = 1.38
            
        }else if selectedRow == 3{
            self.shapeSelected = true; self.shape = "W6x9"
            self.depth = 5.90
            self.width = 3.94
            self.area = 2.68
            self.sectionModulus = 5.56
            self.I = 16.4
            self.webThickness = 0.17
            self.bf = 3.94
            self.tf = 0.215
            self.h = 4.75
            self.rt = 1.03
            
        }else if selectedRow == 4{
            self.shapeSelected = true; self.shape = "W6x12"
            self.depth = 6.03
            self.width = 4.0
            self.area = 3.55
            self.sectionModulus = 7.31
            self.I = 22.1
            self.webThickness = 0.23
            self.bf = 4.0
            self.tf = 0.28
            self.h = 4.75
            self.rt = 1.05
            
        }else if selectedRow == 5{
            self.shapeSelected = true; self.shape = "W6x16"
            self.depth = 6.28
            self.width = 4.03
            self.area = 4.74
            self.sectionModulus = 10.2
            self.I = 32.1
            self.webThickness = 0.26
            self.bf = 4.03
            self.tf = 0.365
            self.h = 4.75
            self.rt = 1.08
            
        }else if selectedRow == 6{
            self.shapeSelected = true; self.shape = "W6x15"
            self.depth = 5.99
            self.width = 5.99
            self.area = 4.43
            self.sectionModulus = 9.72
            self.I = 29.1
            self.webThickness = 0.23
            self.bf = 5.99
            self.tf = 0.26
            self.h = 4.75
            self.rt = 1.61
            
        }else if selectedRow == 7{
            self.shapeSelected = true; self.shape = "W6x20"
            self.depth = 6.20
            self.width = 6.02
            self.area = 5.87
            self.sectionModulus = 13.4
            self.I = 41.40
            self.webThickness = 0.26
            self.bf = 6.02
            self.tf = 0.365
            self.h = 4.75
            self.rt = 1.64
            
        }else if selectedRow == 8{
            self.shapeSelected = true; self.shape = "W6x25"
            self.depth = 6.38
            self.width = 6.08
            self.area = 7.34
            self.sectionModulus = 16.7
            self.I = 53.10
            self.webThickness = 0.32
            self.bf = 6.08
            self.tf = 0.455
            self.h = 4.75
            self.rt = 1.66
            
        }else if selectedRow == 9{
            self.shapeSelected = true; self.shape = "W8x10"
            self.depth = 7.89
            self.width = 3.94
            self.area = 2.96
            self.sectionModulus = 7.81
            self.I = 30.80
            self.webThickness = 0.170
            self.bf = 3.94
            self.tf = 0.205
            self.h = 6.625
            self.rt = 0.99
            
        }else if selectedRow == 10{
            self.shapeSelected = true
            self.shape = "W8x13"
            self.depth = 7.99
            self.width = 4.00
            self.area = 3.84
            self.sectionModulus = 9.91
            self.I = 39.60
            self.webThickness = 0.230
            self.bf = 4.0
            self.tf = 0.255
            self.h = 6.625
            self.rt = 1.01
            
            
        }else if selectedRow == 11{
            self.shapeSelected = true
            self.shape = "W8x15"
            self.depth = 8.11
            self.width = 4.02
            self.area = 4.44
            self.sectionModulus = 11.80
            self.I = 48.0
            self.webThickness = 0.245
            self.bf = 4.015
            self.tf = 0.315
            self.h = 6.625
            self.rt = 1.03
            
        }else if selectedRow == 12{
            self.shapeSelected = true
            self.shape = "W8x18"
            self.depth = 8.14
            self.width = 5.25
            self.area = 5.26
            self.sectionModulus = 15.20
            self.I = 61.90
            self.webThickness = 0.230
            self.bf = 5.25
            self.tf = 0.33
            self.h = 6.625
            self.rt = 1.39
            
        }else if selectedRow == 13{
            self.shapeSelected = true
            self.shape = "W8x21"
            self.depth = 8.28
            self.width = 5.27
            self.area = 6.16
            self.sectionModulus = 18.20
            self.I = 75.30
            self.webThickness = 0.250
            self.bf = 5.27
            self.tf = 0.40
            self.h = 6.625
            self.rt = 1.41
            
            
        }else if selectedRow == 14{
            self.shapeSelected = true
            self.shape = "W8x24"
            self.depth = 7.93
            self.width = 6.50
            self.area = 7.08
            self.sectionModulus = 20.90
            self.I = 82.70
            self.webThickness = 0.245
            self.bf = 6.495
            self.tf = 0.400
            self.h = 6.125
            self.rt = 1.76
            
        }else if selectedRow == 15{
            self.shapeSelected = true
            self.shape = "W8x28"
            self.depth = 8.06
            self.width = 6.54
            self.area = 8.24
            self.sectionModulus = 24.3
            self.I = 98.00
            self.webThickness = 0.285
            self.bf = 6.535
            self.tf = 0.465
            self.h = 6.125
            self.rt = 1.77
            
        }else if selectedRow == 16{
            self.shapeSelected = true
            self.shape = "W8x31"
            self.depth = 8.00
            self.width = 8.00
            self.area = 9.12
            self.sectionModulus = 27.5
            self.I = 110.00
            self.webThickness = 0.285
            self.bf = 7.995
            self.tf = 0.435
            self.h = 6.125
            self.rt = 2.18
            
        }else if selectedRow == 17{
            self.shapeSelected = true
            self.shape = "W8x35"
            self.depth = 8.12
            self.width = 8.02
            self.area = 10.30
            self.sectionModulus = 31.20
            self.I = 127.00
            self.webThickness = 0.310
            self.bf = 8.02
            self.tf = 0.495
            self.h = 6.125
            self.rt = 2.20
            
        }else if selectedRow == 18{
            self.shapeSelected = true
            self.shape = "W8x40"
            self.depth = 8.25
            self.width = 8.07
            self.area = 11.70
            self.sectionModulus = 35.50
            self.I = 146.00
            self.webThickness = 0.360
            self.bf = 8.07
            self.tf = 0.560
            self.h = 6.625
            self.rt = 2.21
            
        }else if selectedRow == 19{
            self.shapeSelected = true
            self.shape = "W8x48"
            self.depth = 8.50
            self.width = 8.11
            self.area = 14.10
            self.sectionModulus = 43.20
            self.I = 184.00
            self.webThickness = 0.400
            self.bf = 8.11
            self.tf = 0.685
            self.h = 6.125
            self.rt = 2.23
            
        }else if selectedRow == 20{
            self.shapeSelected = true
            self.shape = "W8x58"
            self.depth = 8.75
            self.width = 8.22
            self.area = 17.1
            self.sectionModulus = 52.0
            self.I = 228.00
            self.webThickness = 0.510
            self.bf = 8.22
            self.tf = 0.810
            self.h = 6.125
            self.rt = 2.26
            
        }else if selectedRow == 21{
            self.shapeSelected = true
            self.shape = "W8x67"
            self.depth = 9.00
            self.width = 8.28
            self.area = 19.7
            self.sectionModulus = 60.4
            self.I = 272.00
            self.webThickness = 0.570
            self.bf = 8.28
            self.tf = 0.935
            self.h = 6.125
            self.rt = 2.28
            
        }else if selectedRow == 22{
            self.shapeSelected = true
            self.shape = "W10x12"
            self.depth = 9.87
            self.width = 3.96
            self.area = 3.54
            self.sectionModulus = 10.90
            self.I = 53.8
            self.webThickness = 0.19
            self.bf = 3.96
            self.tf = 0.21
            self.h = 8.625
            self.rt = 0.96
        }else if selectedRow == 23{
            self.shapeSelected = true
            self.shape = "W10x15"
            self.depth = 9.99
            self.width = 4.00
            self.area = 4.41
            self.sectionModulus = 13.8
            self.I = 68.9
            self.webThickness = 0.23
            self.bf = 4.00
            self.tf = 0.270
            self.h = 8.625
            self.rt = 0.99
        }else if selectedRow == 24{
            self.shapeSelected = true
            self.shape = "W10x17"
            self.depth = 10.11
            self.width = 4.01
            self.area = 4.99
            self.sectionModulus = 16.2
            self.I = 81.90
            self.webThickness = 0.24
            self.bf = 4.01
            self.tf = 0.33
            self.h = 8.625
            self.rt = 1.01
        }else if selectedRow == 25{
            self.shapeSelected = true
            self.shape = "W10x19"
            self.depth = 10.24
            self.width = 4.02
            self.area = 5.62
            self.sectionModulus = 18.80
            self.I = 96.30
            self.webThickness = 0.25
            self.bf = 4.02
            self.tf = 0.395
            self.h = 8.625
            self.rt = 1.03
        }else if selectedRow == 26{
            self.shapeSelected = true
            self.shape = "W10x22"
            self.depth = 10.17
            self.width = 5.75
            self.area = 6.49
            self.sectionModulus = 23.20
            self.I = 96.3
            self.webThickness = 0.24
            self.bf = 5.75
            self.tf = 0.360
            self.h = 8.625
            self.rt = 1.51
        }else if selectedRow == 27{
            self.shapeSelected = true
            self.shape = "W10x26"
            self.depth = 10.33
            self.width = 5.77
            self.area = 7.61
            self.sectionModulus = 27.90
            self.I = 144.00
            self.webThickness = 0.260
            self.bf = 5.77
            self.tf = 0.44
            self.h = 8.625
            self.rt = 1.54
        }else if selectedRow == 28{
            self.shapeSelected = true
            self.shape = "W10x30"
            self.depth = 10.5
            self.width = 5.81
            self.area = 8.84
            self.sectionModulus = 32.4
            self.I = 170.0
            self.webThickness = 0.30
            self.bf = 5.810
            self.tf = 0.510
            self.h = 8.625
            self.rt = 1.55
            
        }else if selectedRow == 29{
            self.shapeSelected = true
            self.shape = "W10x33"
            self.depth = 9.73
            self.width = 7.96
            self.area = 9.71
            self.sectionModulus = 35.0
            self.I = 171.0
            self.webThickness = 0.29
            self.bf = 7.960
            self.tf = 0.435
            self.h = 7.625
            self.rt = 2.14
            
        }else if selectedRow == 30{
            self.shapeSelected = true
            self.shape = "W10x39"
            self.depth = 9.92
            self.width = 7.99
            self.area = 11.5
            self.sectionModulus = 42.1
            self.I = 209
            self.webThickness = 0.315
            self.bf = 7.99
            self.tf = 0.530
            self.h = 7.625
            self.rt = 2.16
            
        }else if selectedRow == 31{
            self.shapeSelected = true
            self.shape = "W10x45"
            self.depth = 10.10
            self.width = 8.02
            self.area = 13.3
            self.sectionModulus = 49.1
            self.I = 248.0
            self.webThickness = 0.35
            self.bf = 8.02
            self.tf = 0.620
            self.h = 7.625
            self.rt = 2.18
            
        }else if selectedRow == 32{
            self.shapeSelected = true
            self.shape = "W10x49"
            self.depth = 9.98
            self.width = 10.00
            self.area = 14.4
            self.sectionModulus = 54.6
            self.I = 272.0
            self.webThickness = 0.34
            self.bf = 10.00
            self.tf = 0.560
            self.h = 7.625
            self.rt = 2.74
            
        }else if selectedRow == 33{
            self.shapeSelected = true
            self.shape = "W10x54"
            self.depth = 10.09
            self.width = 10.03
            self.area = 15.8
            self.sectionModulus = 60.0
            self.I = 303.00
            self.webThickness = 0.37
            self.bf = 10.03
            self.tf = 0.615
            self.h = 7.625
            self.rt = 2.75
            
        }else if selectedRow == 34{
            self.shapeSelected = true
            self.shape = "W10x60"
            self.depth = 10.22
            self.width = 10.08
            self.area = 17.7
            self.sectionModulus = 66.7
            self.I = 341.0
            self.webThickness = 0.42
            self.bf = 10.08
            self.tf = 0.680
            self.h = 7.625
            self.rt = 2.77
            
        }else if selectedRow == 35{
            self.shapeSelected = true
            self.shape = "W10x68"
            self.depth = 10.40
            self.width = 10.13
            self.area = 20.0
            self.sectionModulus = 75.7
            self.I = 394.0
            self.webThickness = 0.470
            self.bf = 10.13
            self.tf = 0.770
            self.h = 7.625
            self.rt = 2.79
            
        }else if selectedRow == 36{
            self.shapeSelected = true
            self.shape = "W10x77"
            self.depth = 10.60
            self.width = 10.19
            self.area = 22.60
            self.sectionModulus = 85.90
            self.I = 455.0
            self.webThickness = 0.530
            self.bf = 10.190
            self.tf = 0.870
            self.h = 7.625
            self.rt = 2.80
            
        }else if selectedRow == 37{
            self.shapeSelected = true
            self.shape = "W10x88"
            self.depth = 10.84
            self.width = 10.265
            self.area = 25.90
            self.sectionModulus = 98.5
            self.I = 534.0
            self.webThickness = 0.605
            self.bf = 10.265
            self.tf = 0.990
            self.h = 7.625
            self.rt = 2.83
            
        }else if selectedRow == 38{
            self.shapeSelected = true
            self.shape = "W10x100"
            self.depth = 11.10
            self.width = 10.34
            self.area = 29.40
            self.sectionModulus = 112.0
            self.I = 623.0
            self.webThickness = 0.680
            self.bf = 10.340
            self.tf = 1.120
            self.h = 7.625
            self.rt = 2.85
            
        }else if selectedRow == 39{
            self.shapeSelected = true
            self.shape = "W10x112"
            self.depth = 11.36
            self.width = 10.415
            self.area = 32.90
            self.sectionModulus = 126.0
            self.I = 716.0
            self.webThickness = 0.755
            self.bf = 10.415
            self.tf = 1.250
            self.h = 7.625
            self.rt = 2.880
            
        }else if selectedRow == 40{
            self.shapeSelected = true
            self.shape = "W12x14"
            self.depth = 11.91
            self.width = 3.97
            self.area = 4.16
            self.sectionModulus = 14.90
            self.I = 88.60
            self.webThickness = 0.20
            self.bf = 3.97
            self.tf = 0.225
            self.h = 10.5
            self.rt = 0.95
            
        }else if selectedRow == 41{
            self.shapeSelected = true
            self.shape = "W12x16"
            self.depth = 11.99
            self.width = 3.990
            self.area = 4.71
            self.sectionModulus = 17.10
            self.I = 103.0
            self.webThickness = 0.220
            self.bf = 3.990
            self.tf = 0.265
            self.h = 10.5
            self.rt = 0.960
            
        }else if selectedRow == 42{
            self.shapeSelected = true
            self.shape = "W12x19"
            self.depth = 12.16
            self.width = 4.4005
            self.area = 5.57
            self.sectionModulus = 21.30
            self.I = 130.0
            self.webThickness = 0.235
            self.bf = 4.005
            self.tf = 0.350
            self.h = 10.5
            self.rt = 1.00
            
        }else if selectedRow == 43{
            self.shapeSelected = true
            self.shape = "W12x22"
            self.depth = 12.31
            self.width = 4.030
            self.area = 6.48
            self.sectionModulus = 25.40
            self.I = 156.0
            self.webThickness = 0.260
            self.bf = 4.030
            self.tf = 0.425
            self.h = 10.5
            self.rt = 1.02
            
        }else if selectedRow == 44{
            self.shapeSelected = true
            self.shape = "W12x26"
            self.depth = 12.22
            self.width = 6.49
            self.area = 7.65
            self.sectionModulus = 33.40
            self.I = 204.0
            self.webThickness = 0.230
            self.bf = 6.49
            self.tf = 0.38
            self.h = 10.5
            self.rt = 1.72
            
        }else if selectedRow == 45{
            self.shapeSelected = true
            self.shape = "W12x30"
            self.depth = 12.34
            self.width = 6.52
            self.area = 8.79
            self.sectionModulus = 38.6
            self.I = 238.0
            self.webThickness = 0.26
            self.bf = 6.52
            self.tf = 0.44
            self.h = 10.5
            self.rt = 1.72
            
        }else if selectedRow == 46{
            self.shapeSelected = true
            self.shape = "W12x35"
            self.depth = 12.50
            self.width = 6.56
            self.area = 10.30
            self.sectionModulus = 45.60
            self.I = 285.0
            self.webThickness = 0.30
            self.bf = 6.56
            self.tf = 0.52
            self.h = 10.5
            self.rt = 1.74
            
        }else if selectedRow == 47{
            self.shapeSelected = true
            self.shape = "W12x40"
            self.depth = 11.94
            self.width = 8.005
            self.area = 11.80
            self.sectionModulus = 51.90
            self.I = 310.0
            self.webThickness = 0.295
            self.bf = 8.005
            self.tf = 0.515
            self.h = 9.5
            self.rt = 2.14
            
        }else if selectedRow == 48{
            self.shapeSelected = true
            self.shape = "W12x45"
            self.depth = 12.06
            self.width = 8.045
            self.area = 13.20
            self.sectionModulus = 58.10
            self.I = 350.0
            self.webThickness = 0.335
            self.bf = 8.045
            self.tf = 0.575
            self.h = 9.5
            self.rt = 2.15
            
        }else if selectedRow == 49{
            self.shapeSelected = true
            self.shape = "W12x50"
            self.depth = 12.19
            self.width = 8.08
            self.area = 14.70
            self.sectionModulus = 64.70
            self.I = 394.0
            self.webThickness = 0.370
            self.bf = 8.080
            self.tf = 0.640
            self.h = 9.5
            self.rt = 2.17
            
        }else if selectedRow == 50{
            self.shapeSelected = true
            self.shape = "W12x53"
            self.depth = 12.06
            self.width = 9.995
            self.area = 15.60
            self.sectionModulus = 70.60
            self.I = 425.0
            self.webThickness = 0.345
            self.bf = 9.995
            self.tf = 0.575
            self.h = 9.5
            self.rt = 2.71
            
        }else if selectedRow == 51{
            self.shapeSelected = true
            self.shape = "W12x58"
            self.depth = 12.19
            self.width = 10.01
            self.area = 17.0
            self.sectionModulus = 78.0
            self.I = 475.0
            self.webThickness = 0.360
            self.bf = 10.01
            self.tf = 0.640
            self.h = 9.5
            self.rt = 2.72
            
        }else if selectedRow == 52{
            self.shapeSelected = true
            self.shape = "W12x65"
            self.depth = 12.12
            self.width = 12.00
            self.area = 19.10
            self.sectionModulus = 87.9
            self.I = 533.0
            self.webThickness = 0.390
            self.bf = 12.00
            self.tf = 0.605
            self.h = 9.5
            self.rt = 3.28
            
        }else if selectedRow == 53{
            self.shapeSelected = true
            self.shape = "W12x72"
            self.depth = 12.25
            self.width = 12.04
            self.area = 21.10
            self.sectionModulus = 97.40
            self.I = 597.0
            self.webThickness = 0.430
            self.bf = 12.04
            self.tf = 0.670
            self.h = 9.5
            self.rt = 3.29
            
        }else if selectedRow == 54{
            self.shapeSelected = true
            self.shape = "W12x79"
            self.depth = 12.38
            self.width = 12.08
            self.area = 23.20
            self.sectionModulus = 107.0
            self.I = 662.0
            self.webThickness = 0.470
            self.bf = 12.08
            self.tf = 0.735
            self.h = 9.5
            self.rt = 3.31
            
        }else if selectedRow == 55{
            self.shapeSelected = true
            self.shape = "W12x87"
            self.depth = 12.53
            self.width = 12.125
            self.area = 25.60
            self.sectionModulus = 118.0
            self.I = 740.0
            self.webThickness = 0.515
            self.bf = 12.125
            self.tf = 0.810
            self.h = 9.5
            self.rt = 3.32
            
        }else if selectedRow == 56{
            self.shapeSelected = true
            self.shape = "W12x96"
            self.depth = 12.71
            self.width = 12.16
            self.area = 28.20
            self.sectionModulus = 131.0
            self.I = 833.0
            self.webThickness = 0.550
            self.bf = 12.16
            self.tf = 0.900
            self.h = 9.5
            self.rt = 3.34
            
        }else if selectedRow == 57{
            self.shapeSelected = true
            self.shape = "W12x106"
            self.depth = 12.89
            self.width = 12.22
            self.area = 28.20
            self.sectionModulus = 145.0
            self.I = 933.0
            self.webThickness = 0.610
            self.bf = 12.22
            self.tf = 0.990
            self.h = 9.5
            self.rt = 3.36
            
        }else if selectedRow == 58{
            self.shapeSelected = true
            self.shape = "W14x22"
            self.depth = 13.74
            self.width = 5.00
            self.area = 6.49
            self.sectionModulus = 29.0
            self.I = 199.0
            self.webThickness = 0.230
            self.bf = 5.00
            self.tf = 0.335
            self.h = 12.0
            self.rt = 1.25
            
        }else if selectedRow == 59{
            self.shapeSelected = true
            self.shape = "W14x26"
            self.depth = 13.91
            self.width = 5.025
            self.area = 7.69
            self.sectionModulus = 35.0
            self.I = 245.0
            self.webThickness = 0.255
            self.bf = 5.025
            self.tf = 0.420
            self.h = 12.0
            self.rt = 1.28
            
        }else if selectedRow == 60{
            self.shapeSelected = true
            self.shape = "W14x30"
            self.depth = 13.84
            self.width = 6.73
            self.area = 8.85
            self.sectionModulus = 42.0
            self.I = 291.0
            self.webThickness = 0.270
            self.bf = 6.73
            self.tf = 0.385
            self.h = 12.0
            self.rt = 1.74
            
        }else if selectedRow == 61{
            self.shapeSelected = true
            self.shape = "W14x34"
            self.depth = 13.98
            self.width = 6.745
            self.area = 10.0
            self.sectionModulus = 48.60
            self.I = 340.0
            self.webThickness = 0.285
            self.bf = 6.745
            self.tf = 0.455
            self.h = 12.0
            self.rt = 1.76
            
        }else if selectedRow == 62{
            self.shapeSelected = true
            self.shape = "W14x38"
            self.depth = 14.10
            self.width = 6.770
            self.area = 11.20
            self.sectionModulus = 54.60
            self.I = 385.0
            self.webThickness = 0.310
            self.bf = 6.770
            self.tf = 0.515
            self.h = 12.0
            self.rt = 1.77
            
        }else if selectedRow == 63{
            self.shapeSelected = true
            self.shape = "W14x43"
            self.depth = 13.66
            self.width = 7.995
            self.area = 12.60
            self.sectionModulus = 62.70
            self.I = 428.0
            self.webThickness = 0.305
            self.bf = 7.995
            self.tf = 0.530
            self.h = 11.0
            self.rt = 2.12
            
        }else if selectedRow == 64{
            self.shapeSelected = true
            self.shape = "W14x48"
            self.depth = 13.79
            self.width = 8.03
            self.area = 14.10
            self.sectionModulus = 70.30
            self.I = 485.0
            self.webThickness = 0.340
            self.bf = 8.03
            self.tf = 0.595
            self.h = 11.0
            self.rt = 2.13
            
        }else if selectedRow == 65{
            self.shapeSelected = true
            self.shape = "W14x53"
            self.depth = 13.92
            self.width = 8.06
            self.area = 15.60
            self.sectionModulus = 77.8
            self.I = 541.0
            self.webThickness = 0.370
            self.bf = 8.06
            self.tf = 0.660
            self.h = 11.0
            self.rt = 2.15
            
        }else if selectedRow == 66{
            self.shapeSelected = true
            self.shape = "W14x61"
            self.depth = 13.89
            self.width = 9.995
            self.area = 17.90
            self.sectionModulus = 92.20
            self.I = 640.0
            self.webThickness = 0.375
            self.bf = 9.995
            self.tf = 0.645
            self.h = 11.0
            self.rt = 2.70
            
        }else if selectedRow == 67{
            self.shapeSelected = true
            self.shape = "W14x68"
            self.depth = 14.04
            self.width = 10.035
            self.area = 20.0
            self.sectionModulus = 103.0
            self.I = 723.0
            self.webThickness = 0.415
            self.bf = 10.035
            self.tf = 0.720
            self.h = 11.0
            self.rt = 2.71
            
        }else if selectedRow == 68{
            self.shapeSelected = true
            self.shape = "W14x74"
            self.depth = 14.17
            self.width = 10.07
            self.area = 21.80
            self.sectionModulus = 112.0
            self.I = 796.0
            self.webThickness = 0.45
            self.bf = 10.07
            self.tf = 0.785
            self.h = 11.0
            self.rt = 2.72
            
        }else if selectedRow == 69{
            self.shapeSelected = true
            self.shape = "W14x82"
            self.depth = 14.31
            self.width = 10.13
            self.area = 24.10
            self.sectionModulus = 123.0
            self.I = 882.0
            self.webThickness = 0.51
            self.bf = 10.13
            self.tf = 0.855
            self.h = 11.0
            self.rt = 2.74
            
        }else if selectedRow == 70{
            self.shapeSelected = true
            self.shape = "W14x90"
            self.depth = 14.02
            self.width = 14.52
            self.area = 26.50
            self.sectionModulus = 143.0
            self.I = 999.0
            self.webThickness = 0.440
            self.bf = 14.52
            self.tf = 0.710
            self.h = 11.25
            self.rt = 3.99
            
        }else if selectedRow == 71{
            self.shapeSelected = true
            self.shape = "W14x99"
            self.depth = 14.16
            self.width = 14.565
            self.area = 29.10
            self.sectionModulus = 157.0
            self.I = 1110.0
            self.webThickness = 0.485
            self.bf = 14.565
            self.tf = 0.780
            self.h = 11.25
            self.rt = 4.00
            
        }else if selectedRow == 72{
            self.shapeSelected = true
            self.shape = "W14x109"
            self.depth = 14.32
            self.width = 14.605
            self.area = 32.0
            self.sectionModulus = 173.0
            self.I = 1240.0
            self.webThickness = 0.5250
            self.bf = 14.605
            self.tf = 0.860
            self.h = 11.25
            self.rt = 4.02
            
        }else if selectedRow == 73{
            self.shapeSelected = true
            self.shape = "W14x120"
            self.depth = 14.48
            self.width = 14.67
            self.area = 35.30
            self.sectionModulus = 190.0
            self.I = 1380.0
            self.webThickness = 0.590
            self.bf = 14.67
            self.tf = 0.94
            self.h = 11.25
            self.rt = 4.04
            
        }else if selectedRow == 74{
            self.shapeSelected = true
            self.shape = "W14x132"
            self.depth = 14.66
            self.width = 14.725
            self.area = 38.80
            self.sectionModulus = 209.0
            self.I = 1530.0
            self.webThickness = 0.645
            self.bf = 14.725
            self.tf = 1.030
            self.h = 11.25
            self.rt = 4.05
            ///////
        }else if selectedRow == 75{
            self.shapeSelected = true
            self.shape = "W14x145"
            self.depth = 14.78
            self.width = 15.50
            self.area = 42.70
            self.sectionModulus = 232.0
            self.I = 1710.0
            self.webThickness = 0.680
            self.bf = 15.50
            self.tf = 1.090
            self.h = 11.25
            self.rt = 4.28
            
        }else if selectedRow == 76{
            self.shapeSelected = true
            self.shape = "W14x159"
            self.depth = 14.98
            self.width = 15.565
            self.area = 46.70
            self.sectionModulus = 254.0
            self.I = 1900.0
            self.webThickness = 0.745
            self.bf = 15.565
            self.tf = 1.190
            self.h = 11.25
            self.rt = 4.30
            
        }else if selectedRow == 77{
            self.shapeSelected = true
            self.shape = "W14x176"
            self.depth = 15.22
            self.width = 15.650
            self.area = 51.80
            self.sectionModulus = 281.0
            self.I = 2140.0
            self.webThickness = 0.830
            self.bf = 15.650
            self.tf = 1.310
            self.h = 11.25
            self.rt = 4.32
            
        }else if selectedRow == 78{
            self.shapeSelected = true
            self.shape = "W14x193"
            self.depth = 15.480
            self.width = 15.710
            self.area = 56.80
            self.sectionModulus = 310.0
            self.I = 2400.0
            self.webThickness = 0.890
            self.bf = 15.710
            self.tf = 1.44
            self.h = 11.25
            self.rt = 4.35
            
        }else if selectedRow == 79{
            self.shapeSelected = true
            self.shape = "W14x211"
            self.depth = 15.720
            self.width = 15.800
            self.area = 62.00
            self.sectionModulus = 338.0
            self.I = 2660.0
            self.webThickness = 0.980
            self.bf = 15.800
            self.tf = 1.560
            self.h = 11.25
            self.rt = 4.37
            //////////////////////////////////////////
        }else if selectedRow == 80{
            self.shapeSelected = true
            self.shape = "W16x36"
            self.depth = 15.860
            self.width = 6.985
            self.area = 10.60
            self.sectionModulus = 56.50
            self.I = 448.0
            self.webThickness = 0.295
            self.bf = 6.985
            self.tf = 0.430
            self.h = 13.625
            self.rt = 1.79
            
        }else if selectedRow == 81{
            self.shapeSelected = true
            self.shape = "W16x40"
            self.depth = 16.01
            self.width = 6.995
            self.area = 11.80
            self.sectionModulus = 64.70
            self.I = 518.0
            self.webThickness = 0.305
            self.bf = 6.995
            self.tf = 0.505
            self.h = 13.625
            self.rt = 1.82
            
        }else if selectedRow == 82{
            self.shapeSelected = true
            self.shape = "W16x45"
            self.depth = 16.13
            self.width = 7.035
            self.area = 13.30
            self.sectionModulus = 72.70
            self.I = 586.0
            self.webThickness = 0.345
            self.bf = 7.035
            self.tf = 0.565
            self.h = 13.625
            self.rt = 1.83
            
        }else if selectedRow == 83{
            self.shapeSelected = true
            self.shape = "W16x50"
            self.depth = 16.26
            self.width = 7.07
            self.area = 14.70
            self.sectionModulus = 81.0
            self.I = 659.0
            self.webThickness = 0.380
            self.bf = 7.07
            self.tf = 0.63
            self.h = 13.625
            self.rt = 1.840
            
        }else if selectedRow == 84{
            self.shapeSelected = true
            self.shape = "W16x57"
            self.depth = 16.43
            self.width = 7.120
            self.area = 16.80
            self.sectionModulus = 92.20
            self.I = 758.0
            self.webThickness = 0.430
            self.bf = 7.120
            self.tf = 0.715
            self.h = 13.625
            self.rt = 1.86
            /////////
        }else if selectedRow == 85{
            self.shapeSelected = true
            self.shape = "W16x67"
            self.depth = 16.33
            self.width = 10.235
            self.area = 19.70
            self.sectionModulus = 117.0
            self.I = 954.0
            self.webThickness = 0.395
            self.bf = 10.235
            self.tf = 0.665
            self.h = 13.625
            self.rt = 2.75
            
        }else if selectedRow == 86{
            self.shapeSelected = true
            self.shape = "W16x77"
            self.depth = 16.52
            self.width = 10.295
            self.area = 22.60
            self.sectionModulus = 134.0
            self.I = 1110.0
            self.webThickness = 0.455
            self.bf = 10.295
            self.tf = 0.760
            self.h = 13.625
            self.rt = 2.77
            
        }else if selectedRow == 87{
            self.shapeSelected = true
            self.shape = "W16x89"
            self.depth = 16.75
            self.width = 10.365
            self.area = 26.20
            self.sectionModulus = 155.0
            self.I = 1300.0
            self.webThickness = 0.525
            self.bf = 10.365
            self.tf = 0.875
            self.h = 13.625
            self.rt = 2.79
            
        }else if selectedRow == 88{
            self.shapeSelected = true
            self.shape = "W16x100"
            self.depth = 16.97
            self.width = 10.425
            self.area = 29.40
            self.sectionModulus = 175.0
            self.I = 1490.0
            self.webThickness = 0.585
            self.bf = 10.425
            self.tf = 0.985
            self.h = 13.625
            self.rt = 2.81
            
        }else if selectedRow == 89{
            self.shapeSelected = true
            self.shape = "W18x35"
            self.depth = 17.70
            self.width = 6.0
            self.area = 10.30
            self.sectionModulus = 57.60
            self.I = 510.0
            self.webThickness = 0.300
            self.bf = 6.00
            self.tf = 0.425
            self.h = 15.50
            self.rt = 1.49
            
        }else if selectedRow == 90{
            self.shapeSelected = true
            self.shape = "W18x40"
            self.depth = 17.90
            self.width = 6.015
            self.area = 11.80
            self.sectionModulus = 68.40
            self.I = 612.0
            self.webThickness = 0.315
            self.bf = 6.015
            self.tf = 0.525
            self.h = 15.50
            self.rt = 1.52
            
        }else if selectedRow == 91{
            self.shapeSelected = true
            self.shape = "W18x46"
            self.depth = 18.06
            self.width = 6.06
            self.area = 13.50
            self.sectionModulus = 78.80
            self.I = 712.0
            self.webThickness = 0.360
            self.bf = 6.06
            self.tf = 0.605
            self.h = 15.5
            self.rt = 1.54
            ///////////
        }else if selectedRow == 92{
            self.shapeSelected = true
            self.shape = "W18x50"
            self.depth = 17.99
            self.width = 7.495
            self.area = 14.70
            self.sectionModulus = 88.90
            self.I = 800.0
            self.webThickness = 0.355
            self.bf = 7.495
            self.tf = 0.570
            self.h = 15.5
            self.rt = 1.94
            
        }else if selectedRow == 93{
            self.shapeSelected = true
            self.shape = "W18x55"
            self.depth = 18.11
            self.width = 7.530
            self.area = 16.20
            self.sectionModulus = 98.30
            self.I = 890.0
            self.webThickness = 0.390
            self.bf = 7.530
            self.tf = 0.630
            self.h = 15.5
            self.rt = 1.95
            
        }else if selectedRow == 94{
            self.shapeSelected = true
            self.shape = "W18x60"
            self.depth = 18.24
            self.width = 7.555
            self.area = 17.60
            self.sectionModulus = 108.0
            self.I = 984.0
            self.webThickness = 0.415
            self.bf = 7.555
            self.tf = 0.695
            self.h = 15.5
            self.rt = 1.96
            
        }else if selectedRow == 95{
            self.shapeSelected = true
            self.shape = "W18x65"
            self.depth = 18.35
            self.width = 7.590
            self.area = 19.10
            self.sectionModulus = 117.0
            self.I = 1070.0
            self.webThickness = 0.450
            self.bf = 7.590
            self.tf = 0.750
            self.h = 15.5
            self.rt = 1.97
            
        }else if selectedRow == 96{
            self.shapeSelected = true
            self.shape = "W18x71"
            self.depth = 18.47
            self.width = 7.635
            self.area = 20.80
            self.sectionModulus = 127.0
            self.I = 1170.0
            self.webThickness = 0.495
            self.bf = 7.635
            self.tf = 0.810
            self.h = 15.5
            self.rt = 1.98
            ///////////////
        }else if selectedRow == 97{
            self.shapeSelected = true
            self.shape = "W18x76"
            self.depth = 18.21
            self.width = 11.035
            self.area = 22.30
            self.sectionModulus = 146.0
            self.I = 1330.0
            self.webThickness = 0.425
            self.bf = 11.035
            self.tf = 0.680
            self.h = 15.5
            self.rt = 2.95
            
        }else if selectedRow == 98{
            self.shapeSelected = true
            self.shape = "W18x86"
            self.depth = 18.39
            self.width = 11.09
            self.area = 25.30
            self.sectionModulus = 166.0
            self.I = 1530.0
            self.webThickness = 0.480
            self.bf = 11.090
            self.tf = 0.770
            self.h = 15.5
            self.rt = 2.97
            
        }else if selectedRow == 99{
            self.shapeSelected = true
            self.shape = "W18x97"
            self.depth = 18.59
            self.width = 11.145
            self.area = 28.50
            self.sectionModulus = 188.0
            self.I = 1750.0
            self.webThickness = 0.535
            self.bf = 11.145
            self.tf = 0.870
            self.h = 15.5
            self.rt = 2.99
            
        }else if selectedRow == 100{
            self.shapeSelected = true
            self.shape = "W18x106"
            self.depth = 18.73
            self.width = 11.20
            self.area = 31.10
            self.sectionModulus = 204.0
            self.I = 1910.0
            self.webThickness = 0.590
            self.bf = 11.20
            self.tf = 0.940
            self.h = 15.5
            self.rt = 3.00
            
        }else if selectedRow == 101{
            self.shapeSelected = true
            self.shape = "W18x119"
            self.depth = 18.97
            self.width = 11.265
            self.area = 35.10
            self.sectionModulus = 231.0
            self.I = 2190.0
            self.webThickness = 0.655
            self.bf = 11.265
            self.tf = 1.060
            self.h = 15.5
            self.rt = 3.02
            
        }else if selectedRow == 102{
            self.shapeSelected = true
            self.shape = "W18x130"
            self.depth = 19.25
            self.width = 11.160
            self.area = 38.20
            self.sectionModulus = 256.0
            self.I = 2460.0
            self.webThickness = 0.670
            self.bf = 11.160
            self.tf = 1.20
            self.h = 15.5
            self.rt = 3.01
            
        }else if selectedRow == 103{
            self.shapeSelected = true
            self.shape = "W18x143"
            self.depth = 19.49
            self.width = 11.220
            self.area = 42.10
            self.sectionModulus = 282.0
            self.I = 2750.0
            self.webThickness = 0.730
            self.bf = 11.220
            self.tf = 1.320
            self.h = 15.5
            self.rt = 3.03
            
        }else if selectedRow == 104{
            self.shapeSelected = true
            self.shape = "W21x44"
            self.depth = 20.66
            self.width = 6.50
            self.area = 13.0
            self.sectionModulus = 81.60
            self.I = 843.0
            self.webThickness = 0.350
            self.bf = 6.50
            self.tf = 0.450
            self.h = 18.25
            self.rt = 1.57
            
        }else if selectedRow == 105{
            self.shapeSelected = true
            self.shape = "W21x50"
            self.depth = 20.83
            self.width = 6.53
            self.area = 14.70
            self.sectionModulus = 94.50
            self.I = 984
            self.webThickness = 0.380
            self.bf = 6.530
            self.tf = 0.535
            self.h = 18.25
            self.rt = 1.60
            
        }else if selectedRow == 106{
            self.shapeSelected = true
            self.shape = "W21x57"
            self.depth = 21.06
            self.width = 6.555
            self.area = 16.70
            self.sectionModulus = 111.0
            self.I = 1170.0
            self.webThickness = 0.405
            self.bf = 6.555
            self.tf = 0.650
            self.h = 18.25
            self.rt = 1.64
            
        }else if selectedRow == 107{
            self.shapeSelected = true
            self.shape = "W21x62"
            self.depth = 21.0
            self.width = 8.240
            self.area = 18.3
            self.sectionModulus = 127.0
            self.I = 1330.0
            self.webThickness = 0.400
            self.bf = 8.240
            self.tf = 0.615
            self.h = 18.25
            self.rt = 2.10
            
        }else if selectedRow == 108{
            self.shapeSelected = true
            self.shape = "W21x68"
            self.depth = 21.13
            self.width = 8.270
            self.area = 20.0
            self.sectionModulus = 140.0
            self.I = 1480.0
            self.webThickness = 0.430
            self.bf = 8.270
            self.tf = 0.685
            self.h = 18.25
            self.rt = 2.12
            
        }else if selectedRow == 109{
            self.shapeSelected = true
            self.shape = "W21x73"
            self.depth = 21.24
            self.width = 8.295
            self.area = 21.5
            self.sectionModulus = 151.0
            self.I = 1600.0
            self.webThickness = 0.455
            self.bf = 8.295
            self.tf = 0.740
            self.h = 18.25
            self.rt = 2.13
            
        }else if selectedRow == 110{
            self.shapeSelected = true
            self.shape = "W21x83"
            self.depth = 21.43
            self.width = 8.355
            self.area = 24.3
            self.sectionModulus = 171.0
            self.I = 1830.0
            self.webThickness = 0.515
            self.bf = 8.355
            self.tf = 0.835
            self.h = 18.25
            self.rt = 2.15
            
        }else if selectedRow == 111{
            self.shapeSelected = true
            self.shape = "W21x93"
            self.depth = 21.62
            self.width = 8.420
            self.area = 27.30
            self.sectionModulus = 192.0
            self.I = 2070.0
            self.webThickness = 0.580
            self.bf = 8.420
            self.tf = 0.930
            self.h = 18.25
            self.rt = 2.17
            ////////////////////
        }else if selectedRow == 112{
            self.shapeSelected = true
            self.shape = "W21x101"
            self.depth = 21.36
            self.width = 12.290
            self.area = 29.80
            self.sectionModulus = 192.0
            self.I = 2070.0
            self.webThickness = 0.500
            self.bf = 12.290
            self.tf = 0.800
            self.h = 18.25
            self.rt = 3.27
            
        }else if selectedRow == 113{
            self.shapeSelected = true
            self.shape = "W21x111"
            self.depth = 21.51
            self.width = 12.340
            self.area = 32.70
            self.sectionModulus = 192.0
            self.I = 2070.0
            self.webThickness = 0.550
            self.bf = 12.340
            self.tf = 0.875
            self.h = 18.25
            self.rt = 3.28
            
        }else if selectedRow == 114{
            self.shapeSelected = true
            self.shape = "W21x122"
            self.depth = 21.68
            self.width = 12.390
            self.area = 35.90
            self.sectionModulus = 192.0
            self.I = 2070.0
            self.webThickness = 0.600
            self.bf = 12.390
            self.tf = 0.960
            self.h = 18.25
            self.rt = 3.30
            
        }else if selectedRow == 115{
            self.shapeSelected = true
            self.shape = "W21x132"
            self.depth = 21.83
            self.width = 12.440
            self.area = 38.80
            self.sectionModulus = 192.0
            self.I = 2070.0
            self.webThickness = 0.650
            self.bf = 12.440
            self.tf = 1.035
            self.h = 18.25
            self.rt = 3.31
            
        }else if selectedRow == 116{
            self.shapeSelected = true
            self.shape = "W21x147"
            self.depth = 22.06
            self.width = 12.510
            self.area = 43.20
            self.sectionModulus = 329.0
            self.I = 3630.0
            self.webThickness = 0.720
            self.bf = 12.510
            self.tf = 1.150
            self.h = 18.25
            self.rt = 3.34
            
        }else if selectedRow == 117{
            self.shapeSelected = true
            self.shape = "W21x166"
            self.depth = 22.48
            self.width = 12.420
            self.area = 48.80
            self.sectionModulus = 380.0
            self.I = 4280.0
            self.webThickness = 0.750
            self.bf = 12.420
            self.tf = 1.36
            self.h = 18.25
            self.rt = 3.34
            
        }else if selectedRow == 118{
            self.shapeSelected = true
            self.shape = "W24x55"
            self.depth = 23.57
            self.width = 7.005
            self.area = 16.20
            self.sectionModulus = 114.0
            self.I = 1350.0
            self.webThickness = 0.395
            self.bf = 7.005
            self.tf = 0.505
            self.h = 21
            self.rt = 1.68
            
        }else if selectedRow == 119{
            self.shapeSelected = true
            self.shape = "W24x62"
            self.depth = 23.74
            self.width = 7.040
            self.area = 18.20
            self.sectionModulus = 131.00
            self.I = 1550.0
            self.webThickness = 0.430
            self.bf = 7.040
            self.tf = 0.590
            self.h = 21
            self.rt = 1.71
            ////////
        }else if selectedRow == 120{
            self.shapeSelected = true
            self.shape = "W24x68"
            self.depth = 23.73
            self.width = 8.965
            self.area = 20.1
            self.sectionModulus = 154.0
            self.I = 1830.0
            self.webThickness = 0.415
            self.bf = 8.965
            self.tf = 0.585
            self.h = 21
            self.rt = 2.26
            
        }else if selectedRow == 121{
            self.shapeSelected = true
            self.shape = "W24x76"
            self.depth = 23.92
            self.width = 8.990
            self.area = 22.40
            self.sectionModulus = 176.0
            self.I = 2100.0
            self.webThickness = 0.440
            self.bf = 8.990
            self.tf = 0.680
            self.h = 21
            self.rt = 2.29
            
        }else if selectedRow == 122{
            self.shapeSelected = true
            self.shape = "W24x84"
            self.depth = 24.10
            self.width = 9.020
            self.area = 24.70
            self.sectionModulus = 196.0
            self.I = 2370.0
            self.webThickness = 0.470
            self.bf = 9.020
            self.tf = 0.770
            self.h = 21
            self.rt = 2.31
            
        }else if selectedRow == 123{
            self.shapeSelected = true
            self.shape = "W24x94"
            self.depth = 24.31
            self.width = 9.065
            self.area = 27.70
            self.sectionModulus = 222.0
            self.I = 2700.0
            self.webThickness = 0.515
            self.bf = 9.065
            self.tf = 0.875
            self.h = 21
            self.rt = 2.33
            
        }else if selectedRow == 124{
            self.shapeSelected = true
            self.shape = "W24x103"
            self.depth = 24.53
            self.width = 9.000
            self.area = 30.3
            self.sectionModulus = 245.0
            self.I = 3000.0
            self.webThickness = 0.550
            self.bf = 9.000
            self.tf = 0.980
            self.h = 21
            self.rt = 2.33
            //////
        }else if selectedRow == 125{
            self.shapeSelected = true
            self.shape = "W24x104"
            self.depth = 24.06
            self.width = 12.75
            self.area = 30.60
            self.sectionModulus = 258.0
            self.I = 3100.0
            self.webThickness = 0.500
            self.bf = 12.750
            self.tf = 0.750
            self.h = 21
            self.rt = 3.35
            
        }else if selectedRow == 126{
            self.shapeSelected = true
            self.shape = "W24x117"
            self.depth = 24.26
            self.width = 12.80
            self.area = 34.40
            self.sectionModulus = 291.0
            self.I = 3540.0
            self.webThickness = 0.550
            self.bf = 12.80
            self.tf = 0.850
            self.h = 21
            self.rt = 3.37
            
        }else if selectedRow == 127{
            self.shapeSelected = true
            self.shape = "W24x131"
            self.depth = 24.48
            self.width = 12.855
            self.area = 38.50
            self.sectionModulus = 329.0
            self.I = 4020.0
            self.webThickness = 0.605
            self.bf = 9.000
            self.tf = 0.960
            self.h = 21
            self.rt = 3.40
            
        }else if selectedRow == 128{
            self.shapeSelected = true
            self.shape = "W24x146"
            self.depth = 24.70
            self.width = 12.90
            self.area = 43.0
            self.sectionModulus = 371.0
            self.I = 4580.0
            self.webThickness = 0.650
            self.bf = 12.90
            self.tf = 1.090
            self.h = 21
            self.rt = 3.43
            
        }else if selectedRow == 129{
            self.shapeSelected = true
            self.shape = "W24x162"
            self.depth = 25.00
            self.width = 12.955
            self.area = 47.70
            self.sectionModulus = 414.0
            self.I = 5170.0
            self.webThickness = 0.705
            self.bf = 12.955
            self.tf = 1.220
            self.h = 21
            self.rt = 3.45
            
        }else if selectedRow == 130{
            self.shapeSelected = true
            self.shape = "W24x176"
            self.depth = 25.24
            self.width = 12.890
            self.area = 51.70
            self.sectionModulus = 450.0
            self.I = 5680.0
            self.webThickness = 0.750
            self.bf = 12.890
            self.tf = 1.340
            self.h = 21
            self.rt = 3.44
            
        }else if selectedRow == 131{
            self.shapeSelected = true
            self.shape = "W27x84"
            self.depth = 26.71
            self.width = 9.960
            self.area = 24.80
            self.sectionModulus = 213.0
            self.I = 2850.0
            self.webThickness = 0.460
            self.bf = 9.960
            self.tf = 0.640
            self.h = 24
            self.rt = 2.49
            
        }else if selectedRow == 132{
            self.shapeSelected = true
            self.shape = "W27x94"
            self.depth = 26.92
            self.width = 9.990
            self.area = 27.70
            self.sectionModulus = 243.0
            self.I = 3270.0
            self.webThickness = 0.490
            self.bf = 9.990
            self.tf = 0.745
            self.h = 24
            self.rt = 2.53
            
        }else if selectedRow == 133{
            self.shapeSelected = true
            self.shape = "W27x102"
            self.depth = 27.09
            self.width = 10.015
            self.area = 30.0
            self.sectionModulus = 267.0
            self.I = 3620.0
            self.webThickness = 0.515
            self.bf = 10.015
            self.tf = 0.830
            self.h = 24
            self.rt = 2.56
            
        }else if selectedRow == 134{
            self.shapeSelected = true
            self.shape = "W27x114"
            self.depth = 27.29
            self.width = 10.070
            self.area = 33.50
            self.sectionModulus = 299.0
            self.I = 4090.0
            self.webThickness = 0.570
            self.bf = 10.070
            self.tf = 0.930
            self.h = 24
            self.rt = 2.58
            
        }else if selectedRow == 135{
            self.shapeSelected = true
            self.shape = "W27x129"
            self.depth = 27.63
            self.width = 10.010
            self.area = 37.80
            self.sectionModulus = 345.0
            self.I = 4760.0
            self.webThickness = 0.610
            self.bf = 10.010
            self.tf = 1.100
            self.h = 24
            self.rt = 2.59
            
        }else if selectedRow == 136{
            self.shapeSelected = true
            self.shape = "W27x146"
            self.depth = 27.38
            self.width = 13.965
            self.area = 42.90
            self.sectionModulus = 411.0
            self.I = 5630.0
            self.webThickness = 0.605
            self.bf = 13.965
            self.tf = 0.975
            self.h = 24
            self.rt = 3.68
            
        }else if selectedRow == 137{
            self.shapeSelected = true
            self.shape = "W27x161"
            self.depth = 27.59
            self.width = 14.020
            self.area = 47.40
            self.sectionModulus = 455.0
            self.I = 6280.0
            self.webThickness = 0.660
            self.bf = 14.020
            self.tf = 1.080
            self.h = 24
            self.rt = 3.70
            
        }else if selectedRow == 138{
            self.shapeSelected = true
            self.shape = "W27x178"
            self.depth = 27.81
            self.width = 14.085
            self.area = 52.30
            self.sectionModulus = 502.0
            self.I = 6990.0
            self.webThickness = 0.725
            self.bf = 14.085
            self.tf = 1.190
            self.h = 24
            self.rt = 3.72
            
        }else if selectedRow == 139{
            self.shapeSelected = true
            self.shape = "W27x194"
            self.depth = 28.11
            self.width = 14.035
            self.area = 57.0
            self.sectionModulus = 556.0
            self.I = 7820.0
            self.webThickness = 0.750
            self.bf = 14.035
            self.tf = 1.340
            self.h = 24
            self.rt = 3.74
            
        }else if selectedRow == 140{
            self.shapeSelected = true
            self.shape = "W27x217"
            self.depth = 28.43
            self.width = 14.115
            self.area = 63.80
            self.sectionModulus = 624.0
            self.I = 8870.0
            self.webThickness = 0.830
            self.bf = 14.115
            self.tf = 1.500
            self.h = 24
            self.rt = 3.76
            
        }
        
        
        
        self.vArea = self.depth * self.webThickness
    }
    
    
    //MARK: NSCoding Conformance
    required init?(coder aDecoder: NSCoder) {
        super.init()
        
        shape = aDecoder.decodeObject(forKey: "shape") as! NSString
        depth = aDecoder.decodeDouble(forKey: "depth")
        width = aDecoder.decodeDouble(forKey: "width")
        area = aDecoder.decodeDouble(forKey: "area")
        sectionModulus = aDecoder.decodeDouble(forKey: "sectionModulus")
        I = aDecoder.decodeDouble(forKey: "I")
        vArea = aDecoder.decodeDouble(forKey: "vArea")
        selectedShapeIndex = aDecoder.decodeInteger(forKey: "selectedShapeIndex")
        
        webThickness = aDecoder.decodeDouble(forKey: "webThickness")
        bf = aDecoder.decodeDouble(forKey: "bf")
        tf = aDecoder.decodeDouble(forKey: "tf")
        h = aDecoder.decodeDouble(forKey: "h")
        rt = aDecoder.decodeDouble(forKey: "rt")
        
    }
    
    
    func encodeWithCoder(_ aCoder: NSCoder) {
        aCoder.encode(shape, forKey: "shape")
        aCoder.encode(depth, forKey: "depth")
        aCoder.encode(width, forKey: "width")
        aCoder.encode(area, forKey: "area")
        aCoder.encode(sectionModulus, forKey: "sectionModulus")
        aCoder.encode(I, forKey: "I")
        aCoder.encode(vArea, forKey: "vArea")
        
        aCoder.encode(webThickness, forKey: "webThickness")
        aCoder.encode(bf, forKey: "bf")
        aCoder.encode(tf, forKey: "tf")
        aCoder.encode(h, forKey: "h")
        aCoder.encode(rt, forKey: "rt")
        
    }
    
    
}//end class
