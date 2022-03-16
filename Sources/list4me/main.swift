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
        postActivity()
    case 2:
        deleteActivity()
    default: print("error")
    }
    
}

main()

