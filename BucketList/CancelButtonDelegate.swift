//
//  cancelButtonDelegate.swift
//  BucketList
//
//  Created by Amanda Demetrio on 9/11/18.
//  Copyright © 2018 Amanda Demetrio. All rights reserved.
//

import Foundation
import UIKit

protocol CancelButtonDelegate: class {
    func cancelButtonPressed(by controller: UIViewController)
}
