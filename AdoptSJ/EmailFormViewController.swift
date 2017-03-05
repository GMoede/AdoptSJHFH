//
//  EmailFormViewController.swift
//  AdoptSJ
//
//  Created by Shivam Desai on 3/4/17.
//  Copyright © 2017 Steven Booth. All rights reserved.
//

import UIKit

class EmailFormViewController: UIViewController, UITextFieldDelegate, UITextViewDelegate {

    var name: String?
    var address: String?
    
    @IBOutlet weak var placeName: UITextField!
    @IBOutlet weak var placeAddress: UITextField!
    @IBOutlet weak var phoneNumber: UITextField!
    @IBOutlet weak var emailAddress: UITextField!
    @IBOutlet weak var adoptionPreferences: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        placeName.text = name
        placeAddress.text = address
        
        phoneNumber.text = "phone"
        phoneNumber.textColor = UIColor.lightGray
        phoneNumber.delegate = self
        
        emailAddress.text = "email"
        emailAddress.textColor = UIColor.lightGray
        emailAddress.delegate = self
        
        adoptionPreferences.text = "In a paragraph, tell us what part of this location you would like to adopt, as well as how you will care for it."
        adoptionPreferences.textColor = UIColor.lightGray
        adoptionPreferences.delegate = self
        adoptionPreferences.layer.borderColor = UIColor.black.cgColor
        
    }

    func textFieldDidBeginEditing(_ textField: UITextField){
        if textField.textColor == UIColor.lightGray {
            textField.text = nil
            textField.textColor = UIColor.black
        }
    }
    
    func textViewDidBeginEditing(_ textView: UITextView){
        if textView.textColor == UIColor.lightGray {
            textView.text = nil
            textView.textColor = UIColor.black
        }
    }
    
    /*
    func textViewDidEndEditing(_ textField: UITextField) {
        if textField.text.isEmpty {
            switch textField.{
            case <#pattern#>:
                <#code#>
            default:
                <#code#>
            }
            textView.text = "Placeholder"
            textView.textColor = UIColor.lightGray
        }
    }
    */
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    
    
    
    
}
