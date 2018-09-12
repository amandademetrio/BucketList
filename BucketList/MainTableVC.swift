//
//  MainTableVC.swift
//  BucketList
//
//  Created by Amanda Demetrio on 9/11/18.
//  Copyright © 2018 Amanda Demetrio. All rights reserved.
//

import UIKit

class MainTableVC: UITableViewController, AddItemTVCDelegate {
    
    var items: [String] = ["Get Alfie a bikini","Get Alfie a big sombrero","Get Alfie more bones"]
    
    @IBAction func AddButtonPressed(_ sender: UIBarButtonItem) {
        performSegue(withIdentifier: "FirstToSecondSegue", sender: sender)
    }
    
    override func viewDidLoad() {
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
        cell.textLabel?.text = items[indexPath.row]
        return cell
    }
    
//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        performSegue(withIdentifier: "EditItemSegue", sender: indexPath)
//    }
    
    //Adding accessory and detail button
    override func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        performSegue(withIdentifier: "EditItemSegue", sender: indexPath)
    }
    
    //swipe to delete
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        items.remove(at: indexPath.row)
        tableView.reloadData()
    }
    
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
            addItemTVC.item = item
            addItemTVC.indexPath = indexPath
        }
        
    }
    
//      before refactoring
//      override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//
//        if segue.identifier == "FirstToSecondSegue" {
//            let navigationController = segue.destination as! UINavigationController
//            let addItemTVC = navigationController.topViewController as! AddItemTVC
//            addItemTVC.delegate = self as AddItemTVCDelegate
//        }
//
//        else if segue.identifier == "EditItemSegue" {
//            let navigationController = segue.destination as! UINavigationController
//            let addItemTVC = navigationController.topViewController as! AddItemTVC
//            addItemTVC.delegate = self as AddItemTVCDelegate
//            let indexPath = sender as! NSIndexPath
//            let item = items[indexPath.row]
//            addItemTVC.item = item
//            addItemTVC.indexPath = indexPath
//        }
//
//    }

//    func cancelButtonPressed(by controller: UIViewController) {
//        dismiss(animated: true, completion: nil)
//    }
    
    func addItemViewController(_ controller: AddItemTVC, didFinishAddingItem item: String, at indexPath: NSIndexPath?) {
        
        dismiss(animated: true, completion: nil)
        
        if let ip = indexPath  {
            items[ip.row] = item
            tableView.reloadData()
        }
        else {
            items.append(item)
            tableView.reloadData()
        }
    }
    
    func cancelForTVC(_ controller: AddItemTVC, didPressCancelButton button: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }


}
