//
//  AddItemTVCDelegate.swift
//  BucketList
//
//  Created by Amanda Demetrio on 9/11/18.
//  Copyright © 2018 Amanda Demetrio. All rights reserved.
//

import Foundation
import UIKit

protocol AddItemTVCDelegate: class {
    
    func addItemViewController(_ controller: AddItemTVC, didFinishAddingItem item: String, at indexPath: NSIndexPath?)
    
    func cancelForTVC(_ controller: AddItemTVC, didPressCancelButton button: UIBarButtonItem)
    
}
