//
//  activityManagement.swift
//  swift-command-line
//
//  Created by Yago Marques on 10/03/22.
//

import Foundation

var Activities: [Activity] = []

func getCurrentDate() -> String {
    let date = Date()
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "dd.MM.yyyy"
    let result = dateFormatter.string(from: date)
    return result
}

class Activity: Codable {
    var title = String()
    var category = String()
    var createdAt = getCurrentDate()
    var deadline = String()
    var done = false
    var id = Int.random(in: 100000...999999)
}

func useCategory(_ evaluations: (importance: Int, urgency: Int)) -> String {
    switch evaluations {
        case let (i, u) where i > 5 && u > 5:
        return "⭐⭐⭐⭐⭐"
        case let (i, u) where i > 5 && u <= 5:
        return "⭐⭐⭐"
        default:
        return "Error"
    }
}

func useActivity(
    title: String,
    evaluations: (importance: Int, urgency: Int),
    deadline: String
) {
    let newActivity = Activity()
    newActivity.deadline = deadline
    newActivity.title = title
    newActivity.category = useCategory(evaluations)
    Activities.append(newActivity)
}

func getActivity(index: Int){
    let thisActivity = Activities[index]
    let labels: [String] = [
        "Title",
        "Deadline",
        "Done"
    ]
    let fields: [Any] = [
        thisActivity.title,
        thisActivity.deadline,
        thisActivity.done,
    ]

    print("==\(thisActivity.category)==ID-\(thisActivity.id)")
    for i in 0...2 {
        print("\(labels[i]): \(fields[i])")
    }
    print("==CreatedAt-\(thisActivity.createdAt)")
    print("")
}


let data = try? JSONEncoder().encode(Activities)
//ler data do file manager
//let activitiesData = try? JSONDecoder.decode([Activity].self, from: data)
