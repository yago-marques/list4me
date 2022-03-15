//
//  useDatabase.swift
//  swift-command-line
//
//  Created by Yago Marques on 11/03/22.
//

import Foundation

func POST(data: [Activity]) {
    let activity = try! JSONEncoder().encode(Activities)
    let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    let directoryURL = documentsDirectory.appendingPathComponent("List4Me")
    let newFilePath = directoryURL.appendingPathComponent("data.json")
    do {
        try activity.write(to: newFilePath)
        return
    } catch {
        return
    }
}

func GET(
    context: String,
    filter: String
) {
    switch filter {
    case "todoTasks" :
        for i in 0..<Activities.count{
            if Activities[i].context == context {
                for j in 0..<Activities[i].tasks.count {
                    if !Activities[i].tasks[j].done {
                        getTask(context: i, task: j)
                    }
                }
            }
        }
    default: print("error")
    }
}

//func postActivity() {
//    _ = listenActivity()
//    let arr = Activities
//    let activity = try! JSONEncoder().encode(arr)
//    let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
//    let directoryURL = documentsDirectory.appendingPathComponent("List4Me")
//    let newFilePath = directoryURL.appendingPathComponent("data.json")
//    do {
//        try activity.write(to: newFilePath)
//        return
//    } catch {
//        return
//    }
//}

