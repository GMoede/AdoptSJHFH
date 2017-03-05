//
//  AdoptionItemSelectionDelegate.swift
//  AdoptSJ
//
//  Created by Jeff Toschi on 3/4/17.
//  Copyright © 2017 Steven Booth. All rights reserved.
//

import UIKit


protocol AdoptionItemSelectionDelegate{
    func didSelectMenuItem(controller: UITableViewController, adoptionItem:AdoptionItem)
}
