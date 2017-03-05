//
//  AdoptionItems.swift
//  AdoptSJ
//
//  Created by Steven Booth on 3/4/17.
//  Copyright (c) 2017 Steven Booth. All rights reserved.
//

import UIKit
import RealmSwift

class AdoptionItems: Object {
    let items = List<AdoptionItem>()
}

/*
class SpecificMenuItems: AdoptionItems {
    override init() {
        super.init()
        
        addSection(section: "Pending", item: [
            AdoptionItem(name:"Brick House",address:"755 Locust Street", desc: "Cool Place")
            ])
        addSection(section: "Approved", item: [
            AdoptionItem(name:"Grandmas Cottage",address:"755 Locust Street", desc: "Cool Place")
            ])
    }
    
}
*/
