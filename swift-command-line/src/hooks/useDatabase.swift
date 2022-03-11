//
//  useDatabase.swift
//  swift-command-line
//
//  Created by Yago Marques on 11/03/22.
//

import Foundation

func pushListenActivity() {
    _ = listenActivity()
    let arr = Activities
    let activity = try! JSONEncoder().encode(arr)
    let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    let directoryURL = documentsDirectory.appendingPathComponent("lazy-todo")
    let newFilePath = directoryURL.appendingPathComponent("data.json")
    do {
        try activity.write(to: newFilePath)
        return
    } catch {
        return
    }
}

