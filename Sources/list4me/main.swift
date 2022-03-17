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
    default: print("error")
    }
    
}

main()

