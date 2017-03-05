//
//  SecondViewController.swift
//  AdoptSJ
//
//  Created by Steven Booth on 3/4/17.
//  Copyright (c) 2017 Steven Booth. All rights reserved.
//

import UIKit
import GooglePlacePicker
import GoogleMaps



class SecondViewController: UIViewController {
    
    // Add a pair of UILabels in Interface Builder, and connect the outlets to these variables.
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var addressLabel: UILabel!
    @IBOutlet weak var placeImage: UIImageView!
    
    // Add a UIButton in Interface Builder, and connect the action to this function.
    /* @IBAction func pickPlace(_ sender: UIButton) {
        let center = CLLocationCoordinate2D(latitude: 37.788204, longitude: -122.411937)
        let northEast = CLLocationCoordinate2D(latitude: center.latitude + 0.001, longitude: center.longitude + 0.001)
        let southWest = CLLocationCoordinate2D(latitude: center.latitude - 0.001, longitude: center.longitude - 0.001)
        let viewport = GMSCoordinateBounds(coordinate: northEast, coordinate: southWest)
        let config = GMSPlacePickerConfig(viewport: viewport)
        let placePicker = GMSPlacePicker(config: config)
        placePicker.pickPlace(callback:  { (place, error) -> Void in
            if let error = error {
                print("Pick Place error: \(error.localizedDescription)")
                return
            }
            
            if let place = place {
                self.nameLabel.text = place.name
                self.addressLabel.text = place.formattedAddress?.components(separatedBy: ", ")
                    .joined(separator: "\n")
            } else {
                self.nameLabel.text = "No place selected"
                self.addressLabel.text = ""
            }
        })
    }*/
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print(nameLabel.text)
        if (segue.identifier == "formDetail"){
            let nextScene = segue.destination as! EmailFormViewController
            
            nextScene.name = nameLabel.text
            nextScene.address = addressLabel.text
        }
    }
   
    override func viewDidLoad() {
        super.viewDidLoad()
        openPickPlace()
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func reOpenPicker(_ sender: UIButton){
        openPickPlace()
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func openPickPlace(){
        let center = CLLocationCoordinate2D(latitude: 37.788204, longitude: -122.411937)
        let northEast = CLLocationCoordinate2D(latitude: center.latitude + 0.001, longitude: center.longitude + 0.001)
        let southWest = CLLocationCoordinate2D(latitude: center.latitude - 0.001, longitude: center.longitude - 0.001)
        let viewport = GMSCoordinateBounds(coordinate: northEast, coordinate: southWest)
        let config = GMSPlacePickerConfig(viewport: viewport)
        let placePicker = GMSPlacePicker(config: config)
        placePicker.pickPlace(callback:  { (place, error) -> Void in
            if let error = error {
                print("Pick Place error: \(error.localizedDescription)")
                return
            }
            
            if let place = place {
                self.nameLabel.text = place.name
                self.addressLabel.text = place.formattedAddress?.components(separatedBy: ", ")
                    .joined(separator: "\n")
                self.loadPhoto(placeID: place.placeID)
            } else {
                self.nameLabel.text = "No place selected"
                self.addressLabel.text = ""
            }
        })

    }
    
    func loadImageforMetadata(photoMetadata: GMSPlacePhotoMetadata){
        GMSPlacesClient.shared().loadPlacePhoto(photoMetadata, callback: {
            (photo, error)-> Void in
            if let error = error {
                //Error control
                print("Fuckup")
            } else {
                self.placeImage.image = photo;
                //self.attributionTextView.attributedText = photoMetadata.attributions;
            }
        })
    }
    func loadPhoto(placeID: String)
    {
        GMSPlacesClient.shared().lookUpPhotos(forPlaceID: placeID) { (photos, error) -> Void in
            if let error = error {
                //Taking care of any errors
                print("You fucked up");
                
            } else {
                if let firstphoto = photos?.results.first {
                    self.loadImageforMetadata(photoMetadata: firstphoto)
                }
            }
        }
    }

    
}

