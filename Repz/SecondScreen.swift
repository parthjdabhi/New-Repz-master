//
//  SecondScreen.swift
//  Repz
//
//  Created by Dustin Allen on 8/14/16.
//  Copyright © 2016 Harloch. All rights reserved.
//

import Foundation
import UIKit


class SecondScreen: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UINavigationControllerDelegate {
    
    let manager = IconManager.sharedManager()
    let kBaseTag = 1001
    // Below Half
    let CY:CGFloat = 650 //+ 64 //683
    
    var startPos:CGPoint = CGPointZero
    var endPos:CGPoint = CGPointZero
    var iconName:String = ""
    var iconCount:Int = 0
    var pickerDataSource:[String] = [];
    var squarePlayerIndex:Int = 0
    
    enum LayoutType {
        case LayoutType_1
        case LayoutType_2
    }
    
    var deltaBoolFirst:Bool = true
    var deltaBoolSecond:Bool = true
    var iconPosArr:[CGPoint]!
    
    var iconRandomCircleArr_1:[CGPoint]!
    var iconRandomCircleArr_2:[CGPoint]!
    var iconRandomCrossArr_1:[CGPoint]!
    var iconRandomCrossArr_2:[CGPoint]!
    
    var iconPosDeffencePass:[CGPoint]!
    var iconPosDeffenceRun:[CGPoint]!
    var iconSquareDeffenceRun:[CGPoint]!
    var iconSquareDeffencePass:[CGPoint]!
    
    var iconPosOffence3x4:[CGPoint]!
    var iconPosOffence4x3:[CGPoint]!
    
    var iconLeftHashOffence3x4:[CGPoint]!
    var iconLeftHashOffence4x3:[CGPoint]!
    var iconRightHashOffence3x4:[CGPoint]!
    var iconRightHashOffence4x3:[CGPoint]!
    
    var iconLeftHashDeffencePass:[CGPoint]!
    var iconLeftHashDeffenceRun:[CGPoint]!
    var iconRightHashDeffencePass:[CGPoint]!
    var iconRightHashDeffenceRun:[CGPoint]!
    var iconSquareRightDeffencePass:[CGPoint]!
    var iconSquareRightDeffenceRun:[CGPoint]!
    var iconSquareLeftDeffencePass:[CGPoint]!
    var iconSquareLeftDeffenceRun: [CGPoint]!
    
    var iconCenterResetOffense:[CGPoint]!
    var iconCenterResetDefense:[CGPoint]!
    
    var iconComingOutCircle:[CGPoint]!
    var iconComingOutCross:[CGPoint]!
    var iconGoingInCircle:[CGPoint]!
    var iconGoingInCross:[CGPoint]!
    var iconRedZoneCircle:[CGPoint]!
    var iconRedZoneCross:[CGPoint]!
    var iconGoalLineCircle:[CGPoint]!
    var iconGoalLineCross:[CGPoint]!
    
    var iconComingOutCircleLeft:[CGPoint]!
    var iconComingOutCrossLeft: [CGPoint]!
    var iconComingOutCircleRight: [CGPoint]!
    var iconComingOutCrossRight: [CGPoint]!
    var iconGoingInCircleLeft: [CGPoint]!
    var iconGoingInCrossLeft: [CGPoint]!
    var iconGoingInCircleRight: [CGPoint]!
    var iconGoingInCrossRight: [CGPoint]!
    var iconRedZoneCircleLeft: [CGPoint]!
    var iconRedZoneCrossLeft: [CGPoint]!
    var iconRedZoneCircleRight: [CGPoint]!
    var iconRedZoneCrossRight: [CGPoint]!
    var iconGoalLineCircleLeft: [CGPoint]!
    var iconGoalLineCrossLeft: [CGPoint]!
    var iconGoalLineCircleRight: [CGPoint]!
    var iconGoalLineCrossRight: [CGPoint]!
    
    var icon3x4ComingOut: [CGPoint]!
    var icon3x4GoingIn: [CGPoint]!
    var icon3x4RedZone: [CGPoint]!
    var icon3x4GoalLine: [CGPoint]!
    var icon4x3ComingOut: [CGPoint]!
    var icon4x3GoingIn: [CGPoint]!
    var icon4x3RedZone: [CGPoint]!
    var icon4x3GoalLine: [CGPoint]!
    var iconRunComingOut: [CGPoint]!
    var iconRunGoingIn: [CGPoint]!
    var iconRunRedZone: [CGPoint]!
    var iconRunGoalLine: [CGPoint]!
    var iconPassComingOut: [CGPoint]!
    var iconPassGoingIn: [CGPoint]!
    var iconPassRedZone: [CGPoint]!
    var iconPassGoalLine: [CGPoint]!
    
    var icon3x4ComingOutLeft: [CGPoint]!
    var icon3x4GoingInLeft: [CGPoint]!
    var icon3x4RedZoneLeft: [CGPoint]!
    var icon3x4GoalLineLeft: [CGPoint]!
    var icon4x3ComingOutLeft: [CGPoint]!
    var icon4x3GoingInLeft: [CGPoint]!
    var icon4x3RedZoneLeft: [CGPoint]!
    var icon4x3GoalLineLeft: [CGPoint]!
    var iconRunComingOutLeft: [CGPoint]!
    var iconRunGoingInLeft: [CGPoint]!
    var iconRunRedZoneLeft: [CGPoint]!
    var iconRunGoalLineLeft: [CGPoint]!
    var iconPassComingOutLeft: [CGPoint]!
    var iconPassGoingInLeft: [CGPoint]!
    var iconPassRedZoneLeft: [CGPoint]!
    var iconPassGoalLineLeft: [CGPoint]!
    
    var icon3x4ComingOutRight: [CGPoint]!
    var icon3x4GoingInRight: [CGPoint]!
    var icon3x4RedZoneRight: [CGPoint]!
    var icon3x4GoalLineRight: [CGPoint]!
    var icon4x3ComingOutRight: [CGPoint]!
    var icon4x3GoingInRight: [CGPoint]!
    var icon4x3RedZoneRight: [CGPoint]!
    var icon4x3GoalLineRight: [CGPoint]!
    var iconRunComingOutRight: [CGPoint]!
    var iconRunGoingInRight: [CGPoint]!
    var iconRunRedZoneRight: [CGPoint]!
    var iconRunGoalLineRight: [CGPoint]!
    var iconPassComingOutRight: [CGPoint]!
    var iconPassGoingInRight: [CGPoint]!
    var iconPassRedZoneRight: [CGPoint]!
    var iconPassGoalLineRight: [CGPoint]!
    
    var iconGoingInSquare: [CGPoint]!
    
    var isLayoutSaving:Bool = false
    var shapeLayer:CAShapeLayer = CAShapeLayer()

    var iconType:IconType!
    var iconTypeSquare:IconType!
    
    var iconCrossInitalPosArr:NSMutableArray = NSMutableArray()
    var iconCircleInitalPosArr:NSMutableArray = NSMutableArray()
    var buttonIndicator = false
    var buttonIndicator1 = false
    var buttonIndicator2 = false
    var buttonIndicator3 = false
    var layoutOption1 = false
    var layoutOption2 = false
    var multipleLayoutOption1 = false
    var centerSide = false
    var leftSide = false
    var rightSide = false
    
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet var nameField: UITextField!
    @IBOutlet weak var layoutName: UITextField!
    
    @IBOutlet var cover2: UIButton!
    @IBOutlet var cover3: UIButton!
    
    @IBOutlet var btnDefencePass: UIButton!
    @IBOutlet var btnDefenceRun: UIButton!
    @IBOutlet var btnOffence3x4: UIButton!
    @IBOutlet var btnOffence4x3: UIButton!
    
    @IBOutlet var downNumber: UILabel!
    @IBOutlet var slider: UISlider!
    @IBOutlet var btnCornerback: UIButton!
    @IBOutlet var btnBlitzer: UIButton!
    @IBOutlet var comingOut: UISlider!
    @IBOutlet var comingOutLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // MARK: - To Save This Play Mode
        IconManager.isWantToSaveThisMode  = true
        
        iconType = IconType.Cross
        iconTypeSquare = IconType.Square
        nameField.text = iconName
        let screenSize = UIScreen.mainScreen().bounds.size
        //it's array1 to store postion of all icons
//        iconPosArr = [CGPointMake(screenSize.width * 0.445312, self.view.frame.size.height * 0.072266),//0
//                      CGPointMake(screenSize.width * 0.628906, self.view.frame.size.height * 0.472070),//1
//                      CGPointMake(screenSize.width * 0.476562, self.view.frame.size.height * 0.451563),//2
//                      CGPointMake(screenSize.width * 0.332899, self.view.frame.size.height * 0.630273),//3
//                      CGPointMake(screenSize.width * 0.169010, self.view.frame.size.height * 0.322656),//4
//                      CGPointMake(screenSize.width * 0.196701, self.view.frame.size.height * 0.486719),//5
//                      CGPointMake(screenSize.width * 0.224219, self.view.frame.size.height * 0.444727),//6
//                      CGPointMake(screenSize.width * 0.324653, self.view.frame.size.height * 0.487695),//7
//                      CGPointMake(screenSize.width * 0.443056, self.view.frame.size.height * 0.364583),//8
//                      CGPointMake(screenSize.width * 0.031250, self.view.frame.size.height * 0.450195),//9
//                      CGPointMake(screenSize.width * 20.098958, self.view.frame.size.height * 20.885742),
//                      CGPointMake(screenSize.width * 0.125347, self.view.frame.size.height * 0.575195),//10
//                      CGPointMake(screenSize.width * 0.597656, self.view.frame.size.height * 0.358398),//11
//                      CGPointMake(screenSize.width * 0.446615, self.view.frame.size.height * 0.488672),//12
//                      CGPointMake(screenSize.width * 0.352865, self.view.frame.size.height * 0.446680),//13
//                      CGPointMake(screenSize.width * 0.461892, self.view.frame.size.height * 0.677148),//14
//                      CGPointMake(screenSize.width * 0.292795, self.view.frame.size.height * 0.446680),//15
//                      CGPointMake(screenSize.width * 0.261719, self.view.frame.size.height * 0.488672),//16
//                      CGPointMake(screenSize.width * 0.190451, self.view.frame.size.height * 0.082422),//17
//                      CGPointMake(screenSize.width * 0.508767, self.view.frame.size.height * 0.489583),//18
//                      CGPointMake(screenSize.width * 0.000434, self.view.frame.size.height * 0.365625),//19
//                      CGPointMake(screenSize.width * 0.385417, self.view.frame.size.height * 0.488932),//20
//                      CGPointMake(screenSize.width * 0.321788, self.view.frame.size.height * 0.372721),//21
//        ]
        
        //For Set Default Value Generating Cover3 Mode
        iconPosArr = [CGPointMake(240,635),//0
            CGPointMake(300,635),//1
            CGPointMake(360,635),//2
            CGPointMake(420,635),//3
            CGPointMake(60,635),//4
            CGPointMake(200,570),//5
            CGPointMake(335,570),//6
            CGPointMake(470,570),//7
            CGPointMake(400,470),//8
            CGPointMake(580,635),//9
            //CGPointMake(48,506),
            CGPointMake(280,470),//10
            CGPointMake(60,CY+40),//11
            CGPointMake(180,CY+40),//12
            CGPointMake(230,CY+25),//13
            CGPointMake(280,CY+25),//14
            CGPointMake(330,CY+25),//15
            CGPointMake(380,CY+25),//16
            CGPointMake(430,CY+25),//17
            CGPointMake(480,CY+40),//18
            CGPointMake(580,CY+25),//19
            CGPointMake(278,CY+100),//20
            CGPointMake(330,CY+100),//21
         ]
        
        iconGoingInCross = [
            CGPointMake(240,750),//0
            CGPointMake(300,750),//1
            CGPointMake(360,750),//2
            CGPointMake(420,750),//3
            CGPointMake(60,750),//4
            CGPointMake(200,690),//5
            CGPointMake(335,690),//6
            CGPointMake(470,690),//7
            CGPointMake(400,690),//8
            CGPointMake(580,750),//9
            CGPointMake(280,690),//10
        ]
        
        /*iconGoingInSquare = [
            CGPointMake(330,785),//15
        ]*/
        
        iconGoingInCircle = [
            CGPointMake(60,785),//11
            CGPointMake(180,800),//12
            CGPointMake(230,785),//13
            CGPointMake(280,785),//14
            CGPointMake(330,785),//15
            CGPointMake(380,785),//16
            CGPointMake(430,785),//17
            CGPointMake(480,800),//18
            CGPointMake(580,785),//19
            CGPointMake(280,850),//20
            CGPointMake(330,850),//21
        ]
        
        iconGoingInCircleLeft = [
            CGPointMake(60,785),//11
            CGPointMake(150,800),//12
            CGPointMake(200,785),//13
            CGPointMake(250,785),//14
            CGPointMake(300,785),//15
            CGPointMake(350,785),//16
            CGPointMake(400,785),//17
            CGPointMake(450,800),//18
            CGPointMake(550,785),//19
            CGPointMake(250,850),//20
            CGPointMake(300,850),//21
        ]
        
        iconGoingInCrossLeft = [
            CGPointMake(210,750),//0
            CGPointMake(270,750),//1
            CGPointMake(330,750),//2
            CGPointMake(390,750),//3
            CGPointMake(60,750),//4
            CGPointMake(170,690),//5
            CGPointMake(305,690),//6
            CGPointMake(440,690),//7
            CGPointMake(370,690),//8
            CGPointMake(580,750),//9
            CGPointMake(250,690),//10
        ]
        
        iconGoingInCircleRight = [
            CGPointMake(60,785),//11
            CGPointMake(210,800),//12
            CGPointMake(260,785),//13
            CGPointMake(310,785),//14
            CGPointMake(360,785),//15
            CGPointMake(410,785),//16
            CGPointMake(460,785),//17
            CGPointMake(510,800),//18
            CGPointMake(580,785),//19
            CGPointMake(410,850),//20
            CGPointMake(360,850),//21
        ]
        
        iconGoingInCrossRight = [
            CGPointMake(240,750),//0
            CGPointMake(300,750),//1
            CGPointMake(360,750),//2
            CGPointMake(420,750),//3
            CGPointMake(60,750),//4
            CGPointMake(200,690),//5
            CGPointMake(335,690),//6
            CGPointMake(470,690),//7
            CGPointMake(400,690),//8
            CGPointMake(580,750),//9
            CGPointMake(280,690),//10
        ]
        
        iconComingOutCross = [
            CGPointMake(300,950),//0
            CGPointMake(360,950),//1
            CGPointMake(420,950),//2
            CGPointMake(480,950),//3
            CGPointMake(60,950),//4
            CGPointMake(260,890),//5
            CGPointMake(385,890),//6
            CGPointMake(530,890),//7
            CGPointMake(460,890),//8
            CGPointMake(580,950),//9
            //CGPointMake(48,506),
            CGPointMake(340,890),//10
        ]
        
        iconComingOutCircle = [
            CGPointMake(60,985),//11
            CGPointMake(180,1000),//12
            CGPointMake(230,985),//13
            CGPointMake(280,985),//14
            CGPointMake(330,985),//15
            CGPointMake(380,985),//16
            CGPointMake(430,985),//17
            CGPointMake(480,1000),//18
            CGPointMake(580,985),//19
            CGPointMake(278,1050),//20
            CGPointMake(330,1050),//21
        ]
        
        iconPassComingOut = [
            CGPointMake(75, 985),
            CGPointMake(113, 1000),
            CGPointMake(230, 985),
            CGPointMake(280, 985),
            CGPointMake(330, 985),
            CGPointMake(380, 985),
            CGPointMake(430, 985),
            CGPointMake(545, 1000),
            CGPointMake(610, 985),
            CGPointMake(280, 1050),
            CGPointMake(330, 1050),
        ]
        
        iconPassComingOutLeft = [
            CGPointMake(75, 985),
            CGPointMake(113, 1000),
            CGPointMake(200, 985),
            CGPointMake(250, 985),
            CGPointMake(300, 985),
            CGPointMake(350, 985),
            CGPointMake(400, 985),
            CGPointMake(545, 1000),
            CGPointMake(610, 985),
            CGPointMake(250, 1050),
            CGPointMake(300, 1050),
        ]
        
        iconPassComingOutRight = [
            CGPointMake(75, 985),
            CGPointMake(113, 1000),
            CGPointMake(260, 985),
            CGPointMake(310, 985),
            CGPointMake(360, 985),
            CGPointMake(410, 985),
            CGPointMake(460, 985),
            CGPointMake(545, 1000),
            CGPointMake(610, 985),
            CGPointMake(310, 1050),
            CGPointMake(360, 1050),
        ]
        
        iconRunComingOut = [
            CGPointMake(75, 985),
            CGPointMake(235, 985),
            CGPointMake(270, 985),
            CGPointMake(305, 985),
            CGPointMake(340, 985),
            CGPointMake(375, 985),
            CGPointMake(410, 985),
            CGPointMake(445, 985),
            CGPointMake(340, 1035),
            CGPointMake(580, 985),
            CGPointMake(340, 1085),
        ]
        
        iconRunComingOutLeft = [
            CGPointMake(75, 985),
            CGPointMake(205, 985),
            CGPointMake(240, 985),
            CGPointMake(275, 985),
            CGPointMake(310, 985),
            CGPointMake(345, 985),
            CGPointMake(380, 985),
            CGPointMake(415, 985),
            CGPointMake(310, 1035),
            CGPointMake(580, 985),
            CGPointMake(310, 1085),
        ]
        
        iconRunComingOutRight = [
            CGPointMake(75, 985),
            CGPointMake(265, 985),
            CGPointMake(300, 985),
            CGPointMake(335, 985),
            CGPointMake(370, 985),
            CGPointMake(405, 985),
            CGPointMake(440, 985),
            CGPointMake(475, 985),
            CGPointMake(370, 1035),
            CGPointMake(580, 985),
            CGPointMake(370, 1085),
        ]
        
        iconPassGoingIn = [
            CGPointMake(75, 785),
            CGPointMake(113, 800),
            CGPointMake(230, 785),
            CGPointMake(280, 785),
            CGPointMake(330, 785),
            CGPointMake(380, 785),
            CGPointMake(430, 785),
            CGPointMake(545, 800),
            CGPointMake(610, 785),
            CGPointMake(280, 850),
            CGPointMake(330, 850),
        ]
        
        iconPassGoingInLeft = [
            CGPointMake(75, 785),
            CGPointMake(113, 800),
            CGPointMake(200, 785),
            CGPointMake(250, 785),
            CGPointMake(300, 785),
            CGPointMake(350, 785),
            CGPointMake(400, 785),
            CGPointMake(545, 800),
            CGPointMake(580, 785),
            CGPointMake(250, 850),
            CGPointMake(300, 850),
        ]
        
        iconPassGoingInRight = [
            CGPointMake(75, 785),
            CGPointMake(113, 800),
            CGPointMake(260, 785),
            CGPointMake(310, 785),
            CGPointMake(360, 785),
            CGPointMake(410, 785),
            CGPointMake(460, 785),
            CGPointMake(545, 800),
            CGPointMake(580, 785),
            CGPointMake(310, 850),
            CGPointMake(360, 850),
        ]
        
        iconRunGoingIn = [
            CGPointMake(75, 785),
            CGPointMake(235, 785),
            CGPointMake(270, 785),
            CGPointMake(305, 785),
            CGPointMake(340, 785),
            CGPointMake(375, 785),
            CGPointMake(410, 785),
            CGPointMake(445, 785),
            CGPointMake(340, 835),
            CGPointMake(580, 785),
            CGPointMake(340, 885)
        ]
        
        iconRunGoingInLeft = [
            CGPointMake(75, 785),
            CGPointMake(205, 785),
            CGPointMake(240, 785),
            CGPointMake(275, 785),
            CGPointMake(310, 785),
            CGPointMake(345, 785),
            CGPointMake(380, 785),
            CGPointMake(415, 785),
            CGPointMake(310, 835),
            CGPointMake(580, 785),
            CGPointMake(310, 885)
        ]
        
        iconRunGoingInRight = [
            CGPointMake(75, 785),
            CGPointMake(265, 785),
            CGPointMake(300, 785),
            CGPointMake(335, 785),
            CGPointMake(370, 785),
            CGPointMake(405, 785),
            CGPointMake(440, 785),
            CGPointMake(475, 785),
            CGPointMake(370, 835),
            CGPointMake(580, 785),
            CGPointMake(370, 885)
        ]
        
        iconPassRedZone = [
            CGPointMake(75, 385),
            CGPointMake(113, 400),
            CGPointMake(230, 385),
            CGPointMake(280, 385),
            CGPointMake(330, 385),
            CGPointMake(380, 385),
            CGPointMake(430, 385),
            CGPointMake(545, 400),
            CGPointMake(610, 385),
            CGPointMake(280, 450),
            CGPointMake(330, 450)
        ]
        
        iconPassRedZoneLeft = [
            CGPointMake(75, 385),
            CGPointMake(113, 400),
            CGPointMake(200, 385),
            CGPointMake(250, 385),
            CGPointMake(300, 385),
            CGPointMake(350, 385),
            CGPointMake(400, 385),
            CGPointMake(545, 400),
            CGPointMake(610, 385),
            CGPointMake(250, 450),
            CGPointMake(300, 450)
        ]
        
        iconPassRedZoneRight = [
            CGPointMake(75, 385),
            CGPointMake(113, 400),
            CGPointMake(260, 385),
            CGPointMake(310, 385),
            CGPointMake(360, 385),
            CGPointMake(410, 385),
            CGPointMake(460, 385),
            CGPointMake(545, 400),
            CGPointMake(610, 385),
            CGPointMake(310, 450),
            CGPointMake(360, 450)
        ]
        
        iconRunRedZone = [
            CGPointMake(75, 385),
            CGPointMake(235, 385),
            CGPointMake(270, 385),
            CGPointMake(305, 385),
            CGPointMake(340, 385),
            CGPointMake(375, 385),
            CGPointMake(410, 385),
            CGPointMake(445, 385),
            CGPointMake(340, 435),
            CGPointMake(580, 385),
            CGPointMake(340, 485)
        ]
        
        iconRunRedZoneLeft = [
            CGPointMake(75, 385),
            CGPointMake(205, 385),
            CGPointMake(240, 385),
            CGPointMake(275, 385),
            CGPointMake(310, 385),
            CGPointMake(345, 385),
            CGPointMake(370, 385),
            CGPointMake(415, 385),
            CGPointMake(310, 435),
            CGPointMake(580, 385),
            CGPointMake(310, 485)
        ]
        
        iconRunRedZoneRight = [
            CGPointMake(75, 385),
            CGPointMake(265, 385),
            CGPointMake(300, 385),
            CGPointMake(335, 385),
            CGPointMake(370, 385),
            CGPointMake(405, 385),
            CGPointMake(440, 385),
            CGPointMake(475, 385),
            CGPointMake(370, 435),
            CGPointMake(580, 385),
            CGPointMake(370, 485)
        ]
        
        iconPassGoalLine = [
            CGPointMake(75, 285),
            CGPointMake(113, 300),
            CGPointMake(230, 285),
            CGPointMake(280, 285),
            CGPointMake(330, 285),
            CGPointMake(380, 285),
            CGPointMake(430, 285),
            CGPointMake(545, 300),
            CGPointMake(610, 285),
            CGPointMake(280, 350),
            CGPointMake(330, 350)
        ]
        
        iconPassGoalLineLeft = [
            CGPointMake(75, 285),
            CGPointMake(113, 300),
            CGPointMake(200, 285),
            CGPointMake(250, 285),
            CGPointMake(300, 285),
            CGPointMake(350, 285),
            CGPointMake(400, 285),
            CGPointMake(545, 300),
            CGPointMake(610, 285),
            CGPointMake(250, 350),
            CGPointMake(300, 350)
        ]
        
        iconPassGoalLineRight = [
            CGPointMake(75, 285),
            CGPointMake(113, 300),
            CGPointMake(260, 285),
            CGPointMake(310, 285),
            CGPointMake(360, 285),
            CGPointMake(410, 285),
            CGPointMake(460, 285),
            CGPointMake(545, 300),
            CGPointMake(610, 285),
            CGPointMake(310, 350),
            CGPointMake(340, 350)
        ]
        
        iconRunGoalLine = [
            CGPointMake(75, 285),
            CGPointMake(235, 285),
            CGPointMake(270, 285),
            CGPointMake(305, 285),
            CGPointMake(340, 285),
            CGPointMake(375, 285),
            CGPointMake(410, 285),
            CGPointMake(445, 285),
            CGPointMake(340, 335),
            CGPointMake(580, 285),
            CGPointMake(340, 385)
        ]
        
        iconRunGoalLineLeft = [
            CGPointMake(75, 285),
            CGPointMake(205, 285),
            CGPointMake(240, 285),
            CGPointMake(275, 285),
            CGPointMake(310, 285),
            CGPointMake(345, 285),
            CGPointMake(380, 285),
            CGPointMake(415, 285),
            CGPointMake(310, 335),
            CGPointMake(580, 285),
            CGPointMake(310, 385)
        ]
        
        iconRunGoalLineRight = [
            CGPointMake(75, 285),
            CGPointMake(265, 285),
            CGPointMake(300, 285),
            CGPointMake(335, 285),
            CGPointMake(370, 285),
            CGPointMake(405, 285),
            CGPointMake(440, 285),
            CGPointMake(475, 285),
            CGPointMake(370, 335),
            CGPointMake(580, 285),
            CGPointMake(370, 385)
        ]
        
        icon3x4ComingOut = [
            CGPointMake(75, 950),
            CGPointMake(255, 950),
            CGPointMake(330, 950),
            CGPointMake(410, 950),
            CGPointMake(575, 950),
            CGPointMake(205, 885),
            CGPointMake(290, 885),
            CGPointMake(375, 885),
            CGPointMake(460, 885),
            CGPointMake(268, 785),
            CGPointMake(420, 785)
        ]
        
        icon3x4ComingOutLeft = [
            CGPointMake(75, 950),
            CGPointMake(225, 950),
            CGPointMake(300, 950),
            CGPointMake(320, 950),
            CGPointMake(575, 950),
            CGPointMake(185, 885),
            CGPointMake(260, 885),
            CGPointMake(345, 885),
            CGPointMake(460, 885),
            CGPointMake(268, 785),
            CGPointMake(420, 785)
        ]
        
        icon3x4ComingOutRight = [
            CGPointMake(75, 950),
            CGPointMake(285, 950),
            CGPointMake(360, 950),
            CGPointMake(440, 950),
            CGPointMake(575, 950),
            CGPointMake(235, 885),
            CGPointMake(320, 885),
            CGPointMake(405, 885),
            CGPointMake(460, 885),
            CGPointMake(268, 785),
            CGPointMake(420, 785)
        ]
        
        icon4x3ComingOut = [
            CGPointMake(240, 950),
            CGPointMake(300, 950),
            CGPointMake(360, 950),
            CGPointMake(420, 950),
            CGPointMake(75, 950),
            CGPointMake(580, 950),
            CGPointMake(200, 885),
            CGPointMake(335, 885),
            CGPointMake(460, 885),
            CGPointMake(250, 785),
            CGPointMake(400, 785),
        ]
        
        icon4x3ComingOutLeft = [
            CGPointMake(210, 950),
            CGPointMake(270, 950),
            CGPointMake(330, 950),
            CGPointMake(390, 950),
            CGPointMake(75, 950),
            CGPointMake(580, 950),
            CGPointMake(200, 885),
            CGPointMake(305, 885),
            CGPointMake(440, 885),
            CGPointMake(220, 785),
            CGPointMake(400, 785),
        ]
        
        icon4x3ComingOutRight = [
            CGPointMake(270, 950),
            CGPointMake(330, 950),
            CGPointMake(390, 950),
            CGPointMake(450, 950),
            CGPointMake(75, 950),
            CGPointMake(580, 950),
            CGPointMake(230, 885),
            CGPointMake(365, 885),
            CGPointMake(500, 885),
            CGPointMake(250, 785),
            CGPointMake(400, 785),
        ]
        
        icon3x4GoingIn = [
            CGPointMake(75, 750),
            CGPointMake(255, 750),
            CGPointMake(330, 750),
            CGPointMake(410, 750),
            CGPointMake(575, 750),
            CGPointMake(205, 685),
            CGPointMake(290, 685),
            CGPointMake(375, 685),
            CGPointMake(460, 685),
            CGPointMake(268, 585),
            CGPointMake(420, 585)
        ]
        
        icon3x4GoingInLeft = [
            CGPointMake(75, 750),
            CGPointMake(225, 750),
            CGPointMake(300, 750),
            CGPointMake(380, 750),
            CGPointMake(575, 750),
            CGPointMake(185, 685),
            CGPointMake(260, 685),
            CGPointMake(345, 685),
            CGPointMake(430, 685),
            CGPointMake(268, 585),
            CGPointMake(420, 585)
        ]
        
        icon3x4GoingInRight = [
            CGPointMake(75, 750),
            CGPointMake(285, 750),
            CGPointMake(360, 750),
            CGPointMake(440, 750),
            CGPointMake(575, 750),
            CGPointMake(235, 685),
            CGPointMake(320, 685),
            CGPointMake(405, 685),
            CGPointMake(490, 685),
            CGPointMake(268, 585),
            CGPointMake(420, 585)
        ]
        
        icon4x3GoingIn = [
            CGPointMake(240, 750),
            CGPointMake(300, 750),
            CGPointMake(360, 750),
            CGPointMake(420, 750),
            CGPointMake(75, 750),
            CGPointMake(580, 750),
            CGPointMake(200, 685),
            CGPointMake(335, 685),
            CGPointMake(470, 685),
            CGPointMake(250, 585),
            CGPointMake(400, 585),
        ]
        
        icon4x3GoingInLeft = [
            CGPointMake(210, 750),
            CGPointMake(270, 750),
            CGPointMake(330, 750),
            CGPointMake(390, 750),
            CGPointMake(75, 750),
            CGPointMake(580, 750),
            CGPointMake(200, 685),
            CGPointMake(305, 685),
            CGPointMake(440, 685),
            CGPointMake(250, 585),
            CGPointMake(400, 585),
        ]
        
        icon4x3GoingInRight = [
            CGPointMake(270, 750),
            CGPointMake(330, 750),
            CGPointMake(390, 750),
            CGPointMake(450, 750),
            CGPointMake(75, 750),
            CGPointMake(580, 750),
            CGPointMake(230, 685),
            CGPointMake(365, 685),
            CGPointMake(500, 685),
            CGPointMake(250, 585),
            CGPointMake(400, 585),
        ]
        
        icon3x4RedZone = [
            CGPointMake(75, 350),
            CGPointMake(255, 350),
            CGPointMake(330, 350),
            CGPointMake(410, 350),
            CGPointMake(575, 350),
            CGPointMake(205, 285),
            CGPointMake(290, 285),
            CGPointMake(375, 285),
            CGPointMake(460, 285),
            CGPointMake(268, 185),
            CGPointMake(420, 185)
        ]
        
        icon3x4RedZoneLeft = [
            CGPointMake(75, 350),
            CGPointMake(225, 350),
            CGPointMake(300, 350),
            CGPointMake(380, 350),
            CGPointMake(575, 350),
            CGPointMake(185, 285),
            CGPointMake(260, 285),
            CGPointMake(345, 285),
            CGPointMake(430, 285),
            CGPointMake(268, 185),
            CGPointMake(420, 185)
        ]
        
        icon3x4RedZoneRight = [
            CGPointMake(75, 350),
            CGPointMake(285, 350),
            CGPointMake(360, 350),
            CGPointMake(440, 350),
            CGPointMake(575, 350),
            CGPointMake(235, 285),
            CGPointMake(320, 285),
            CGPointMake(405, 285),
            CGPointMake(490, 285),
            CGPointMake(268, 185),
            CGPointMake(420, 185)
        ]
        
        icon4x3RedZone = [
            CGPointMake(240, 350),
            CGPointMake(300, 350),
            CGPointMake(360, 350),
            CGPointMake(420, 350),
            CGPointMake(75, 350),
            CGPointMake(580, 350),
            CGPointMake(200, 285),
            CGPointMake(335, 285),
            CGPointMake(470, 285),
            CGPointMake(250, 185),
            CGPointMake(400, 185),
        ]
        
        icon4x3RedZoneLeft = [
            CGPointMake(210, 350),
            CGPointMake(270, 350),
            CGPointMake(330, 350),
            CGPointMake(390, 350),
            CGPointMake(75, 350),
            CGPointMake(580, 350),
            CGPointMake(170, 285),
            CGPointMake(305, 285),
            CGPointMake(440, 285),
            CGPointMake(250, 185),
            CGPointMake(400, 185),
        ]
        
        icon4x3RedZoneRight = [
            CGPointMake(270, 350),
            CGPointMake(330, 350),
            CGPointMake(390, 350),
            CGPointMake(450, 350),
            CGPointMake(75, 350),
            CGPointMake(580, 350),
            CGPointMake(230, 285),
            CGPointMake(365, 285),
            CGPointMake(500, 285),
            CGPointMake(250, 185),
            CGPointMake(400, 185),
        ]
        
        icon3x4GoalLine = [
            CGPointMake(75, 250),
            CGPointMake(255, 250),
            CGPointMake(330, 250),
            CGPointMake(410, 250),
            CGPointMake(575, 250),
            CGPointMake(205, 185),
            CGPointMake(290, 185),
            CGPointMake(375, 185),
            CGPointMake(460, 185),
            CGPointMake(268, 135),
            CGPointMake(420, 135)
        ]
        
        icon3x4GoalLineLeft = [
            CGPointMake(75, 250),
            CGPointMake(225, 250),
            CGPointMake(300, 250),
            CGPointMake(380, 250),
            CGPointMake(575, 250),
            CGPointMake(175, 185),
            CGPointMake(260, 185),
            CGPointMake(345, 185),
            CGPointMake(430, 185),
            CGPointMake(268, 135),
            CGPointMake(420, 135)
        ]
        
        icon3x4GoalLineRight = [
            CGPointMake(75, 250),
            CGPointMake(285, 250),
            CGPointMake(360, 250),
            CGPointMake(440, 250),
            CGPointMake(575, 250),
            CGPointMake(235, 185),
            CGPointMake(320, 185),
            CGPointMake(405, 185),
            CGPointMake(490, 185),
            CGPointMake(268, 135),
            CGPointMake(420, 135)
        ]
        
        icon4x3GoalLine = [
            CGPointMake(240, 250),
            CGPointMake(300, 250),
            CGPointMake(360, 250),
            CGPointMake(420, 250),
            CGPointMake(75, 250),
            CGPointMake(580, 250),
            CGPointMake(200, 185),
            CGPointMake(335, 185),
            CGPointMake(470, 185),
            CGPointMake(250, 135),
            CGPointMake(400, 135),
        ]
        
        icon4x3GoalLineLeft = [
            CGPointMake(210, 250),
            CGPointMake(270, 250),
            CGPointMake(330, 250),
            CGPointMake(390, 250),
            CGPointMake(75, 250),
            CGPointMake(580, 250),
            CGPointMake(170, 185),
            CGPointMake(305, 185),
            CGPointMake(440, 185),
            CGPointMake(250, 135),
            CGPointMake(400, 135),
        ]
        
        icon4x3GoalLineRight = [
            CGPointMake(270, 250),
            CGPointMake(330, 250),
            CGPointMake(390, 250),
            CGPointMake(450, 250),
            CGPointMake(75, 250),
            CGPointMake(580, 250),
            CGPointMake(230, 185),
            CGPointMake(365, 185),
            CGPointMake(500, 185),
            CGPointMake(250, 135),
            CGPointMake(400, 135),
        ]
        
        iconComingOutCircleLeft = [
            CGPointMake(60,985),//11
            CGPointMake(150,1000),//12
            CGPointMake(200,985),//13
            CGPointMake(250,985),//14
            CGPointMake(300,985),//15
            CGPointMake(350,985),//16
            CGPointMake(400,985),//17
            CGPointMake(450,1000),//18
            CGPointMake(580,985),//19
            CGPointMake(250,1050),//20
            CGPointMake(300,1050),//21
        ]
        
        iconComingOutCrossLeft = [
            CGPointMake(210,950),//0
            CGPointMake(270,950),//1
            CGPointMake(330,950),//2
            CGPointMake(390,950),//3
            CGPointMake(60,950),//4
            CGPointMake(170,890),//5
            CGPointMake(305,890),//6
            CGPointMake(440,890),//7
            CGPointMake(370,890),//8
            CGPointMake(580,950),//9
            //CGPointMake(48,506),
            CGPointMake(250,890),//10
        ]
        
        iconComingOutCircleRight = [
            CGPointMake(60,985),//11
            CGPointMake(210,1000),//12
            CGPointMake(260,985),//13
            CGPointMake(310,985),//14
            CGPointMake(360,985),//15
            CGPointMake(410,985),//16
            CGPointMake(460,985),//17
            CGPointMake(510,1000),//18
            CGPointMake(580,985),//19
            CGPointMake(410,1050),//20
            CGPointMake(360,1050),//21
        ]
        
        iconComingOutCrossRight = [
            CGPointMake(270,950),//0
            CGPointMake(330,950),//1
            CGPointMake(390,950),//2
            CGPointMake(450,950),//3
            CGPointMake(60,950),//4
            CGPointMake(230,890),//5
            CGPointMake(365,890),//6
            CGPointMake(500,890),//7
            CGPointMake(430,890),//8
            CGPointMake(580,950),//9
            //CGPointMake(48,506),
            CGPointMake(310,890),//10
        ]
        
        iconRedZoneCross = [
            CGPointMake(240,325),//0
            CGPointMake(300,325),//1
            CGPointMake(360,325),//2
            CGPointMake(420,325),//3
            CGPointMake(60,325),//4
            CGPointMake(200,240),//5
            CGPointMake(335,240),//6
            CGPointMake(470,240),//7
            CGPointMake(400,240),//8
            CGPointMake(580,325),//9
            //CGPointMake(48,506),
            CGPointMake(280,240),//10
        ]
        
        iconRedZoneCircle = [
            CGPointMake(60,385),//11
            CGPointMake(180,400),//12
            CGPointMake(230,385),//13
            CGPointMake(280,385),//14
            CGPointMake(330,385),//15
            CGPointMake(380,385),//16
            CGPointMake(430,385),//17
            CGPointMake(480,400),//18
            CGPointMake(580,385),//19
            CGPointMake(278,450),//20
            CGPointMake(330,450),//21
        ]
        
        iconGoalLineCross = [
            CGPointMake(240,235),//0
            CGPointMake(300,235),//1
            CGPointMake(360,235),//2
            CGPointMake(420,235),//3
            CGPointMake(60,235),//4
            CGPointMake(200,170),//5
            CGPointMake(335,170),//6
            CGPointMake(470,170),//7
            CGPointMake(400,170),//8
            CGPointMake(580,235),//9
            //CGPointMake(48,506),
            CGPointMake(280,170),//10
        ]
        
        iconGoalLineCircle = [
            CGPointMake(60,285),//11
            CGPointMake(180,300),//12
            CGPointMake(230,285),//13
            CGPointMake(280,285),//14
            CGPointMake(330,285),//15
            CGPointMake(380,285),//16
            CGPointMake(430,285),//17
            CGPointMake(480,300),//18
            CGPointMake(580,285),//19
            CGPointMake(278,350),//20
            CGPointMake(330,350),//21
        ]
        
        iconRedZoneCrossLeft = [
            CGPointMake(210,325),//0
            CGPointMake(270,325),//1
            CGPointMake(330,325),//2
            CGPointMake(390,325),//3
            CGPointMake(60,325),//4
            CGPointMake(170,240),//5
            CGPointMake(305,240),//6
            CGPointMake(440,240),//7
            CGPointMake(370,240),//8
            CGPointMake(580,325),//9
            //CGPointMake(48,506),
            CGPointMake(250,240),//10
        ]
        
        iconRedZoneCircleLeft = [
            CGPointMake(60,385),//11
            CGPointMake(150,400),//12
            CGPointMake(200,385),//13
            CGPointMake(250,385),//14
            CGPointMake(300,385),//15
            CGPointMake(350,385),//16
            CGPointMake(400,385),//17
            CGPointMake(450,400),//18
            CGPointMake(580,385),//19
            CGPointMake(250,450),//20
            CGPointMake(300,450),//21
        ]
        
        iconRedZoneCrossRight = [
            CGPointMake(260,325),//0
            CGPointMake(330,325),//1
            CGPointMake(390,325),//2
            CGPointMake(450,325),//3
            CGPointMake(60,325),//4
            CGPointMake(230,240),//5
            CGPointMake(365,240),//6
            CGPointMake(500,240),//7
            CGPointMake(430,240),//8
            CGPointMake(580,325),//9
            //CGPointMake(48,506),
            CGPointMake(310,240),//10
        ]
        
        iconRedZoneCircleRight = [
            CGPointMake(60,385),//11
            CGPointMake(210,400),//12
            CGPointMake(260,385),//13
            CGPointMake(310,385),//14
            CGPointMake(360,385),//15
            CGPointMake(410,385),//16
            CGPointMake(460,385),//17
            CGPointMake(510,400),//18
            CGPointMake(580,385),//19
            CGPointMake(410,450),//20
            CGPointMake(360,450),//21
        ]
        
        iconGoalLineCircleLeft = [
            CGPointMake(60,285),//11
            CGPointMake(150,300),//12
            CGPointMake(200,285),//13
            CGPointMake(250,285),//14
            CGPointMake(300,285),//15
            CGPointMake(350,285),//16
            CGPointMake(400,285),//17
            CGPointMake(450,300),//18
            CGPointMake(580,285),//19
            CGPointMake(250,350),//20
            CGPointMake(300,350),//21
        ]
        
        iconGoalLineCrossLeft = [
            CGPointMake(210,235),//0
            CGPointMake(270,235),//1
            CGPointMake(330,235),//2
            CGPointMake(390,235),//3
            CGPointMake(60,235),//4
            CGPointMake(170,170),//5
            CGPointMake(305,170),//6
            CGPointMake(440,170),//7
            CGPointMake(370,170),//8
            CGPointMake(550,235),//9
            //CGPointMake(48,506),
            CGPointMake(250,170),//10
        ]
        
        iconGoalLineCircleRight = [
            CGPointMake(60,285),//11
            CGPointMake(210,300),//12
            CGPointMake(260,285),//13
            CGPointMake(310,285),//14
            CGPointMake(360,285),//15
            CGPointMake(410,285),//16
            CGPointMake(460,285),//17
            CGPointMake(510,300),//18
            CGPointMake(580,285),//19
            CGPointMake(410,350),//20
            CGPointMake(360,350),//21
        ]
        
        iconGoalLineCrossRight = [
            CGPointMake(240,235),//0
            CGPointMake(300,235),//1
            CGPointMake(360,235),//2
            CGPointMake(430,235),//3
            CGPointMake(60,235),//4
            CGPointMake(200,170),//5
            CGPointMake(335,170),//6
            CGPointMake(470,170),//7
            CGPointMake(400,170),//8
            CGPointMake(550,235),//9
            //CGPointMake(48,506),
            CGPointMake(280,170),//10
        ]
        
        iconRedZoneCrossRight = [
            CGPointMake(270,235),//0
            CGPointMake(330,235),//1
            CGPointMake(390,235),//2
            CGPointMake(460,235),//3
            CGPointMake(60,235),//4
            CGPointMake(230,170),//5
            CGPointMake(370,170),//6
            CGPointMake(500,170),//7
            CGPointMake(430,170),//8
            CGPointMake(550,235),//9
            //CGPointMake(48,506),
            CGPointMake(310,170),//10
        ]
        
        iconCenterResetOffense = [
            CGPointMake(50, CY+50),
            CGPointMake(113, CY+25),
            CGPointMake(230, CY+25),
            CGPointMake(280, CY+25),
            CGPointMake(330, CY+25),
            CGPointMake(380, CY+25),
            CGPointMake(430, CY+25),
            CGPointMake(545, CY+35),
            CGPointMake(610, CY+50),
            CGPointMake(280, CY+100),
            CGPointMake(330, CY+100),
            //CGPointMake(340, CY+360),   //i Hides 12th Player
        ]
        
        iconCenterResetDefense = [
            CGPointMake(240,635),//0
            CGPointMake(300,635),//1
            CGPointMake(360,635),//2
            CGPointMake(420,635),//3
            CGPointMake(60,635),//4
            CGPointMake(200,570),//5
            CGPointMake(335,570),//6
            CGPointMake(470,570),//7
            CGPointMake(400,470),//8
            CGPointMake(580,635),//9
            CGPointMake(280,470),//10
            //CGPointMake(48,506),//11
        ]
            
        iconRandomCircleArr_1 = [
            CGPointMake(screenSize.width * 0.628906, self.view.frame.size.height * 0.472070),
            CGPointMake(screenSize.width * 0.332899, self.view.frame.size.height * 0.630273),
            CGPointMake(screenSize.width * 0.196701, self.view.frame.size.height * 0.486719),
            CGPointMake(screenSize.width * 0.324653, self.view.frame.size.height * 0.487695),
            CGPointMake(screenSize.width * 0.031250, self.view.frame.size.height * 0.450195),
            CGPointMake(screenSize.width * 0.125347, self.view.frame.size.height * 0.575195),
            CGPointMake(screenSize.width * 0.446615, self.view.frame.size.height * 0.488672),
            CGPointMake(screenSize.width * 0.461892, self.view.frame.size.height * 0.677148),
            CGPointMake(screenSize.width * 0.261719, self.view.frame.size.height * 0.488672),
            CGPointMake(screenSize.width * 0.508767, self.view.frame.size.height * 0.489583),
            CGPointMake(screenSize.width * 0.385417, self.view.frame.size.height * 0.488932),
        ]
        iconRandomCircleArr_2 = [
            CGPointMake(screenSize.width * 0.589844, self.view.frame.size.height * 0.846093),
            CGPointMake(screenSize.width * 0.310764, self.view.frame.size.height * 0.767968),
            CGPointMake(screenSize.width * 0.184982, self.view.frame.size.height * 0.625391),
            CGPointMake(screenSize.width * 0.340278, self.view.frame.size.height * 0.612695),
            CGPointMake(screenSize.width * 0.024740, self.view.frame.size.height * 0.560547),
            CGPointMake(screenSize.width * 0.069357, self.view.frame.size.height * 0.731445),
            CGPointMake(screenSize.width * 0.464844, self.view.frame.size.height * 0.579492),
            CGPointMake(screenSize.width * 0.465798, self.view.frame.size.height * 0.799218),
            CGPointMake(screenSize.width * 0.162761, self.view.frame.size.height * 0.523828),
            CGPointMake(screenSize.width * 0.556944, self.view.frame.size.height * 0.644856),
            CGPointMake(screenSize.width * 0.414063, self.view.frame.size.height * 0.709635),
        ]
        iconRandomCrossArr_1 = [
            CGPointMake(screenSize.width * 0.598958, self.view.frame.size.height * 0.081055),
            CGPointMake(screenSize.width * 0.602864, self.view.frame.size.height * 0.386133),
            CGPointMake(screenSize.width * 0.172916, self.view.frame.size.height * 0.224023),
            CGPointMake(screenSize.width * 0.177344, self.view.frame.size.height * 0.373438),
            CGPointMake(screenSize.width * 0.436546, self.view.frame.size.height * 0.190755),
            CGPointMake(screenSize.width * 0.071614, self.view.frame.size.height * 0.833984),
            CGPointMake(screenSize.width * 0.597656, self.view.frame.size.height * 0.242187),
            CGPointMake(screenSize.width * 0.464844, self.view.frame.size.height * 0.375391),
            CGPointMake(screenSize.width * 0.318837, self.view.frame.size.height * 0.398828),
            CGPointMake(screenSize.width * 0.048524, self.view.frame.size.height * 0.079492),
            CGPointMake(screenSize.width * 0.049913, self.view.frame.size.height * 0.286523),
            CGPointMake(screenSize.width * 0.326996, self.view.frame.size.height * 0.290690),
        ]
        iconRandomCrossArr_2 = [
            CGPointMake(screenSize.width * 0.445312, self.view.frame.size.height * 0.072266),
            CGPointMake(screenSize.width * 0.476562, self.view.frame.size.height * 0.451563),
            CGPointMake(screenSize.width * 0.169010, self.view.frame.size.height * 0.322656),
            CGPointMake(screenSize.width * 0.224219, self.view.frame.size.height * 0.444727),
            CGPointMake(screenSize.width * 0.443056, self.view.frame.size.height * 0.364583),
            CGPointMake(screenSize.width * 0.098958, self.view.frame.size.height * 0.885742),
            CGPointMake(screenSize.width * 0.597656, self.view.frame.size.height * 0.358398),
            CGPointMake(screenSize.width * 0.352865, self.view.frame.size.height * 0.446680),
            CGPointMake(screenSize.width * 0.292795, self.view.frame.size.height * 0.446680),
            CGPointMake(screenSize.width * 0.190451, self.view.frame.size.height * 0.082422),
            CGPointMake(screenSize.width * 0.000434, self.view.frame.size.height * 0.365625),
            CGPointMake(screenSize.width * 0.321788, self.view.frame.size.height * 0.372721),

        ]
        
        // --- Defense ---
        //Like iconRandomCrossArr_1
        iconPosOffence4x3 = [
            CGPointMake(240, 615),
            CGPointMake(300, 615),
            CGPointMake(360, 615),
            CGPointMake(420, 615),
            CGPointMake(75, 615),
            CGPointMake(580, 615),
            CGPointMake(200, 550),
            CGPointMake(335, 550),
            CGPointMake(470, 550),
            CGPointMake(279, 450),
            CGPointMake(411, 450),
            //CGPointMake(-340, 360), //i Hides 12th Player
        ]
        
        iconPosOffence3x4 = [
            CGPointMake(75, 615),
            CGPointMake(265, 615),
            CGPointMake(344, 615),
            CGPointMake(423, 615),
            CGPointMake(580, 615),
            CGPointMake(215, 550),
            CGPointMake(303, 550),
            CGPointMake(388, 550),
            CGPointMake(472, 550),
            CGPointMake(278, 450),
            CGPointMake(410, 450),
            //CGPointMake(-3800, 360), //i Hides 12th Player
        ]
        
        // --- Offense ---
        iconPosDeffencePass = [
            CGPointMake(75, CY+50),
            CGPointMake(113, CY+25),
            CGPointMake(230, CY+25),
            CGPointMake(280, CY+25),
            CGPointMake(330, CY+25),
            CGPointMake(380, CY+25),
            CGPointMake(430, CY+25),
            CGPointMake(545, CY+35),
            CGPointMake(610, CY+50),
            CGPointMake(280, CY+100),
            CGPointMake(330, CY+100),
            //CGPointMake(340, CY+360),   //i Hides 12th Player
        ]
        
        iconPosDeffenceRun = [
            CGPointMake(75, CY+25),
            CGPointMake(235, CY+25),
            CGPointMake(270, CY+25),
            CGPointMake(305, CY+25),
            CGPointMake(340, CY+25),
            CGPointMake(375, CY+25),
            CGPointMake(410, CY+25),
            CGPointMake(445, CY+25),
            CGPointMake(330, CY+125),
            CGPointMake(580, CY+25),
            CGPointMake(330, CY+75),
            //CGPointMake(344, CY+90),  //i Hides 12th Player
        ]
        
        iconLeftHashDeffenceRun = [
            CGPointMake(75, CY+25),
            CGPointMake(195, CY+25),
            CGPointMake(230, CY+25),
            CGPointMake(265, CY+25),
            CGPointMake(300, CY+25),
            CGPointMake(335, CY+25),
            CGPointMake(370, CY+25),
            CGPointMake(405, CY+25),
            CGPointMake(300, CY+125),
            CGPointMake(580, CY+25),
            CGPointMake(300, CY+75),
            //CGPointMake(344, CY+90),  //i Hides 12th Player
        ]
        
        iconLeftHashDeffencePass = [
            CGPointMake(75, CY+50),
            CGPointMake(113, CY+25),
            CGPointMake(200, CY+25),
            CGPointMake(250, CY+25),
            CGPointMake(300, CY+25),
            CGPointMake(350, CY+25),
            CGPointMake(400, CY+25),
            CGPointMake(545, CY+35),
            CGPointMake(610, CY+50),
            CGPointMake(250, CY+100),
            CGPointMake(300, CY+100),
            //CGPointMake(340, CY+360),   //i Hides 12th Player
        ]
        
        iconLeftHashOffence3x4 = [
            CGPointMake(75, 615),
            CGPointMake(225, 615),
            CGPointMake(300, 615),
            CGPointMake(380, 615),
            CGPointMake(575, 615),
            CGPointMake(175, 550),
            CGPointMake(260, 550),
            CGPointMake(345, 550),
            CGPointMake(430, 550),
            CGPointMake(268, 450),
            CGPointMake(420, 450),
            //CGPointMake(-3800, 360), //i Hides 12th Player
        ]
        
        iconLeftHashOffence4x3 = [
            CGPointMake(210, 615),
            CGPointMake(270, 615),
            CGPointMake(330, 615),
            CGPointMake(390, 615),
            CGPointMake(75, 615),
            CGPointMake(580, 615),
            CGPointMake(170, 550),
            CGPointMake(305, 550),
            CGPointMake(440, 550),
            CGPointMake(250, 450),
            CGPointMake(400, 450),
        ]
        
        iconRightHashOffence3x4 = [
            CGPointMake(75, 615),
            CGPointMake(285, 615),
            CGPointMake(365, 615),
            CGPointMake(445, 615),
            CGPointMake(570, 615),
            CGPointMake(235, 550),
            CGPointMake(325, 550),
            CGPointMake(410, 550),
            CGPointMake(495, 550),
            CGPointMake(278, 450),
            CGPointMake(430, 450),
        ]
        
        iconRightHashOffence4x3 = [
            CGPointMake(270, 615),
            CGPointMake(330, 615),
            CGPointMake(390, 615),
            CGPointMake(450, 615),
            CGPointMake(75, 615),
            CGPointMake(580, 615),
            CGPointMake(230, 550),
            CGPointMake(365, 550),
            CGPointMake(500, 550),
            CGPointMake(279, 450),
            CGPointMake(425, 450),
        ]
        
        iconRightHashDeffencePass = [
            CGPointMake(75, CY+50),
            CGPointMake(113, CY+25),
            CGPointMake(260, CY+25),
            CGPointMake(310, CY+25),
            CGPointMake(360, CY+25),
            CGPointMake(410, CY+25),
            CGPointMake(460, CY+25),
            CGPointMake(545, CY+35),
            CGPointMake(610, CY+50),
            CGPointMake(410, CY+100),
            CGPointMake(360, CY+100),
        ]
        
        
        iconSquareRightDeffencePass = [
            CGPointMake(360, CY+25)
        ]
        
        iconRightHashDeffenceRun = [
            CGPointMake(75, CY+25),
            CGPointMake(255, CY+25),
            CGPointMake(290, CY+25),
            CGPointMake(325, CY+25),
            CGPointMake(360, CY+25),
            CGPointMake(395, CY+25),
            CGPointMake(430, CY+25),
            CGPointMake(465, CY+25),
            CGPointMake(360, CY+125),
            CGPointMake(580, CY+25),
            CGPointMake(360, CY+75),
        ]
        
        //First time we set all default values as a CGPoint
        let keyCount = getKeyCount()
        if keyCount == 0 {
            //Save end user name
            
            
            //  NSUserDefaults.standardUserDefaults().setValue("Icon Set 2", forKey: String(format: "%@%d", K.KeyValue.LayoutName, getKeyCount()))
            for iconPos in iconPosArr {
                iconCrossInitalPosArr.addObject(NSStringFromCGPoint(iconPos))
            }
            for iconPos in iconPosArr {
                iconCircleInitalPosArr.addObject(NSStringFromCGPoint(iconPos))
            }
            
            //Saving all cgpoints of the layout
            NSUserDefaults.standardUserDefaults().setValue("Cross Icon Set", forKey: String(format: "%@%d", K.KeyValue.LayoutName, getKeyCount()))
            NSUserDefaults.standardUserDefaults().setObject(iconCrossInitalPosArr, forKey: String(format: "KEY_%d", incrementKeyCount()))
            NSUserDefaults.standardUserDefaults().setInteger(IconType.Cross.hashValue, forKey: String(format: "ICON_TYPE_%d", getKeyCount()))
            
            NSUserDefaults.standardUserDefaults().setValue("Circle Icon Set", forKey: String(format: "%@%d", K.KeyValue.LayoutName, getKeyCount()))
            NSUserDefaults.standardUserDefaults().setObject(iconCircleInitalPosArr, forKey: String(format: "KEY_%d", incrementKeyCount()))
            NSUserDefaults.standardUserDefaults().setInteger(IconType.Circle.hashValue, forKey: String(format: "ICON_TYPE_%d", getKeyCount()))
            
            NSUserDefaults.standardUserDefaults().synchronize()
        }
        //Opening default LAyout
        openLayoutWithIndex(1)
        //Reload picker view with different layout
        for index in 0...(getKeyCount()-1) {
            let name = NSUserDefaults.standardUserDefaults().stringForKey(String(format: "%@%d", K.KeyValue.LayoutName, index))
            pickerDataSource.append(name!)
        }
        pickerView.reloadAllComponents()
        
        self.title = "Setup Your Play"
    }

    func setNewPosArr() -> Void {
        let newArray:NSMutableArray = NSMutableArray()
        for icon in manager.iconArrary {
            let cgValue = NSStringFromCGPoint( icon.path.count == 0 ? icon.startPos : icon.path[icon.path.count - 1])
            newArray.addObject(cgValue)
        }
  
        NSUserDefaults.standardUserDefaults().setObject(newArray, forKey: String(format: "KEY_%d", incrementKeyCount()))
        NSUserDefaults.standardUserDefaults().setInteger(iconType.hashValue, forKey: String(format: "ICON_TYPE_%d", getKeyCount()))
        saveLayoutNames()
        pickerDataSource.append(layoutName.text!)
        pickerView.reloadAllComponents()
        
        layoutName.text = ""
    }
    func incrementKeyCount() -> Int {
        let keyCount = NSUserDefaults.standardUserDefaults().integerForKey("KEY_COUNT")
        NSUserDefaults.standardUserDefaults().setInteger(keyCount+1, forKey: "KEY_COUNT")
        return NSUserDefaults.standardUserDefaults().integerForKey("KEY_COUNT")
    }
    func getKeyCount() -> Int {
        return NSUserDefaults.standardUserDefaults().integerForKey("KEY_COUNT")
    }
    func saveLayoutNames() -> Void {
        NSUserDefaults.standardUserDefaults().setValue(layoutName.text, forKey:String(format: "%@%d", K.KeyValue.LayoutName, getKeyCount()-1))
        NSUserDefaults.standardUserDefaults().synchronize()
    }
    //Common method to initialize icons with type
    func initIconWithType(iconType:IconType, position:CGPoint) -> Void {
        
        if iconType == IconType.Circle {
            let circle:Icon = Icon()
            circle.image = UIImage(named: "Circle.png")
            circle.fileName = "Circle.png"
            circle.startPos = position//getPosAt(index, layoutType: layoutType)
            circle.name = iconName
            circle.type = IconType.Circle
            manager.addIcon(circle)
            return
        }
        
        if iconType == IconType.Square {
            let square:Icon = Icon()
            square.image = UIImage(named: "Square.png")
            square.startPos = position//getPosAt(index, layoutType: layoutType)
            square.fileName = "Square.png"
            square.name = iconName
            square.type = IconType.Square
            manager.addIcon(square)
            return
        }
        
        let cross:Icon = Icon()
        cross.image = UIImage(named: "X.png")
        cross.startPos = position//getPosAt(index, layoutType: layoutType)
        cross.fileName = "X.png"
        cross.name = iconName
        cross.type = IconType.Cross
        manager.addIcon(cross)
    }

    func layoutIcons() {
        var tag = 0
        for icon in manager.iconArrary {
            let imageView:UIImageView = UIImageView(image: icon.image)
            self.view.addSubview(imageView)
            imageView.frame = CGRectMake(icon.startPos.x, icon.startPos.y, imageView.frame.size.width, imageView.frame.size.height)
            imageView.tag = kBaseTag + tag
            tag += 1
        }
    }
    
    func removeExistedIcons() -> Void {
        var tag = 0
        for icon in manager.iconArrary {
            let imgView = self.view.viewWithTag(kBaseTag + tag) as? UIImageView
            imgView?.removeFromSuperview()
            tag += 1
            print(icon)
        }
        manager.iconArrary.removeAll(keepCapacity: true)
    }
    
//    func removeExistedIconsOfType(moveType:IconType, array:[CGPoint]) -> Void {
//        var tag = 0
//        var countCross = 0
//        for icon in manager.iconArrary {
//            let imgView = self.view.viewWithTag(kBaseTag + tag) as! UIImageView
//            if icon.type == moveType && countCross < array.count {
//                let point =  array[countCross]
//                imgView.frame = CGRectMake(point.x, point.y, imgView.frame.size.width,  imgView.frame.size.width)
//                countCross += 1
//            }
//            tag += 1
//        }
//    }
    
    var offset:CGPoint = CGPointZero
    var selectedIndex:Int = -1
    var selectedIcon:UIView? = nil
    
    
    func setSelectedIconFromTouch(touch:UITouch?) {
        
        if touch == nil {
            selectedIcon = nil
            return
        }
        
        let touchLocation = touch?.locationInView(self.view)
        
        for i in 0 ..< manager.iconArrary.count {
            
            let tag = kBaseTag + i
            let imageView = self.view.viewWithTag(tag)
            
            let iconFrame = self.view.convertRect(imageView!.frame, toView: self.view)
            
            if CGRectContainsPoint(iconFrame, touchLocation!) {
                selectedIcon = imageView
                return
            }
        }
    }

    func setOffsetFromTouch(touch:UITouch?) {
        
        if touch == nil || selectedIcon == nil {
            offset = CGPointZero
            return
        }
        
        offset = touch!.locationInView(selectedIcon!)
    }
    
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        let touch = touches.first
        setSelectedIconFromTouch(touch)
        setOffsetFromTouch(touch)
        if selectedIcon == nil {
            return
        }

        if layoutName.text?.characters.count > 0 {
            return
        }
        startPos = getCenter(selectedIcon!.frame.origin)
    }
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        let touch = touches.first
        
        if selectedIcon == nil {
            return
        }
        
        let touchPos = touch?.locationInView(self.view)
        let pathPos = CGPointMake(touchPos!.x - offset.x, touchPos!.y - offset.y)
        selectedIcon?.frame = CGRectMake(pathPos.x, pathPos.y, selectedIcon!.frame.size.width, selectedIcon!.frame.size.height)

        let tag = selectedIcon?.tag
        
        manager.iconArrary[tag! - kBaseTag].path.append(pathPos)
        
        endPos = getCenter(pathPos)
        drawLine(startPos, endPos: endPos, imageView: selectedIcon!)
        startPos = CGPointMake(endPos.x, endPos.y)
    }
    
    func getCenter(pos:CGPoint) -> CGPoint {
        
        let center:CGPoint = CGPointMake(pos.x + selectedIcon!.frame.size.width / 2, pos.y + selectedIcon!.frame.size.height / 2)
        return center
    }
    
    func drawLine(startPos:CGPoint, endPos:CGPoint, imageView:UIView) {
        if layoutName.text?.characters.count > 0 {
            return
        }
        let path = UIBezierPath()
        path.moveToPoint(CGPointMake(startPos.x, startPos.y))
        path.addLineToPoint(CGPointMake(endPos.x, endPos.y))
        
        shapeLayer = CAShapeLayer()
        shapeLayer.path = path.CGPath
        shapeLayer.strokeColor = UIColor.whiteColor().CGColor
        shapeLayer.lineWidth = 3.0
        shapeLayer.fillColor = UIColor.clearColor().CGColor
        shapeLayer.name = K.KeyValue.shapeLayerName

        self.view.layer.insertSublayer(shapeLayer, below: imageView.layer)
    }
    
    func drawRedLine(startPos:CGPoint, endPos:CGPoint, imageView:UIView) {
        let path = UIBezierPath()
        path.moveToPoint(CGPointMake(startPos.x, startPos.y))
        path.addLineToPoint(CGPointMake(endPos.x, endPos.y))
        
        shapeLayer = CAShapeLayer()
        shapeLayer.path = path.CGPath
        shapeLayer.strokeColor = UIColor.redColor().CGColor
        shapeLayer.lineWidth = 3.0
        shapeLayer.fillColor = UIColor.clearColor().CGColor
        shapeLayer.name = K.KeyValue.shapeLayerName
    }
    
    func clearDrawLine() -> Void {
        for layer in self.view.layer.sublayers! {
            if layer.name == K.KeyValue.shapeLayerName {
                layer.removeFromSuperlayer()
            }
        }
    }
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
         let touch = touches.first
        let touchPos = touch?.locationInView(self.view)
        selectedIcon = nil
        offset = CGPointZero
        print(touchPos)
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let identifier = segue.identifier
        if identifier! == "playRecord" {
            manager.saveIcons()
            let thirdController:ThirdScreen = segue.destinationViewController as! ThirdScreen
            thirdController.isBackToListing  = true
            thirdController.iconName = self.iconName
        }
    }
    func openLayoutWithIndex(layoutIndex:Int) -> Void {

        removeExistedIcons()
            var iconPosArray = NSUserDefaults.standardUserDefaults().objectForKey(String(format: "KEY_%d", layoutIndex)) as! NSMutableArray
            for index in 0...(iconPosArray.count - 1) {
                if index % 2 != 0 {
//                 print(String(format: "CGPointMake(screenSize.width * %f, self.view.frame.size.height * %f),", CGPointFromString(iconPosArray.objectAtIndex(index) as! String).x/self.view.frame.size.width, CGPointFromString(iconPosArray.objectAtIndex(index) as! String).y/self.view.frame.size.height))
                }
                iconPosArray = NSUserDefaults.standardUserDefaults().objectForKey(String(format: "KEY_%d", layoutIndex)) as! NSMutableArray
                
                //Remove this comment after made Cover 3 layout
                //initIconWithType(index % 2 == 0 ? IconType.Cross : IconType.Circle /*iconType*/, position: CGPointFromString(iconPosArray.objectAtIndex(index) as! String))
                initIconWithType((index <= 10 ? IconType.Cross : index == 11 ? IconType.Square : IconType.Circle) /*iconType*/, position: CGPointFromString(iconPosArray.objectAtIndex(index) as! String))
            }
        layoutIcons()
    }
    func changeLocationOnly(moveType:IconType, array:[CGPoint]) -> Void {
        var tag = 0
        var countCross = 0
        for icon in manager.iconArrary {
            let imgView = self.view.viewWithTag(kBaseTag + tag) as! UIImageView
            if icon.type == moveType && countCross < array.count {
                let point =  array[countCross]
                imgView.frame = CGRectMake(point.x, point.y, imgView.frame.size.width,  imgView.frame.size.width)
                icon.startPos = point
                icon.path = []
                countCross += 1
            }
            tag += 1
        }
    }
    @IBAction func cover2Button(sender: AnyObject) {
        iconType = IconType.Cross
        openLayoutWithIndex(1)
    }
    
    @IBAction func cover3Button(sender: AnyObject) {
        iconType = IconType.Circle
        openLayoutWithIndex(2)
    }
    
    @IBAction func saveLayout(sender: AnyObject) {
        clearDrawLine()
        for name in pickerDataSource {
            if name == layoutName.text {
                showAlert("Layout is already existed with this name")
                return
            }
        }
        if layoutName.text?.characters.count > 0 {
            setNewPosArr()
        }else {
            showAlert("Please enter layout name")
        }
    }
    
    @IBAction func onSave(sender: AnyObject) {
        if layoutName.text?.characters.count > 0 {
            showAlert("Please save the layout first. If you don't want to save layout then clear the layout field")
            return
        }
        iconName = nameField.text!
        self.performSegueWithIdentifier("playRecord", sender: nil)
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerDataSource.count;
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerDataSource[row]
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        clearDrawLine()
        //(format: "ICON_TYPE_%d", getKeyCount())
        let iconIntType = NSUserDefaults.standardUserDefaults().integerForKey(String(format: "ICON_TYPE_%d", row + 1))
        if iconIntType == IconType.Cross.hashValue {
                    iconType = IconType.Cross
        }else {
                    iconType = IconType.Circle
            
        }
        if (row +  1)  == 1 {
            if deltaBoolFirst == false {
                print("X1 Move X2", "O1 Stopped")
                changeLocationOnly(IconType.Cross, array: iconRandomCrossArr_2)
                deltaBoolFirst = true
            }else {
                print("X2 Move X1", "O2 Stopped")
                changeLocationOnly(IconType.Cross, array: iconRandomCrossArr_1)
                deltaBoolFirst = false
            }
        }
        else if(row +  1)  == 2{
            if deltaBoolSecond == true {
                print("O1 Move O2", "X2 Stopped")
                changeLocationOnly(IconType.Circle, array: iconRandomCircleArr_2)
                deltaBoolSecond = false
            }else {
                print("O2 Move O1", "X1 Stopped")
                changeLocationOnly(IconType.Circle, array: iconRandomCircleArr_1)
                deltaBoolSecond = true
            }
        }else {
            openLayoutWithIndex(row + 1)
        }
    }
    
    func showAlert(message:String) {
        let alertController:UIAlertController = UIAlertController(title: message, message: nil, preferredStyle: .Alert)
        let alertAction = UIAlertAction(title: "OK", style: .Default, handler: nil)
        alertController.addAction(alertAction)
        self.presentViewController(alertController, animated: true, completion: nil)
    }
    
    @IBAction func blitzerAction(sender: AnyObject) {
        
        //var RMXimgView:UIImageView?
        var leftMostX:Icon?
        
        var tag = 0
        var countCross = 0
        for icon in manager.iconArrary {
            let imgView = self.view.viewWithTag(kBaseTag + tag) as! UIImageView
            print(imgView)
            if icon.type == IconType.Cross {
                if let ic = leftMostX {
                    if ic.startPos.x > icon.startPos.x {
                        leftMostX = icon
                        //RMXimgView = imgView
                    }
                } else {
                    leftMostX = icon
                    //RMXimgView = imgView
                }
                countCross += 1
            }
            tag += 1
        }
        
        //RMXimgView?.backgroundColor = UIColor.redColor()
        if let icon = leftMostX {
            appendPathToIcon(icon)
        }
    }
    @IBAction func actionCornerback(sender: AnyObject)
    {
        //var RMXimgView:UIImageView?
        var rightMostX:Icon?
        
        var tag = 0
        var countCross = 0
        for icon in manager.iconArrary {
            let imgView = self.view.viewWithTag(kBaseTag + tag) as! UIImageView
            print(imgView)
            if icon.type == IconType.Cross {
                if let ic = rightMostX {
                    if ic.startPos.x < icon.startPos.x {
                        rightMostX = icon
                        //RMXimgView = imgView
                    }
                } else {
                    rightMostX = icon
                    //RMXimgView = imgView
                }
                countCross += 1
            }
            tag += 1
        }
        
        //RMXimgView?.backgroundColor = UIColor.redColor()
        if let icon = rightMostX {
            appendPathToIcon(icon)
        }
    }
    
    @IBAction func linebackerButton(sender: AnyObject) {
        //var RMXimgView:UIImageView?
        var centerIconX:Icon?
        
        var tag = 0
        var countCross = 0
        for icon in manager.iconArrary {
            let imgView = self.view.viewWithTag(kBaseTag + tag) as! UIImageView
            print(imgView)
            if icon.type == IconType.Cross {
                if let ic = centerIconX {
                    if ic.startPos.x == icon.startPos.x && ic.startPos.y == icon.startPos.y {
                        centerIconX = icon
                        //RMXimgView = imgView
                    }
                } else {
                    centerIconX = icon
                    //RMXimgView = imgView
                }
                countCross += 1
            }
            tag += 1
        }
        
        //RMXimgView?.backgroundColor = UIColor.redColor()
        if let icon = centerIconX {
            appendPathToIcon(icon)
        }
    }
    
    func appendPathToIcon(icon: Icon) {
        let targetIconPath = manager.iconArrary.last!.path
        var cornerbackPosition = icon.startPos
        
        let count = (targetIconPath.count > 0 ? targetIconPath.count : 75)
        
        for index in 0..<count {
            var distance = CGPointZero
            if icon.path.indices.contains(index) {
                cornerbackPosition = icon.path[index]
            }
            
            let nextPosition = (targetIconPath.count == 0 ? manager.iconArrary.last!.startPos : targetIconPath[index])
            distance = CGPoint(x: cornerbackPosition.x - nextPosition.x, y: cornerbackPosition.y - nextPosition.y)
            let distanceSegment = (x: distance.x / CGFloat(count), y: distance.y / CGFloat(count))
            let nextPoint = CGPointMake(cornerbackPosition.x - distanceSegment.x * CGFloat(index), cornerbackPosition.y - distanceSegment.y * CGFloat(index))
            
            icon.path.append(nextPoint)
        }
    }
    
    @IBAction func x3Button(sender: AnyObject) {
        if comingOutLabel.text == "Choose Your Situation" {
            clearDrawLine()
            changeLocationOnly(IconType.Cross, array: iconPosOffence4x3)
        }
        if comingOutLabel.text == "Coming Out" {
            clearDrawLine()
            changeLocationOnly(IconType.Cross, array: icon4x3ComingOut)
        }
        if comingOutLabel.text == "Going In" {
            clearDrawLine()
            changeLocationOnly(IconType.Cross, array: icon4x3GoingIn)
        }
        if comingOutLabel.text == "Red Zone" {
            clearDrawLine()
            changeLocationOnly(IconType.Cross, array: icon4x3RedZone)
        }
        if comingOutLabel.text == "Goal Line" {
            clearDrawLine()
            changeLocationOnly(IconType.Cross, array: icon4x3GoalLine)
        }
        if leftSide == true && comingOutLabel.text == "Choose Your Situation" {
            clearDrawLine()
            changeLocationOnly(IconType.Cross, array: iconLeftHashOffence4x3)
        }
        if rightSide == true && comingOutLabel.text == "Choose Your Situation" {
            clearDrawLine()
            changeLocationOnly(IconType.Cross, array: iconRightHashOffence4x3)
        }
        if centerSide == true && comingOutLabel.text == "Choose Your Situation" {
            clearDrawLine()
            changeLocationOnly(IconType.Cross, array: iconPosOffence4x3)
        }
        if comingOutLabel.text == "Coming Out" && leftSide == true {
            clearDrawLine()
            changeLocationOnly(IconType.Cross, array: icon4x3ComingOutLeft)
        }
        if comingOutLabel.text == "Going In" && leftSide == true {
            clearDrawLine()
            changeLocationOnly(IconType.Cross, array: icon4x3GoingInLeft)
        }
        if comingOutLabel.text == "Red Zone" && leftSide == true {
            clearDrawLine()
            changeLocationOnly(IconType.Cross, array: icon4x3RedZoneLeft)
        }
        if comingOutLabel.text == "Goal Line" && leftSide == true {
            clearDrawLine()
            changeLocationOnly(IconType.Cross, array: icon4x3GoalLineLeft)
        }
        if comingOutLabel.text == "Coming Out" && rightSide == true {
            clearDrawLine()
            changeLocationOnly(IconType.Cross, array: icon4x3ComingOutRight)
        }
        if comingOutLabel.text == "Going In" && rightSide == true {
            clearDrawLine()
            changeLocationOnly(IconType.Cross, array: icon4x3GoingInRight)
        }
        if comingOutLabel.text == "Red Zone" && rightSide == true {
            clearDrawLine()
            changeLocationOnly(IconType.Cross, array: icon4x3RedZoneRight)
        }
        if comingOutLabel.text == "Goal Line" && rightSide == true {
            clearDrawLine()
            changeLocationOnly(IconType.Cross, array: icon4x3GoalLineRight)
        }
    }
    
    @IBAction func x4Button(sender: AnyObject) {
        if comingOutLabel.text == "Choose Your Situation" {
            clearDrawLine()
            changeLocationOnly(IconType.Cross, array: iconPosOffence3x4)
        }
        if comingOutLabel.text == "Coming Out" {
            clearDrawLine()
            changeLocationOnly(IconType.Cross, array: icon3x4ComingOut)
        }
        if comingOutLabel.text == "Going In" {
            clearDrawLine()
            changeLocationOnly(IconType.Cross, array: icon3x4GoingIn)
        }
        if comingOutLabel.text == "Red Zone" {
            clearDrawLine()
            changeLocationOnly(IconType.Cross, array: icon3x4RedZone)
        }
        if comingOutLabel.text == "Goal Line" {
            clearDrawLine()
            changeLocationOnly(IconType.Cross, array: icon3x4GoalLine)
        }
        if leftSide == true && comingOutLabel.text == "Choose Your Situation" {
            clearDrawLine()
            changeLocationOnly(IconType.Cross, array: iconLeftHashOffence3x4)
        }
        if rightSide == true && comingOutLabel.text == "Choose Your Situation" {
            clearDrawLine()
            changeLocationOnly(IconType.Cross, array: iconRightHashOffence3x4)
        }
        if centerSide == true && comingOutLabel.text == "Choose Your Situation" {
            clearDrawLine()
            changeLocationOnly(IconType.Cross, array: iconPosOffence3x4)
        }
        if comingOutLabel.text == "Coming Out" && leftSide == true {
            clearDrawLine()
            changeLocationOnly(IconType.Cross, array: icon3x4ComingOutLeft)
        }
        if comingOutLabel.text == "Going In" && leftSide == true {
            clearDrawLine()
            changeLocationOnly(IconType.Cross, array: icon3x4GoingInLeft)
        }
        if comingOutLabel.text == "Red Zone" && leftSide == true {
            clearDrawLine()
            changeLocationOnly(IconType.Cross, array: icon3x4RedZoneLeft)
        }
        if comingOutLabel.text == "Goal Line" && leftSide == true {
            clearDrawLine()
            changeLocationOnly(IconType.Cross, array: icon3x4GoalLineLeft)
        }
        if comingOutLabel.text == "Coming Out" && rightSide == true {
            clearDrawLine()
            changeLocationOnly(IconType.Cross, array: icon3x4ComingOutRight)
        }
        if comingOutLabel.text == "Going In" && rightSide == true {
            clearDrawLine()
            changeLocationOnly(IconType.Cross, array: icon3x4GoingInRight)
        }
        if comingOutLabel.text == "Red Zone" && rightSide == true {
            clearDrawLine()
            changeLocationOnly(IconType.Cross, array: icon3x4RedZoneRight)
        }
        if comingOutLabel.text == "Goal Line" && rightSide == true {
            clearDrawLine()
            changeLocationOnly(IconType.Cross, array: icon3x4GoalLineRight)
        }
    }
    
    @IBAction func passButton(sender: AnyObject) {
        if comingOutLabel.text == "Choose Your Situation" {
            clearDrawLine()
            changeLocationOnly(IconType.Circle, array: iconPosDeffencePass)
        }
        if comingOutLabel.text == "Coming Out" {
            clearDrawLine()
            changeLocationOnly(IconType.Circle, array: iconPassComingOut)
        }
        if comingOutLabel.text == "Going In" {
            clearDrawLine()
            changeLocationOnly(IconType.Circle, array: iconPassGoingIn)
        }
        if comingOutLabel.text == "Red Zone" {
            clearDrawLine()
            changeLocationOnly(IconType.Circle, array: iconPassRedZone)
        }
        if comingOutLabel.text == "Goal Line" {
            clearDrawLine()
            changeLocationOnly(IconType.Circle, array: iconPassGoalLine)
        }
        if leftSide == true && comingOutLabel.text == "Choose Your Situation" {
            clearDrawLine()
            changeLocationOnly(IconType.Circle, array: iconLeftHashDeffencePass)
        }
        if rightSide == true && comingOutLabel.text == "Choose Your Situation" {
            clearDrawLine()
            changeLocationOnly(IconType.Circle, array: iconRightHashDeffencePass)
        }
        if centerSide == true && comingOutLabel.text == "Choose Your Situation" {
            clearDrawLine()
            changeLocationOnly(IconType.Circle, array: iconPosDeffencePass)
        }
        if comingOutLabel.text == "Coming Out" && leftSide == true {
            clearDrawLine()
            changeLocationOnly(IconType.Circle, array: iconPassComingOutLeft)
        }
        if comingOutLabel.text == "Going In" && leftSide == true {
            clearDrawLine()
            changeLocationOnly(IconType.Circle, array: iconPassGoingInLeft)
        }
        if comingOutLabel.text == "Red Zone" && leftSide == true {
            clearDrawLine()
            changeLocationOnly(IconType.Circle, array: iconPassRedZoneLeft)
        }
        if comingOutLabel.text == "Goal Line" && leftSide == true {
            clearDrawLine()
            changeLocationOnly(IconType.Circle, array: iconPassGoalLineLeft)
        }
        if comingOutLabel.text == "Coming Out" && rightSide == true {
            clearDrawLine()
            changeLocationOnly(IconType.Circle, array: iconPassComingOutRight)
        }
        if comingOutLabel.text == "Going In" && rightSide == true {
            clearDrawLine()
            changeLocationOnly(IconType.Circle, array: iconPassGoingInRight)
        }
        if comingOutLabel.text == "Red Zone" && rightSide == true {
            clearDrawLine()
            changeLocationOnly(IconType.Circle, array: iconPassRedZoneRight)
        }
        if comingOutLabel.text == "Goal Line" && rightSide == true {
            clearDrawLine()
            changeLocationOnly(IconType.Circle, array: iconPassGoalLineRight)
        }
    }
    
    @IBAction func runButton(sender: AnyObject) {
        if comingOutLabel.text == "Choose Your Situation" {
            clearDrawLine()
            changeLocationOnly(IconType.Circle, array: iconPosDeffenceRun)
        }
        if comingOutLabel.text == "Coming Out" {
            clearDrawLine()
            changeLocationOnly(IconType.Circle, array: iconRunComingOut)
        }
        if comingOutLabel.text == "Going In" {
            clearDrawLine()
            changeLocationOnly(IconType.Circle, array: iconRunGoingIn)
        }
        if comingOutLabel.text == "Red Zone" {
            clearDrawLine()
            changeLocationOnly(IconType.Circle, array: iconRunRedZone)
        }
        if comingOutLabel.text == "Goal Line" {
            clearDrawLine()
            changeLocationOnly(IconType.Circle, array: iconRunGoalLine)
        }
        if leftSide == true && comingOutLabel.text == "Choose Your Situation" {
            clearDrawLine()
            changeLocationOnly(IconType.Circle, array: iconLeftHashDeffenceRun)
        }
        if rightSide == true && comingOutLabel.text == "Choose Your Situation" {
            clearDrawLine()
            changeLocationOnly(IconType.Circle, array: iconRightHashDeffenceRun)
        }
        if centerSide == true && comingOutLabel.text == "Choose Your Situation" {
            clearDrawLine()
            changeLocationOnly(IconType.Circle, array: iconPosDeffenceRun)
        }
        if comingOutLabel.text == "Coming Out" && leftSide == true {
            clearDrawLine()
            changeLocationOnly(IconType.Circle, array: iconRunComingOutLeft)
        }
        if comingOutLabel.text == "Going In" && leftSide == true {
            clearDrawLine()
            changeLocationOnly(IconType.Circle, array: iconRunGoingInLeft)
        }
        if comingOutLabel.text == "Red Zone" && leftSide == true {
            clearDrawLine()
            changeLocationOnly(IconType.Circle, array: iconRunRedZoneLeft)
        }
        if comingOutLabel.text == "Goal Line" && leftSide == true {
            clearDrawLine()
            changeLocationOnly(IconType.Circle, array: iconRunGoalLineLeft)
        }
        if comingOutLabel.text == "Coming Out" && rightSide == true {
            clearDrawLine()
            changeLocationOnly(IconType.Circle, array: iconRunComingOutRight)
        }
        if comingOutLabel.text == "Going In" && rightSide == true {
            clearDrawLine()
            changeLocationOnly(IconType.Circle, array: iconRunGoingInRight)
        }
        if comingOutLabel.text == "Red Zone" && rightSide == true {
            clearDrawLine()
            changeLocationOnly(IconType.Circle, array: iconRunRedZoneRight)
        }
        if comingOutLabel.text == "Goal Line" && rightSide == true {
            clearDrawLine()
            changeLocationOnly(IconType.Circle, array: iconRunGoalLineRight)
        }
    }
    
    @IBAction func actionSetIconPos(sender: UIButton)
    {
        switch sender {
        case btnDefencePass:
           
            print("Circle Moves", "Defense Pass Mode")
            clearDrawLine()
            changeLocationOnly(IconType.Circle, array: iconPosDeffencePass)
            buttonIndicator = true
            
        case btnDefenceRun:

            print("Circle Moves", "Defense Run Mode")
            clearDrawLine()
            changeLocationOnly(IconType.Circle, array: iconPosDeffenceRun)
            buttonIndicator1 = true

        case btnOffence3x4:

            print("Cross Moves", "Offense 3x4 Mode")
            clearDrawLine()
            changeLocationOnly(IconType.Cross, array: iconPosOffence3x4)
            buttonIndicator2 = true

        case btnOffence4x3:

            print("Cross Moves", "Offense 4x3 Mode")
            clearDrawLine()
            changeLocationOnly(IconType.Cross, array: iconPosOffence4x3)
            buttonIndicator3 = true

        default:
            print("Other mode selected")
        }
        //circle.startPos = position
    }
    
    @IBAction func downAction(sender: AnyObject) {
        
        sender.setValue(Float(lroundf(slider.value)), animated: true)
        let selectedValue = Float(slider.value);
        let integerNumber:Int = Int(selectedValue)
        downNumber.text = "\(integerNumber)"
        ThirdScreen.playDown = self.downNumber.text!
    }
    
    @IBAction func centerFieldButton(sender: AnyObject) {
        
        if comingOutLabel.text == "Choose Your Situation" {
            changeLocationOnly(IconType.Circle, array: iconLeftHashDeffencePass)
            changeLocationOnly(IconType.Cross, array: iconLeftHashOffence3x4)
            clearDrawLine()
        }
        if comingOutLabel.text == "Going In" {
            changeLocationOnly(IconType.Cross , array: iconGoingInCross)
            changeLocationOnly(IconType.Circle, array: iconGoingInCircle)
            clearDrawLine()
        }
        if comingOutLabel.text == "Coming Out" {
            changeLocationOnly(IconType.Cross, array: iconComingOutCross)
            changeLocationOnly(IconType.Circle, array: iconComingOutCircle)
            clearDrawLine()
        }
        if comingOutLabel.text == "Red Zone" {
            changeLocationOnly(IconType.Cross, array: iconRedZoneCross)
            changeLocationOnly(IconType.Circle, array: iconRedZoneCircle)
            clearDrawLine()
        }
        if comingOutLabel.text == "Goal Line" {
            changeLocationOnly(IconType.Cross, array: iconGoalLineCross)
            changeLocationOnly(IconType.Circle, array: iconGoalLineCircle)
            clearDrawLine()
        }
        else {
            changeLocationOnly(IconType.Circle, array: iconCenterResetOffense)
            changeLocationOnly(IconType.Cross, array: iconCenterResetDefense)
            clearDrawLine()
        }
        centerSide = true
        rightSide = false
        leftSide = false
    }
    
    @IBAction func leftHashButton(sender: AnyObject) {
        
        if comingOutLabel.text == "Choose Your Situation" {
            changeLocationOnly(IconType.Circle, array: iconLeftHashDeffencePass)
            changeLocationOnly(IconType.Cross, array: iconLeftHashOffence3x4)
            clearDrawLine()
        }
        if comingOutLabel.text == "Coming Out" {
            changeLocationOnly(IconType.Cross, array: iconComingOutCrossLeft)
            changeLocationOnly(IconType.Circle, array: iconComingOutCircleLeft)
            clearDrawLine()
        }
        if comingOutLabel.text == "Going In" {
            changeLocationOnly(IconType.Cross, array: iconGoingInCrossLeft)
            changeLocationOnly(IconType.Circle, array: iconGoingInCircleLeft)
            clearDrawLine()
        }
        if comingOutLabel.text == "Red Zone" {
            changeLocationOnly(IconType.Cross, array: iconRedZoneCrossLeft)
            changeLocationOnly(IconType.Circle, array: iconRedZoneCircleLeft)
            clearDrawLine()
        }
        if comingOutLabel.text == "Goal Line" {
            changeLocationOnly(IconType.Circle, array: iconGoalLineCircleLeft)
            changeLocationOnly(IconType.Cross, array: iconGoalLineCrossLeft)
            clearDrawLine()
        }
        leftSide = true
        rightSide = false
        centerSide = false
    }
    
    @IBAction func rightHashButton(sender: AnyObject) {
        
        if comingOutLabel.text == "Choose Your Situation" {
            changeLocationOnly(IconType.Circle, array: iconLeftHashDeffencePass)
            changeLocationOnly(IconType.Cross, array: iconLeftHashOffence3x4)
            clearDrawLine()
        }
        if comingOutLabel.text == "Coming Out" {
            changeLocationOnly(IconType.Circle, array: iconComingOutCircleRight)
            changeLocationOnly(IconType.Cross, array: iconComingOutCrossRight)
            clearDrawLine()
        }
        if comingOutLabel.text == "Going In" {
            changeLocationOnly(IconType.Circle, array: iconGoingInCircleRight)
            changeLocationOnly(IconType.Cross, array: iconGoingInCrossRight)
            clearDrawLine()
        }
        if comingOutLabel.text == "Red Zone" {
            changeLocationOnly(IconType.Circle, array: iconRedZoneCircleRight)
            changeLocationOnly(IconType.Cross, array: iconRedZoneCrossRight)
            clearDrawLine()
        }
        if comingOutLabel.text == "Goal Line" {
            changeLocationOnly(IconType.Circle, array: iconGoalLineCircleRight)
            changeLocationOnly(IconType.Cross, array: iconGoalLineCrossRight)
            clearDrawLine()
        }
        rightSide = true
        leftSide = false
        centerSide = false
    }
    
    @IBAction func comingOutAction(sender: AnyObject) {
        sender.setValue(Float(lroundf(comingOut.value)), animated: true)
        if comingOut.value == 1 {
            comingOutLabel.text = "Coming Out"
            comingOut.value = 1
            changeLocationOnly(IconType.Cross, array: iconComingOutCross)
            changeLocationOnly(IconType.Circle, array: iconComingOutCircle)
            changeLocationOnly(IconType.Square, array: iconSquareRightDeffencePass)
        }
        if comingOut.value == 2 {
            comingOutLabel.text = "Going In"
            comingOut.value = 2
            changeLocationOnly(IconType.Cross , array: iconGoingInCross)
            changeLocationOnly(IconType.Circle, array: iconGoingInCircle)
            //changeLocationOnly(IconType.Square, array: iconGoingInSquare)
        }
        if comingOut.value == 3 {
            comingOutLabel.text = "Red Zone"
            comingOut.value = 3
            changeLocationOnly(IconType.Cross, array: iconRedZoneCross)
            changeLocationOnly(IconType.Circle, array: iconRedZoneCircle)
            clearDrawLine()
        }
        if comingOut.value == 4 {
            comingOutLabel.text = "Goal Line"
            comingOut.value = 4
            changeLocationOnly(IconType.Cross, array: iconGoalLineCross)
            changeLocationOnly(IconType.Circle, array: iconGoalLineCircle)
        }
    }
    
}