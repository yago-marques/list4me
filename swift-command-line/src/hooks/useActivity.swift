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
    
    init(
        title: String,
        category: String,
        deadline: String
    ) {
        self.title = title
        self.category = category
        self.deadline = deadline
    }
    
    init(
        title: String,
        category: String,
        deadline: String,
        id: Int,
        createdAt: String,
        done: Bool
    ) {
        self.title = title
        self.category = category
        self.deadline = deadline
        self.id = id
        self.createdAt = createdAt
        self.done = done
    }
    
    init(_ dict: [String: Any]) {
        //mapear cada chave:valor para os atributos
        self.title = dict["title"] as! String
        self.category = dict["category"] as! String
        self.deadline = dict["deadline"] as! String
        self.id = dict["id"] as! Int
    }
}

func useCategory(_ evaluations: (importance: Int, urgency: Int)) -> String {
    switch evaluations {
        case let (i, u) where i > 5 && u > 5:
        return "⭐⭐⭐⭐⭐"
        case let (i, u) where i > 5 && u <= 5:
        return "⭐⭐⭐⭐"
        default:
        return "Error"
    }
}

func useActivity(
    title: String,
    evaluations: (importance: Int, urgency: Int),
    deadline: String
) {
    let newActivity = Activity(title: title, category: useCategory(evaluations), deadline: deadline)
    Activities.append(newActivity)
}

func useActivityForJSON(
    title: String,
    category: String,
    deadline: String,
    id: Int,
    createdAt: String,
    done: Bool
) {
    let newActivity = Activity(
        title: title,
        category: category,
        deadline: deadline,
        id: id,
        createdAt: createdAt,
        done: done
    )
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

func listenActivity() -> Activity {
    let title = getString("Título atividade: ")
    let deadline = getString("DeadLine: ")
    let importance = getInt("Importancia: ")
    let urgency = getInt("Urgência: ")
    useActivity(
        title: title,
        evaluations: (importance: importance, urgency: urgency),
        deadline: deadline
    )
    return Activities[Activities.endIndex-1]
}

//let data = try? JSONEncoder().encode(Activities)
//ler data do file manager
//let activitiesData = try? JSONDecoder.decode([Activity].self, from: data)
