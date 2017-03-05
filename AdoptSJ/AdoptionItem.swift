//
//  AdoptionModel.swift
//  AdoptSJ
//
//  Created by Steven Booth on 3/4/17.
//  Copyright (c) 2017 Steven Booth. All rights reserved.
//

import UIKit

class AdoptionItem: NSObject {
    var name = "None"
    var address = "None"
    var desc = "None"
    override init(){}
    init(name:String, address: String, desc: String){
        self.name = name
        self.address = address
        self.desc = desc
    }
   
}
