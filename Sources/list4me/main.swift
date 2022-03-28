//
//  main.swift
//  swift-command-line
//
//  Created by Yago Marques on 03/03/22.
//

import Foundation


func main() {
    
    let _ = useJSON()
    
    var repeatAgain = true
    
    repeat {
    let option = useMenu()
    switch option {
        case 1:
            postTask()
            repeatAgain = getBool("Deseja voltar ao menu? [y/n]")
        case 2:
            deleteTask()
            repeatAgain = getBool("Deseja voltar ao menu? [y/n]")
        case 3:
            deleteContext()
            repeatAgain = getBool("Deseja voltar ao menu? [y/n]")
        case 4:
            putTask()
            repeatAgain = getBool("Deseja voltar ao menu? [y/n]")
        case 5:
            getTasks()
            repeatAgain = getBool("Deseja voltar ao menu? [y/n]")
        case 6:
            taskAsDone()
            repeatAgain = getBool("Deseja voltar ao menu? [y/n]")
        case 0:
            repeatAgain = false
            return
        default:
            print("error")
        }
    } while repeatAgain
    
}

main()

