//
//  File.swift
//  
//
//  Created by Yago Marques on 14/03/22.
//

import Foundation

func listenTask() -> Task {
    let title = getString("Título atividade: ")
    let deadline = getString("DeadLine: ")
    let importance = getInt("Importancia: ")
    let urgency = getInt("Urgência: ")
    let newTask = Task(
        done: false,
        deadline: deadline,
        title: title,
        id: uuid(),
        category: useCategory((importance: importance, urgency: urgency)),
        createdAt: getCurrentDate()
    )
    return newTask
}

func useTask(context: String, newTask: Task) {
    for i in 0..<Activities.count {
        if Activities[i].context == context {
            Activities[i].tasks.append(newTask)
        }
    }
}

func getTask(context: Int, task: Int){
    let thisActivity = Activities[context]
    let labels: [String] = [
        "Title",
        "Deadline",
        "Done"
    ]
    let fields: [Any] = [
        thisActivity.tasks[task].title,
        thisActivity.tasks[task].deadline,
        thisActivity.tasks[task].done,
    ]

    print("==\(thisActivity.tasks[task].category)==ID-\(thisActivity.tasks[task].id)")
    for i in 0...2 {
        print("\(labels[i]): \(fields[i])")
    }
    print("==CreatedAt-\(thisActivity.tasks[task].createdAt)")
    print("")
}

func chooseTaskConfig(context: String) -> (Int, [Int]){
    var contextIndex = Int()
    var tasksIndex: [Int] = []
    for i in 0..<Activities.count {
        if Activities[i].context == context {
            contextIndex = i
            for j in 0..<Activities[i].tasks.count {
                tasksIndex.append(j)
            }
        }
    }
    return (contextIndex, tasksIndex)
}
