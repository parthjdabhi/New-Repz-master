//
//  MyNavicationBar.swift
//  Repz
//
//  Created by Dustin Allen on 8/30/16.
//  Copyright © 2016 Harloch. All rights reserved.
//

import Foundation
import UIKit

class MyNavigationBar: UINavigationBar {
    private var secondTap = false
    private var firstTapPoint = CGPointZero
    
    override func pointInside(point: CGPoint, withEvent event: UIEvent?) -> Bool {
        if !self.secondTap {
            self.firstTapPoint = point
        }
        
        defer{
            self.secondTap = !self.secondTap
        }
        
        return  super.pointInside(firstTapPoint, withEvent: event)
    }
}
