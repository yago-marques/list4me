//
//  main.swift
//  swift-command-line
//
//  Created by Yago Marques on 03/03/22.
//

import Foundation

var db = useJSON()

//pushListenActivity()

for i in 0..<db.count {
    getActivity(index: i)
}
