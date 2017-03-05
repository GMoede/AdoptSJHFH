//
//  AdoptionTableViewController.swift
//  AdoptSJ
//
//  Created by Steven Booth on 3/4/17.
//  Copyright (c) 2017 Steven Booth. All rights reserved.
//

import UIKit
import RealmSwift


//static adoptionItems:AdoptionItem = nil

class AdoptionTableViewController: UITableViewController {
    let adoptionList = AdoptionItems()
   // myOrder.append
    //let adoptionItems = SpecificMenuItems()
    /*
    AdoptionItems.addSection(section: "Approved", item: [
    AdoptionItem(name:"Grandmas Cottage",address:"755 Locust Street", desc: "Cool Place")
    ])
    */
    override func viewDidLoad() {
        super.viewDidLoad()
        let testItem1: AdoptionItem = AdoptionItem()
        testItem1.name = "Brick House"
        testItem1.address = "755 Locust Street"
        testItem1.desc = "Cool place to be. We got two nicks here right now which is right crazy dog."
        testItem1.status = "Pending"
        adoptionList.items.append(testItem1)

    }
    
    /*override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        //delegate.didSelectMenuItem(controller: self, adoptionItem: cell)
        //performSegue(withIdentifier: "adoptionDetail", sender: cell)
    }*/
    /*
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return adoptionList.items[section].status
        //return menuItems.sections[section]
    }
 */

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print("prepare for segue reached")
        if segue.identifier == "adoptionDetail" {
            print("segue identifier reached")
            //let nextSceneNav = segue.destination as! UINavigationController
            let nextScene = segue.destination as! AdoptionDetailViewController
            let indexPath = self.tableView.indexPathForSelectedRow!
            let row = indexPath.row
            //let section = indexPath.section
            let selectedAdoption = adoptionList.items[row]
            nextScene.selectedAdoption = selectedAdoption
            print(selectedAdoption.name)
            //print(nextScene?.selectedAdoption)
            //print(selectedAdoption.name)
            let backItem = UIBarButtonItem()
            backItem.title = "Back"
            nextScene.navigationController?.navigationItem.backBarButtonItem = backItem
            
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // Return the number of sections.
        return 2
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        // Return the number of rows in the section.
        if (section == 0){
            return adoptionList.items.filter("status contains 'Pending'").count
        }
        else {
            return adoptionList.items.filter("status contains 'Approved'").count
        }
    }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if (section == 0){
            return "Pending"
        } else {
            return "Approved"
        }
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = indexPath.row
        //let section = indexPath.section
        let adoptionItem = adoptionList.items[row]
        //let selectedAdoption = adoptionItems.items[section][row]
        //delegate.didSelectMenuItem(controller: self, adoptionItem: selectedAdoption)
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        //let row = indexPath.row
        //let section = indexPath.section
        //let adoptionItem = adoptionItems.items[section][row]
        cell.textLabel?.text = adoptionItem.name
        cell.detailTextLabel?.text = adoptionItem.address
        return cell
    }
}
