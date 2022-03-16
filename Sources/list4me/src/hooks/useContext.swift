//
//  useContext.swift
//  swift-command-line
//
//  Created by Yago Marques on 14/03/22.
//

import Foundation

func getContext() -> String{
    print("Contextos existentes: ")
    var index = 1
    for activity in Activities {
        print("(\(index)) - \(activity.context)")
        index += 1
    }
    
    print("(0) - Criar contexto")
    
    var positionIsValid = false
    
    repeat {
        let res = getInt("Escolha o contexto da tarefa")
        if res <= Activities.count {
            positionIsValid = true
            if res == 0 {
                let newContext = createContext()
                return newContext
            } else {
                let context = Activities[res-1].context
                return context
            }
        }
        
    } while !positionIsValid
}

func getFirstContext() -> String {
    let res = getString("Digite seu primeiro contexto: ")
    return res
}

func createContext() -> String {
    let newContext = getString("Digite o novo contexto: ")
    return newContext
}

func chooseContextWithdrawCreateOption() -> String{
    print("Contextos existentes: ")
    var index = 1
    for activity in Activities {
        print("(\(index)) - \(activity.context)")
        index += 1
    }
    
    var positionIsValid = false
    
    repeat {
        let res = getInt("Escolha o contexto da tarefa")
        if res != 0, res <= Activities.count {
            positionIsValid = true
            let context = Activities[res-1].context
            return context
        }
    } while !positionIsValid
}
