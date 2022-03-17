//
//  useDatabase.swift
//  swift-command-line
//
//  Created by Yago Marques on 11/03/22.
//

import Foundation

func postTask() {
    let (code, context) = verifyIfIsTaskOrActivity()
    
    switch code {
    case 1:
        let newTask = listenTask()
        useTask(
            context: context,
            newTask: newTask
        )
        POST(data: Activities)
        
    case 0:
        let newTask = listenTask()
        useActivityWithTask(
            context: context,
            task: newTask
        )
        POST(data: Activities)
        
    default: print("error")
    }

}

func deleteTask(){
    let context = chooseContextWithdrawCreateOption()
    
    let (contextIndex, tasksIndexRange) = chooseTaskConfig(context: context)
    print("")
    print("Escolha a tarefa para ser removida: ")
    for taskIndex in tasksIndexRange {
        print("==TAREFA (\(taskIndex+1))==")
        getTask(context: contextIndex, task: taskIndex)
    }
    var taskNumberIsValid = false
    var taskNumber = Int()
    
    repeat{
        taskNumber = getInt("Digite o número da tarefa")
        for validTaskNumber in tasksIndexRange{
            if taskNumber == validTaskNumber+1 {
                taskNumberIsValid = true
            }
        }
    } while !taskNumberIsValid
    
    Activities[contextIndex].tasks.remove(at: taskNumber-1)
    
    if Activities[contextIndex].tasks.isEmpty {
        deleteThisContext(context: context)
    }
        
    POST(data: Activities)
}

func deleteContext() {
    let context = chooseContextWithdrawCreateOption()
    var indexToRemove = Int()
    for i in 0..<Activities.count {
        if context == Activities[i].context {
            indexToRemove = i
        }
    }
    Activities.remove(at: indexToRemove)
    POST(data: Activities)
}

func deleteThisContext(context: String) {
    var indexToRemove = Int()
    for i in 0..<Activities.count {
        if context == Activities[i].context {
            indexToRemove = i
        }
    }
    Activities.remove(at: indexToRemove)
    POST(data: Activities)
}

func putTask() {
    let option = choosePropertyToUptade()
    let context = chooseContextWithdrawCreateOption()
    switch option {
    case 1:
        let newNameForContext = getString("Novo nome para o contexto: ")
        var indexOfContext = Int()
        for i in 0..<Activities.count {
            if Activities[i].context == context {
                indexOfContext = i
            }
        }
        Activities[indexOfContext].context = newNameForContext
        POST(data: Activities)
    case 2:
        var indexContext = Int()
        var indexTask = Int()
        for i in 0..<Activities.count {
            if Activities[i].context == context {
                indexContext = i
                for j in 0..<Activities[i].tasks.count {
                    print("==TAREFA (\(j+1))==")
                    getTask(
                        context: i,
                        task: j
                    )
                }
            }
        }
        
    default:
        print("error")
    }
}

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

