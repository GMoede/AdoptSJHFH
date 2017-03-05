//
//  AdoptionModel.swift
//  AdoptSJ
//
//  Created by Steven Booth on 3/4/17.
//  Copyright (c) 2017 Steven Booth. All rights reserved.
//

import UIKit
import RealmSwift

class AdoptionItem: Object {
    var name: String?
    var address: String?
    var desc: String?
    var status: String?
}
