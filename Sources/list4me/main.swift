//
//  main.swift
//  swift-command-line
//
//  Created by Yago Marques on 03/03/22.
//

import Foundation


func main() {
    
    let _ = useJSON()
    let option = useMenu()
    switch option {
    case 1:
        postTask()
    case 2:
        deleteTask()
    case 3:
        deleteContext()
    case 4:
        putTask()
    case 5:
        getTasks()
    case 6:
        taskAsDone()
    case 0:
        return
    default:
        print("error")
    }
    
}

main()

