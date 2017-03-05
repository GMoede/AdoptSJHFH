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
    //var adoptionList = AdoptionItems()
    
   // myOrder.append
    //let adoptionItems = SpecificMenuItems()
    /*
    AdoptionItems.addSection(section: "Approved", item: [
    AdoptionItem(name:"Grandmas Cottage",address:"755 Locust Street", desc: "Cool Place")
    ])
    */
    

    var items = List<AdoptionItem>()
    var notificationToken: NotificationToken!
    var realm: Realm!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Adoptions"
        
       /* do {
           let realm = try Realm()
            let adoptionList = realm.objects(AdoptionItems.self)
        }
        catch let error as NSError{
            fatalError(error.localizedDescription)
        }*/
        
        
        
        let testItem1: AdoptionItem = AdoptionItem()
        testItem1.name = "Brick House"
        testItem1.address = "755 Locust Street"
        testItem1.desc = "Cool place to be. We got two nicks here right now which is right crazy dog."
        testItem1.status = false
        //testItem1.save()
        
        
        
        
        setupRealm()
        try! realm = Realm()
        try! realm.write {
            realm.deleteAll()
        }
        items.append(testItem1)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")

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
            //let indexPath = self.tableView.indexPathForSelectedRow!
            //let row = indexPath.row
            //let section = indexPath.section
            /*do {
                let realm = try Realm()
                let adoptionList = realm.objects(AdoptionItems.self)
                //let selectedAdoption = adoptionList[row]
            }
            catch let error as NSError{
                fatalError(error.localizedDescription)
            }*/
            //let selectedAdoption = adoptionList.items[row]
            //nextScene.selectedAdoption = selectedAdoption
            //print(selectedAdoption.name)
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
    
    var name: String?
    var address: String?
    var desc: String?
    var status: String?
    var dummyItem: AdoptionItem!

    
    func add() {
        
        var addedItem = AdoptionItem()
        addedItem = dummyItem
        //addedItem.name = name
        //addedItem.address = address
        //addedItem.desc = desc
        //addedItem.status = false
        let items = self.items
        try! items.realm?.write {
            items.insert(addedItem, at: items.filter("status = false").count)
        }
    }
    func setupRealm() {
        // Log in existing user with username and password
        let username = "griffinmoede@gmail.com"  // <--- Update this
        let password = "Happify1996"  // <--- Update this
        SyncUser.logIn(with: .usernamePassword(username: username, password: password, register: false), server: URL(string: "http://127.0.0.1:9080")!) { user, error in
            guard let user = user else {
                fatalError(String(describing: error))
            }
            
            DispatchQueue.main.async {
                // Open Realm
                let configuration = Realm.Configuration(
                    syncConfiguration: SyncConfiguration(user: user, realmURL: URL(string: "realm://127.0.0.1:9080/~/realmtasks")!)
                )
                self.realm = try! Realm(configuration: configuration)
                
                // Show initial tasks
                func updateList() {
                    if self.items.realm == nil, let list = self.realm.objects(AdoptionItems.self).first {
                        self.items = list.items
                    }
                    self.tableView.reloadData()
                }
                updateList()
                
                // Notify us when Realm changes
                self.notificationToken = self.realm.addNotificationBlock { _ in
                    updateList()
                }
            }
        }
    }
    /*deinit {
        notificationToken.stop()
    }*/
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (section == 0){
            return items.count
        } else {
            return 0
        }
        /*
        do {
            //let row = indexPath.row
            let realm = try Realm()
            let adoptionList = realm.objects(AdoptionItem.self)
            //let adoptionItem = adoptionList[row]
            //let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            //cell.textLabel?.text = adoptionItem.name
            //cell.detailTextLabel?.text = adoptionItem.address
            //return cell
            if (section == 0){
                return adoptionList.filter("status contains 'Pending'").count
            }
            else {
                return adoptionList.filter("status contains 'Approved'").count
            }
        }
        catch let error as NSError{
            fatalError(error.localizedDescription)
        }*/
        
        // Return the number of rows in the section.
        
    }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if (section == 0){
            return "Pending"
        } else {
            return "Approved"
        }
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let item = items[indexPath.row]
        cell.textLabel?.text = item.name
        cell.detailTextLabel?.text = item.address
        return cell
        /*
        do {
            let row = indexPath.row
            let realm = try Realm()
            let adoptionList = realm.objects(AdoptionItem.self)
            let adoptionItem = adoptionList[row]
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            cell.textLabel?.text = adoptionItem.name
            cell.detailTextLabel?.text = adoptionItem.address
            return cell
        }
        catch let error as NSError{
            fatalError(error.localizedDescription)
        }*/
        //let row = indexPath.row
        //let section = indexPath.section
        
        //let selectedAdoption = adoptionItems.items[section][row]
        //delegate.didSelectMenuItem(controller: self, adoptionItem: selectedAdoption)
        //let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        //let row = indexPath.row
        //let section = indexPath.section
        //let adoptionItem = adoptionItems.items[section][row]
        //cell.textLabel?.text = adoptionItem.name
        //cell.detailTextLabel?.text = adoptionItem.address
        //return cell
    }
}
