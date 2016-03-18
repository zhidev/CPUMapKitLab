//
//  PhotoMapViewController.swift
//  Photo Map
//
//  Created by Nicholas Aiwazian on 10/15/15.
//  Copyright © 2015 Timothy Lee. All rights reserved.
//

import UIKit
import MapKit


class PhotoMapViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet var mapView: MKMapView!

    var vc: UIImagePickerController?
    var imageOrig:UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        vc = UIImagePickerController()
        vc!.delegate = self
        vc!.allowsEditing = true
        
        
        //one degree of latitude is approximately 111 kilometers (69 miles) at all times.
        let sfRegion = MKCoordinateRegionMake(CLLocationCoordinate2DMake(37.783333, -122.416667),
            MKCoordinateSpanMake(0.1, 0.1))
        mapView.setRegion(sfRegion, animated: false)

    
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    func imagePickerController(picker: UIImagePickerController,
        didFinishPickingMediaWithInfo info: [String : AnyObject]) {
            // Get the image captured by the UIImagePickerController
            let originalImage = info[UIImagePickerControllerOriginalImage] as! UIImage
            let editedImage = info[UIImagePickerControllerEditedImage] as! UIImage
            
            // Do something with the images (based on your use case)
            //avatarImage.image = editedImage
            imageOrig = originalImage
            
            // Dismiss UIImagePickerController to go back to your original view controller
            dismissViewControllerAnimated(true) { () -> Void in
                self.performSegueWithIdentifier("tagSegue", sender: nil)
            }
    }
    
    @IBAction func onCamera(sender: UIButton) {
        print("On Camera")
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.Camera){
            vc!.sourceType = UIImagePickerControllerSourceType.Camera
            self.presentViewController(vc!, animated: true, completion: nil)
        }else{
            vc!.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
            self.presentViewController(vc!, animated: true, completion: nil)
        }
    }
    

}
