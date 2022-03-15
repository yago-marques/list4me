//
//  JSON.swift
//  swift-command-line
//
//  Created by Yago Marques on 10/03/22.
//

import Foundation

func getPathForDatabase() -> URL {
    let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    let directoryURL = documentsDirectory.appendingPathComponent("List4Me")
    return directoryURL.appendingPathComponent("data.json")
}

func createDataDirectory() -> Void {
    let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    let directoryURL = documentsDirectory.appendingPathComponent("List4Me")
    do {
        try FileManager.default.createDirectory(at: directoryURL, withIntermediateDirectories: false, attributes: nil)
        return
    } catch {
        return
    }
}

func createData(data: Data) -> Void {
    let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    let directoryURL = documentsDirectory.appendingPathComponent("List4Me")
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
            context: activity.context,
            tasks: activity.tasks
        )
    }
}

func useJSON() -> [Activity] {
    
    var myJSONData: Data

    if FileManager.default.fileExists(atPath: getPathForDatabase().path) {
        myJSONData = try! Data(contentsOf: getPathForDatabase())
        let activities = try! JSONDecoder().decode([Activity].self, from: myJSONData)
        startJSON(json: activities)
    } else {
        createDataDirectory()
        let firstActivity = listenActivity()
        let arr = [firstActivity]
        let jsonData = try! JSONEncoder().encode(arr)
        createData(data: jsonData)
        myJSONData = try! Data(contentsOf: getPathForDatabase())
    }
    
    let activities = try! JSONDecoder().decode([Activity].self, from: myJSONData)
    
    return activities
    
}
