//
//  activityManagement.swift
//  swift-command-line
//
//  Created by Yago Marques on 10/03/22.
//

import Foundation

struct Task: Codable {
    var done: Bool
    var deadline: String
    var title: String
    var category: String
    let createdAt: String
}

struct Activity: Codable {
    var context: String
    var tasks: [Task]
}

var Activities: [Activity] = []

func useCategory(_ evaluations: (importance: Int, urgency: Int)) -> String {
    switch evaluations {
    case let (i, u) where i > 5 && u > 5:
        return "⭐⭐⭐⭐⭐"
    case let (i, u) where i > 5 && u <= 5:
        return "⭐⭐⭐⭐"
    case let (i, u) where i <= 5 && u > 5:
        return "⭐⭐⭐⭐"
    case let (i, u) where i == 5 && u == 5:
        return "⭐⭐⭐"
    case let (i, u) where i < 5 && u < 5:
        return "⭐⭐"
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
                category: useCategory((importance: evaluations.importance, urgency: evaluations.urgency)),
                createdAt: getCurrentDate()
            )
        ]
    )
    
    Activities.append(newActivity)
}

func useActivityWithTask(
    context: String,
    task: Task
){
    let newActivity = Activity(
        context: context,
        tasks: [task]
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
                category: task.category,
                createdAt: task.createdAt)
        )
    }
    let newActivity = Activity(
        context: context,
        tasks: tasksToAppend
    )
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
    let deadline = getString("Data limite: ")
    let importance = getInt("Importancia: [0...10]")
    let urgency = getInt("Urgência: [0...10]")
    useActivity(
        context: context,
        title: title,
        evaluations: (importance: importance, urgency: urgency),
        deadline: deadline
    )
    return Activities[Activities.endIndex-1]
}

func verifyIfIsTaskOrActivity() -> (Int, String) {
    let currentContext = getContext()
    for activity in Activities {
        if activity.context == currentContext {
            return (1, currentContext)
        }
    }
    return (0, currentContext)
}

func choosePropertyToUptade() -> Int{
    let propertyMenu = """
    
    (1) - Contexto
    (2) - Tarefa
    
    """
    
    print(propertyMenu)
    var option = 0
    repeat {
        option = getInt("Escolha a propriedade para alterar")
    } while option != 1 && option != 2
    
    return option
}

func choosePropertyToUpdateInTask() -> Int{
    let propertyMenu = """
    
    (1) - Categoria(estrelas)
    (2) - Título
    (3) - Data limite
    
    """
    print(propertyMenu)
    var option = 0
    repeat {
        option = getInt("\nDigite a propriedade para ser alterada\n")
    } while option != 1 && option != 2 && option != 3
    return option
}

//let data = try? JSONEncoder().encode(Activities)
//ler data do file manager
//let activitiesData = try? JSONDecoder.decode([Activity].self, from: data)
