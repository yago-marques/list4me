//
//  useDatabase.swift
//  swift-command-line
//
//  Created by Yago Marques on 11/03/22.
//

import Foundation

func startJSON(json: [Activity]){
    for activity in json {
        useActivityWithCategory(
            title: activity.title,
            category: activity.category,
            deadline: activity.deadline
        )
    }
}

func useDatabase() {
    let firstActivity = listenActivity()
    let arr = [firstActivity]
    let jsonData = try! JSONEncoder().encode(arr)
    createData(data: jsonData)
}

