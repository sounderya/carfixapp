//
//  SignUpController.swift
//  carfixapp
//
//  Created by Sounderya Ramesh Babu on 19/1/16.
//  Copyright © 2016 carfix. All rights reserved.
//

import Foundation
import UIKit
import GoogleMaps
import Parse
import Bolts

class SignUpController: UIViewController {
    
    func displayAlert(title: String, message: String) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
        self.presentViewController(alert, animated: true, completion: nil)
        
    }
    
    
    @IBOutlet weak var phone: UITextField!
    
    @IBOutlet weak var signUp: UIButton!
    @IBAction func signUp(sender: AnyObject) {
        
        if phone.text == "" {
            
            
            displayAlert("Missing Field(s)", message: "phone no reqd")
            
//        } else {
//            
//            let userDetails = PFObject(className: "userDetails")
//            userDetails["number"] = phone.text
//            print("the num:  \(phone.text)")
//            //userDetails["UDID"] = "a56f45ds5d4fs5d4f5sdf5sd4f5"
//            userDetails["Type"] = "Customer"
//                
//                
//        
//                
//            userDetails.saveInBackgroundWithBlock { (success: Bool, error: NSError?) -> Void in
//                print("Object has been saved.")
//            }
        self.performSegueWithIdentifier("MapPage", sender: self)
            
            
           
                   }
            
        }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let userDetails = PFObject(className: "userDetails")
        userDetails["number"] = phone.text
        print("the num:  \(phone.text)")
        //userDetails["UDID"] = "a56f45ds5d4fs5d4f5sdf5sd4f5"
        userDetails["Type"] = "Customer"
        
        userDetails.saveInBackgroundWithBlock { (success: Bool, error: NSError?) -> Void in
            print("Object has been saved.")
        }
        
        
        
       
        
        
    }
    
    

    
}