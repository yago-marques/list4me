//
//  File.swift
//  
//
//  Created by Yago Marques on 15/03/22.
//

import Foundation
import Commands


func useMenu() -> Int {
    var option = 10
    
    let menuOptions = """
    (1) - Adicionar nova tarefa
    (2) - Remover uma tarefa
    (3) - Remover um contexto
    (4) - Atualizar uma atividade
    (5) - Listar tarefas
    (6) - Marcar tarefa como concluida
    (0) - Sair
    """
    let secondMenuOptions = """
    (1) - Adicionar nova tarefa
    (0) - Sair
    """
    
    if Activities.isEmpty {
        
        repeat {
            Commands.Bash.system("clear")
            print(secondMenuOptions)
            option = getInt("Acessar: ")
        } while option != 0 && option != 1
        
        return option
        
    } else {
        
        repeat {
            Commands.Bash.system("clear")
            print(menuOptions)
            option = getInt("Acessar: ")
        } while option != 0 && option != 1 && option != 2 && option != 3 && option != 4 && option != 5 && option != 6
        
        return option
        
    }
}
