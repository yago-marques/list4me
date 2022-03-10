//
//  main.swift
//  swift-command-line
//
//  Created by Yago Marques on 03/03/22.
//

import Foundation

enum Calculator {
    case add, sub, mul, div
}

let n1 = getInt("digite um número: ")
let n2 = getInt("digite outro número: ")
let op = getString("operação: ")

switch op {
case "+" : print(n1+n2)
case "-" : print(n1-n2)
case "*" : print(n1*n2)
case "/" : print(n1/n2)
default : print("error")
}
// switch
