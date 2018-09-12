//
//  AddItemTVC.swift
//  BucketList
//
//  Created by Amanda Demetrio on 9/11/18.
//  Copyright © 2018 Amanda Demetrio. All rights reserved.
//

import UIKit

class AddItemTVC: UITableViewController {
    
    weak var delegate: AddItemTVCDelegate?
    
    var item: String?
    var indexPath: NSIndexPath?
    
    @IBOutlet weak var itemTextField: UITextField!
    
    @IBAction func cancelButtonPressed(_ sender: UIBarButtonItem) {
        delegate?.cancelForTVC(self, didPressCancelButton: sender)
    }
    
    
    @IBAction func doneBarButtonPressed(_ sender: UIBarButtonItem) {
        delegate?.addItemViewController(self, didFinishAddingItem: itemTextField.text!, at: indexPath)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        itemTextField.text = item
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

}
