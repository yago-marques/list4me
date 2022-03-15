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
    let res = getInt("Escolha o contexto da atividade")
    if res == 0 {
        let newContext = createContext()
        return newContext
    } else {
        let context = Activities[res-1].context
        return context
    }
}

func getFirstContext() -> String {
    let res = getString("Digite seu primeiro contexto: ")
    return res
}

func createContext() -> String {
    let newContext = getString("Digite o novo contexto: ")
    return newContext
}
