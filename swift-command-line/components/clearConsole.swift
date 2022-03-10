//
//  clearConsole.swift
//  swift-command-line
//
//  Created by Yago Marques on 09/03/22.
//

import Foundation

func clear(){
    print("clear", terminator: Array(repeating: "\n", count: 50).joined())
}
