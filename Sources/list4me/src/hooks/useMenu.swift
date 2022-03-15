//
//  File.swift
//  
//
//  Created by Yago Marques on 15/03/22.
//

import Foundation

func useMenu() -> Int {
    var option = 10
    
    let menuOptions = """
    (1) - Adicionar nova tarefa
    (2) - Remover uma tarefa
    (3) - Atualizar uma tarefa
    (4) - Listar tarefas
    (0) - Sair
    """
    
    repeat {
        print(menuOptions)
        option = getInt("Acessar: ")
    } while option != 0 && option != 1 && option != 2 && option != 3 && option != 4
    
    return option
}
