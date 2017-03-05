//
//  AdoptionTableViewController.swift
//  AdoptSJ
//
//  Created by Steven Booth on 3/4/17.
//  Copyright (c) 2017 Steven Booth. All rights reserved.
//

import UIKit

class AdoptionTableViewController: UITableViewController {

    var myOrder = AdoptionItem()
    let adoptionItems = SpecificMenuItems()
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // Return the number of sections.
        return adoptionItems.sections.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        // Return the number of rows in the section.
        return adoptionItems.items[section].count
    }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return adoptionItems.sections[section]
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let row = indexPath.row
        let section = indexPath.section
        let order = adoptionItems.items[section][row]
        order.name += " " + adoptionItems.sections[section]
        navigationItem.title = order.name
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let row = indexPath.row
        let section = indexPath.section
        let adoptionItem = adoptionItems.items[section][row]
        cell.textLabel?.text = adoptionItem.name
        cell.detailTextLabel?.text = adoptionItem.address
        return cell
    }
}
