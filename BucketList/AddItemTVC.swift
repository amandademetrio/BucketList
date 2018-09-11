//
//  AddItemTVC.swift
//  BucketList
//
//  Created by Amanda Demetrio on 9/11/18.
//  Copyright © 2018 Amanda Demetrio. All rights reserved.
//

import UIKit

class AddItemTVC: UITableViewController {
    
    weak var delegate: CancelButtonDelegate?
    
    @IBAction func cancelButtonPressed(_ sender: UIBarButtonItem) {
        delegate?.cancelButtonPressed(by: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
