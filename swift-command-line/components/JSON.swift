//
//  JSON.swift
//  swift-command-line
//
//  Created by Yago Marques on 10/03/22.
//

import Foundation

func getPathForDatabase() -> URL {
    let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    print(documentsDirectory)
    let directoryURL = documentsDirectory.appendingPathComponent("MinhaNovaPasta")
    return directoryURL.appendingPathComponent("data.json")
}

func createDataDirectory() -> Void {
    let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    let directoryURL = documentsDirectory.appendingPathComponent("MinhaNovaPasta")
    do {
        try FileManager.default.createDirectory(at: directoryURL, withIntermediateDirectories: false, attributes: nil)
        return
    } catch {
        return
    }
}

func createData(data: Data) -> Bool {
    let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    let directoryURL = documentsDirectory.appendingPathComponent("MinhaNovaPasta")
    let newFilePath = directoryURL.appendingPathComponent("data.json")
    do {
        try data.write(to: newFilePath)
        return true
    } catch {
        return false
    }
}

func useJson() -> [String: String] {
    var myJSONData: Data

    if FileManager.default.fileExists(atPath: getPathForDatabase().path) {
        myJSONData = try! Data(contentsOf: getPathForDatabase())
    } else {
        createDataDirectory()
        var dict = [String: String]()
        dict["empty"] = "empty"
        let jsonData = try! JSONSerialization.data(withJSONObject: dict, options: .fragmentsAllowed)
        createData(data: jsonData)
        myJSONData = try! Data(contentsOf: getPathForDatabase())
    }


    let jsonObject = try! JSONSerialization.jsonObject(with: myJSONData, options: .fragmentsAllowed)
    let jsonData = jsonObject as! [String: String]

    return jsonData
}

//for obj in  jsonData.values {
//    let decoder = JSONDecoder()
//    let apod = try? decoder.decode(APOD.self, from: JSONSerialization.data(withJSONObject: obj))
//
//    print(apod!.random, ",", apod!.other)
//}

