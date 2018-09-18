//
//  TaskModel.swift
//  BucketList
//
//  Created by Amanda Demetrio on 9/17/18.
//  Copyright © 2018 Amanda Demetrio. All rights reserved.
//

import Foundation
class TaskModel {
    static func getAllTasks(completionHandler: @escaping(_ data: Data?, _ response: URLResponse?, _ error: Error?) -> Void) {
        let url = URL(string: "http://localhost:8000/items")
        let session = URLSession.shared
        let task = session.dataTask(with: url!, completionHandler: completionHandler)
        task.resume()
    }
}
