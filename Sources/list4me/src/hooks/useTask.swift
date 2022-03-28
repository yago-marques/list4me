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
    let importance = getInt("Nível de importância: [0...10]")
    let urgency = getInt("Nível de urgência: [0...10]")
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

func taskPropertyToUptade() -> Int {
    let optionsList = """
    ==Qual propriedade da tarefa deseja alterar?==
    (1) - Title
    (2) - Deadline
    (3) - Category
    """
    var option = Int()
    print(optionsList)
    repeat {
        option = getInt("Digite o número da propriedade")
    } while option != 1 && option != 2 && option != 3
    return option
}

func chooseListOption() -> Int {
    let menu = """
    (1) - Tarefas para fazer
    (2) - Tarefas feitas
    (3) - Todas as tarefas
    """
    print(menu)
    var option = Int()
    repeat {
        option = getInt("Escolha uma opção: ")
    } while option != 1 && option != 2 && option != 3
    
    return option
}

func taskAsDone() {
    let context = chooseContextWithdrawCreateOption()
    var indexContext = Int()
    var indexTask = Int()
    for i in 0..<Activities.count {
        if Activities[i].context == context {
            indexContext = i
            for j in 0..<Activities[i].tasks.count {
                if !Activities[i].tasks[j].done {
                    print("==TAREFA (\(j+1))==")
                    getTask(
                        context: i,
                        task: j
                    )
                }
            }
            repeat {
                indexTask = getInt("Escolha a tarefa: ")
            } while indexTask > Activities[i].tasks.count || indexTask == 0
            
            indexTask -= 1
        }
    }
    Activities[indexContext].tasks[indexTask].done = true
    POST(data: Activities)
}
