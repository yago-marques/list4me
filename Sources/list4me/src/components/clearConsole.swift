//
//  clearConsole.swift
//  swift-command-line
//
//  Created by Yago Marques on 09/03/22.
//

import Foundation
import Commands

func clear() -> Void {
    Commands.Bash.system("ls")
}
