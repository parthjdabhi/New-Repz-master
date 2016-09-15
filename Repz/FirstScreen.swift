//
//  FirstScreen.swift
//  Repz
//
//  Created by Dustin Allen on 8/15/16.
//  Copyright © 2016 Harloch. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class FirstScreen: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet var newName: UITextField!
    @IBOutlet var savedList: UITableView!
    
    let manager:IconManager = IconManager.sharedManager()
    var iconObjects:[NSManagedObject]? = nil
    let delegate:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
    
    var nameArray:[String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.hidesBackButton = true
        
        
        //To load preloaded modes, when user opens application first time.
        if NSUserDefaults.standardUserDefaults().boolForKey("FIRST_TIME") == false {
            
            NSUserDefaults.standardUserDefaults().setBool(true, forKey: "FIRST_TIME")
            //Load Final Mode from plist
            for index in 0...21 {
                addIcons(String(format: "Key_%d", index),object: PlistManager.sharedInFinal.getValueForKey(String(format: "Key_%d", index)) as! NSMutableDictionary)
            }
            //Load Cover3 Mode from plist
            for index in 0...21 {
                addIcons(String(format: "Key_%d", index),object: PlistManager.sharedInCover3.getValueForKey(String(format: "Key_%d", index)) as! NSMutableDictionary)
            }
            
            
            //To Load New Mode From Plist and save to core data.
            
            //// Step-6 Load that plist file into your core data when application opens first time. Thats it :) you have added new mode to REPZ. 
            
            for index in 0...21 {
                addIcons(String(format: "Key_%d", index),object: PlistManager.sharedInNewMode.getValueForKey(String(format: "Key_%d", index)) as! NSMutableDictionary)
            }
            manager.saveIcons()
        }
    }
    
    override func viewWillAppear(animated: Bool) {
        loadSavedData()
        newName.text = ""
    }
    
    func addIcons(key:String,object:NSMutableDictionary) {
        //let object = PlistManager.sharedInstance.getValueForKey(key) as! NSMutableDictionary
        let icon = Icon()
        
        icon.name = object.valueForKey("name") as! String
        icon.fileName = object.valueForKey("fileName") as! String
        icon.image = UIImage(named: icon.fileName)
        icon.startPos = CGPointMake(object.valueForKey("startPosX") as! CGFloat, object.valueForKey("startPosY") as! CGFloat)
        icon.offset = CGPointMake(object.valueForKey("offsetX") as! CGFloat, object.valueForKey("offsetX") as! CGFloat)
        
        let pathData:NSData? = object.valueForKey("path") as? NSData
        if pathData != nil {
            let array = NSKeyedUnarchiver.unarchiveObjectWithData(pathData!) as! [NSValue]
            
            icon.path.removeAll()
            for value in array {
                let pos = value.CGPointValue()
                icon.path.append(pos)
            }
        }
        
        manager.addIcon(icon)
    }
    
    func loadSavedData() {
        let managedContext = delegate.managedObjectContext
        let fetchRequest = NSFetchRequest(entityName: "Icon")
        
        manager.iconArrary.removeAll()
        
        do {
            let results = try managedContext.executeFetchRequest(fetchRequest)
            iconObjects = results as? [NSManagedObject]
            
            if iconObjects == nil {
                return
            }
            
            for iconObject in iconObjects! {
                let name = String(iconObject.valueForKey("name") as! String)
                
                var bExist:Bool = false
                for iconName in nameArray {
                    if iconName.compare(name) == .OrderedSame {
                        bExist = true
                    }
                }
                
                if bExist == false {
                    nameArray.append(name)
                }
            }
            //print("namearray", nameArray)
            savedList.reloadData()
        } catch let error as NSError {
            print("Could not fetch \(error), \(error.userInfo)")
        }
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nameArray.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("savedCell")
        
        cell?.textLabel?.text = nameArray[indexPath.row]
        
        return cell!
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let cell = tableView.cellForRowAtIndexPath(indexPath)
//        print(nameArray)
        cell?.textLabel?.text = nameArray[indexPath.row]
        self.performSegueWithIdentifier("savedRecord", sender: cell)
    }
    
    @IBAction func onCreateNewRecord(sender: AnyObject) {
        
        let newNameStr = newName.text
        
        if newNameStr == "" {
            showAlert("Input Field shouldn't be empty.")
            return
        }
        
        for icon in manager.iconArrary {
            if icon.name.compare(newNameStr!) == .OrderedSame {
                showAlert("There is already record which has same name.")
                return
            }
        }
        
        self.performSegueWithIdentifier("newRecord", sender: nil)
        
        ThirdScreen.playName = self.newName.text!
    }
    
    func showAlert(message:String)
    {
        let alertController:UIAlertController = UIAlertController(title: message, message: nil, preferredStyle: .Alert)
        let alertAction = UIAlertAction(title: "OK", style: .Default, handler: nil)
        alertController.addAction(alertAction)
        self.presentViewController(alertController, animated: true, completion: nil)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let identifier = segue.identifier
        
        if (identifier! == "newRecord") {
            let secondController:SecondScreen = segue.destinationViewController as! SecondScreen
            secondController.iconName = self.newName.text!
            secondController.iconCount = 2
        }
        else if (identifier! == "savedRecord") {
            let thirdController:ThirdScreen = segue.destinationViewController as! ThirdScreen
            thirdController.iconName = ((sender as! UITableViewCell).textLabel?.text!)!
        }
    }
    
}
