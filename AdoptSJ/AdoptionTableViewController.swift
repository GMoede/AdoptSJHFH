//
//  AdoptionTableViewController.swift
//  AdoptSJ
//
//  Created by Steven Booth on 3/4/17.
//  Copyright (c) 2017 Steven Booth. All rights reserved.
//

import UIKit

class AdoptionTableViewController: UITableViewController {
    //order == selectedadoption
    var myOrder = AdoptionItem()
    let adoptionItems = SpecificMenuItems()
    //var delegate:AdoptionItemSelectionDelegate! = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let row = indexPath.row
        let section = indexPath.section
        let selectedAdoption = adoptionItems.items[section][row]
        let cell = tableView.cellForRow(at: indexPath)
        //delegate.didSelectMenuItem(controller: self, adoptionItem: cell)
        //performSegue(withIdentifier: "adoptionDetail", sender: cell)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print("prepare for segue reached")
        if segue.identifier == "adoptionDetail" {
            print("segue identifier reached")
            let nextScene = segue.destination as? AdoptionDetailViewController
            let indexPath = self.tableView.indexPathForSelectedRow!
            let row = indexPath.row
            let section = indexPath.section
            let selectedAdoption = adoptionItems.items[section][row]
            nextScene?.selectedAdoption = selectedAdoption
            print(selectedAdoption.name)
            //print(nextScene?.selectedAdoption)
            //print(selectedAdoption.name)
            
        }
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

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = indexPath.row
        let section = indexPath.section
        let selectedAdoption = adoptionItems.items[section][row]
        //delegate.didSelectMenuItem(controller: self, adoptionItem: selectedAdoption)
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        //let row = indexPath.row
        //let section = indexPath.section
        let adoptionItem = adoptionItems.items[section][row]
        cell.textLabel?.text = adoptionItem.name
        cell.detailTextLabel?.text = adoptionItem.address
        return cell
    }
}
