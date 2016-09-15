//
//  Icon.swift
//  Repz
//
//  Created by Dustin Allen on 8/14/16.
//  Copyright © 2016 Harloch. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class Icon {

    var image:UIImage? = nil
    var startPos:CGPoint = CGPointZero
    var offset:CGPoint = CGPointZero
    
    var path:[CGPoint] = []
    var name:String = ""
    var fileName:String = "Circle.png"
    var squareIcon:String = "Square.png"
    var type:IconType!
}
