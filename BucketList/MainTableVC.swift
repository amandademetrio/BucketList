//
//  MainTableVC.swift
//  BucketList
//
//  Created by Amanda Demetrio on 9/11/18.
//  Copyright © 2018 Amanda Demetrio. All rights reserved.
//

import UIKit
import CoreData

class MainTableVC: UITableViewController, AddItemTVCDelegate {
    
    var items = [BucketListItem]()
    
    //@IBOutlet var tableView: UITableView!
    
    //Stagging area for stuff to be added to Core Data
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    let saveContext = (UIApplication.shared.delegate as! AppDelegate).saveContext
    
    @IBAction func AddButtonPressed(_ sender: UIBarButtonItem) {
        performSegue(withIdentifier: "FirstToSecondSegue", sender: sender)
    }
    
    override func viewDidLoad() {
        TaskModel.getAllTasks() {
            data, response, error in
            do {
                if let tasks = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as? NSDictionary {
                    if let results = tasks["items"] {
                        for item in (results as? NSArray)! {
                            let newItem = BucketListItem(context: self.context)
                            newItem.text = (item as? NSDictionary)!["name"] as? String
                            self.items.append(newItem)
                            self.saveContext()
                        }
                    }
                }
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            } catch {
                print(error)
            }
        }
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath)
        cell.textLabel?.text = items[indexPath.row].text!
        return cell
    }
    
    //Adding accessory and detail button
//    override func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
//        performSegue(withIdentifier: "EditItemSegue", sender: indexPath)
//    }
    
    //swipe to delete
//    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
//        let i = items[indexPath.row]
//        //context.delete(i)
//        //items.remove(at: indexPath.row)
//        //saveContext()
//        tableView.reloadData()
//    }
    
    //after refactoring
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        if sender is UIBarButtonItem {
            let navigationController = segue.destination as! UINavigationController
            let addItemTVC = navigationController.topViewController as! AddItemTVC
            addItemTVC.delegate = self as AddItemTVCDelegate
        }

        else if sender is IndexPath {
            let navigationController = segue.destination as! UINavigationController
            let addItemTVC = navigationController.topViewController as! AddItemTVC
            addItemTVC.delegate = self as AddItemTVCDelegate
            let indexPath = sender as! NSIndexPath
            let item = items[indexPath.row]
            addItemTVC.item = item.text!
            addItemTVC.indexPath = indexPath
        }

    }
    
    func addItemViewController(_ controller: AddItemTVC, didFinishAddingItem item: String, at indexPath: NSIndexPath?) {
        dismiss(animated: true, completion: nil)
//        //if object already exists
//        if let ip = indexPath  {
//            let i = items[ip.row]
//            i.text = item
//            tableView.reloadData()
//        }
//        //adding object to list of objects
//        else {
//            //let i = BucketListItem(context: context)
//            //i.text = item
//            //items.append(i)
//            tableView.reloadData()
//        }
//        //saveContext()
    }
//
    func cancelForTVC(_ controller: AddItemTVC, didPressCancelButton button: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }


}
