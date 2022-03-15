//
//  activityManagement.swift
//  swift-command-line
//
//  Created by Yago Marques on 10/03/22.
//

import Foundation

struct Task: Codable {
    let done: Bool
    let deadline: String
    let title: String
    let id: Int
    let category: String
    let createdAt: String
}

struct Activity: Codable {
    let context: String
    var tasks: [Task]
}

var Activities: [Activity] = []

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
    context: String,
    title: String,
    evaluations: (importance: Int, urgency: Int),
    deadline: String
) {
    let newActivity = Activity(
        context: context,
        tasks: [
            Task(
                done: false,
                deadline: deadline,
                title: title,
                id: uuid(),
                category: useCategory((importance: evaluations.importance, urgency: evaluations.urgency)),
                createdAt: getCurrentDate()
            )
        ]
    )
    
    Activities.append(newActivity)
}

func useActivityForJSON(
    context: String,
    tasks: [Task]
) {
    let context = context
    var tasksToAppend: [Task] = []
    for task in tasks {
        tasksToAppend.append(
            Task(
                done: task.done,
                deadline: task.deadline,
                title: task.title,
                id: task.id,
                category: task.category,
                createdAt: task.createdAt)
        )
    }
    let newActivity = Activity(context: context, tasks: tasksToAppend)
    Activities.append(newActivity)
}

func listenActivity() -> Activity {
    var context = String()
    if !Activities.isEmpty {
        context = getContext()
    } else {
        context = getFirstContext()
    }
    
    let title = getString("Título atividade: ")
    let deadline = getString("DeadLine: ")
    let importance = getInt("Importancia: ")
    let urgency = getInt("Urgência: ")
    useActivity(
        context: context,
        title: title,
        evaluations: (importance: importance, urgency: urgency),
        deadline: deadline
    )
    return Activities[Activities.endIndex-1]
}

//let data = try? JSONEncoder().encode(Activities)
//ler data do file manager
//let activitiesData = try? JSONDecoder.decode([Activity].self, from: data)