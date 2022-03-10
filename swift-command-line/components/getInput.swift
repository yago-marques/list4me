//
//  getInput.swift
//  swift-command-line
//
//  Created by Yago Marques on 09/03/22.
//

import Foundation

func verifyNil(message: String) -> String {
    print(message)
    let input: String? = readLine()
    if let inputToSend = input {
        return inputToSend
    }else {
        return String()
    }
}

func getString(_ msg: String) -> String{
    return verifyNil(message: msg)
}

func getInt(_ msg: String) -> Int {
    let possibleNumber = verifyNil(message: msg)
    if let number = Int(possibleNumber) {
        return number
    } else {
        return Int()
    }
}

func getDouble(_ msg: String) -> Double {
    let possibleNumber = verifyNil(message: msg)
    if let number = Double(possibleNumber) {
        return number
    } else {
        return Double()
    }
}

func getBool(_ msg: String) -> Bool{
    let possibleBool = verifyNil(message: msg)
    switch possibleBool {
        case "y", "yes" : return true
        case "n", "not" : return false
        default : return Bool()
    }
}
