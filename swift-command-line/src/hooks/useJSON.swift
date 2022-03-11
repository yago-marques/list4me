//
//  JSON.swift
//  swift-command-line
//
//  Created by Yago Marques on 10/03/22.
//

import Foundation

func getPathForDatabase() -> URL {
    let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    let directoryURL = documentsDirectory.appendingPathComponent("lazy-todo")
    return directoryURL.appendingPathComponent("data.json")
}

func createDataDirectory() -> Void {
    let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    let directoryURL = documentsDirectory.appendingPathComponent("lazy-todo")
    do {
        try FileManager.default.createDirectory(at: directoryURL, withIntermediateDirectories: false, attributes: nil)
        return
    } catch {
        return
    }
}

func createData(data: Data) -> Void {
    let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    let directoryURL = documentsDirectory.appendingPathComponent("lazy-todo")
    let newFilePath = directoryURL.appendingPathComponent("data.json")
    do {
        try data.write(to: newFilePath)
        return
    } catch {
        print("here")
        return
    }
}

func startJSON(json: [Activity]){
    for activity in json {
        useActivityForJSON(
            title: activity.title,
            category: activity.category,
            deadline: activity.deadline,
            id: activity.id,
            createdAt: activity.createdAt,
            done: activity.done
        )
    }
}

func useJSON() -> [Activity] {
    
    var myJSONData: Data

    if FileManager.default.fileExists(atPath: getPathForDatabase().path) {
        myJSONData = try! Data(contentsOf: getPathForDatabase())
    } else {
        createDataDirectory()
        let firstActivity = listenActivity()
        let arr = [firstActivity]
        let jsonData = try! JSONEncoder().encode(arr)
        createData(data: jsonData)
        myJSONData = try! Data(contentsOf: getPathForDatabase())
    }

    let jsonObject: [[String: Any]] = try! JSONSerialization.jsonObject(with: myJSONData, options: []) as! [[String : Any]]
    
    let activities: [Activity] = jsonObject.map { Activity($0) }
    startJSON(json: activities)
    
    return activities
    
}
