//
//  AdoptionDetailViewController.swift
//  AdoptSJ
//
//  Created by Jeff Toschi on 3/4/17.
//  Copyright © 2017 Steven Booth. All rights reserved.
//

import UIKit




class AdoptionDetailViewController: UIViewController{

    var row = 0
    var section = 0
    var selectedAdoption: AdoptionItem = SpecificMenuItems().items[0][0]
    //let selectedAdoption: AdoptionItem
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(selectedAdoption)
        // Do any additional setup after loading the view.
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
