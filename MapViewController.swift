//
//  MapViewController.swift
//  carfixapp
//
//  Created by Sounderya Ramesh Babu on 18/1/16.
//  Copyright © 2016 carfix. All rights reserved.
//

import Foundation
import UIKit
import GoogleMaps
import Parse
import Bolts


class MapViewController: UIViewController {
    
    
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var mapView: GMSMapView!
    @IBOutlet weak var mapCenterPinImage: UIImageView!
    @IBOutlet weak var pinImageVerticalConstraint: NSLayoutConstraint!
    var searchedTypes = ["Auto Repair", "Car Repair"]
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        
        locationManager.delegate = self
        //locationManager.locationServicesEnabled
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        
        locationManager.requestAlwaysAuthorization()
     
        
        
//                let userDetails = PFObject(className: "userDetails")
//                userDetails["number"] = phone.text
//                //userDetails["UDID"] = "a56f45ds5d4fs5d4f5sdf5sd4f5"
//                userDetails["Type"] = "Customer"
//        
//                userDetails.saveInBackgroundWithBlock { (success: Bool, error: NSError?) -> Void in
//                    print("Object has been saved.")
               // }
        

        
    
//        let query = PFQuery(className: "userDetails")
// 
//        query.whereKey("number", equalTo: "9789344663")
// 
//        query.findObjectsInBackgroundWithBlock { (objects, error) -> Void in
//            if error == nil {
//                print("Exists")
//            } else {
//                print("Error")
//            }
//        }

        
        
   }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "Types Segue" {
            let navigationController = segue.destinationViewController as! UINavigationController
            let controller = navigationController.topViewController as! TypesTableViewController
            controller.selectedTypes = searchedTypes
            controller.delegate = self
        }
    }
}

// MARK: - TypesTableViewControllerDelegate
extension MapViewController: TypesTableViewControllerDelegate {
    func typesController(controller: TypesTableViewController, didSelectTypes types: [String]) {
        searchedTypes = controller.selectedTypes.sort()
        dismissViewControllerAnimated(true, completion: nil)
    }
}

// MARK: - CLLocationManagerDelegate
//1
extension MapViewController: CLLocationManagerDelegate {
    // 2
    func locationManager(manager: CLLocationManager, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
        // 3
        if status == .AuthorizedWhenInUse {
            
            // 4
            locationManager.startUpdatingLocation()
            
            //5
            mapView.myLocationEnabled = true
            mapView.settings.myLocationButton = true
        }
    }
    
    // 6
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first {
            
            
            // 7
            mapView.camera = GMSCameraPosition(target: location.coordinate, zoom: 15, bearing: 0, viewingAngle: 0)
            
            // 8
            locationManager.stopUpdatingLocation()
            
            //
            
                let locationArray = locations as NSArray
                let locationObj = locationArray.lastObject as! CLLocation
                let coord = locationObj.coordinate
                
                print(coord.latitude)
                print(coord.longitude)
            var addressLabel = "\(coord.latitude)"
            addressLabel += "," + "\(coord.longitude)"
            self.addressLabel.text = addressLabel
           
        }
        
    }
    func reverseGeocodeCoordinate(coordinate: CLLocationCoordinate2D) {
        
        // 1
        let geocoder = GMSGeocoder()
        
        // 2
        geocoder.reverseGeocodeCoordinate(coordinate) { response, error in
            if let address = response?.firstResult() {
                
                // 3
                let lines = address.lines as! [String]
                self.addressLabel.text = lines.joinWithSeparator("\n")
                
                // 4
                UIView.animateWithDuration(0.25) {
                    self.view.layoutIfNeeded()
                }
            }
        }
    }
    
    
   
    
    @IBAction func locateMe(object: AnyObject) {
//        let camera = GMSCameraPosition.cameraWithLatitude(41.887,
//            longitude:-87.622, zoom:15)
//        let mapView = GMSMapView.mapWithFrame(CGRectZero, camera:camera)
//        
//        
//        let marker = GMSMarker()
//        marker.position = CLLocationCoordinate2DMake(41.887, -87.622)
//        marker.appearAnimation = kGMSMarkerAnimationPop
//        marker.icon = UIImage(named: "icon_me")
//        marker.map = mapView
//        
//        self.view = mapView
        
//        let latitude = mapView.myLocation.coordinate.latitude
//     
//        let longitude = self.mapView.myLocation.coordinate.longitude
        
//        print("---------------lat=\(latitude)")
//        print("---------------lon= \(longitude)")
        
        
     
   }
}
