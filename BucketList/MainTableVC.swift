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
        performSegue(withIdentifier: "FirstToSecondSegue", sender: nil)
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let navigationController = segue.destination as! UINavigationController
        let addItemTVC = navigationController.topViewController as! AddItemTVC
        addItemTVC.delegate = self as AddItemTVCDelegate
    }

//    func cancelButtonPressed(by controller: UIViewController) {
//        dismiss(animated: true, completion: nil)
//    }
    
    func addItemViewController(_ controller: AddItemTVC, didFinishAddingItem item: String) {
        dismiss(animated: true, completion: nil)
        items.append(item)
        tableView.reloadData()
    }
    
    func addItemViewController(_ controller: AddItemTVC, didPressCancelButton button: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }


}
