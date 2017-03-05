//
//  EmailFormViewController.swift
//  AdoptSJ
//
//  Created by Shivam Desai on 3/4/17.
//  Copyright © 2017 Steven Booth. All rights reserved.
//

import UIKit

class EmailFormViewController: UIViewController {

    @IBOutlet weak var placeName: UITextField!
    @IBOutlet weak var placeAddress: UITextField!
    @IBOutlet weak var phoneNumber: UITextField!
    @IBOutlet weak var emailAddress: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        placeName = 
        placeAddress =
        phoneNumber.text = "phone"
        emailAddress.accessibilityHint = "email"
    }

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
