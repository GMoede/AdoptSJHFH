//
//  AdoptionItems.swift
//  AdoptSJ
//
//  Created by Steven Booth on 3/4/17.
//  Copyright (c) 2017 Steven Booth. All rights reserved.
//

import UIKit

class AdoptionItems: NSObject {
    var sections:[String] = []
    var items:[[AdoptionItem]] = []
    
    func addSection(section: String, item: [AdoptionItem]){
        sections = sections + [section]
        items = items + [item]
    }
    override init() {}
}

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
