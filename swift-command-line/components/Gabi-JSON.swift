//
//  Gabi-JSON.swift
//  swift-command-line
//
//  Created by Yago Marques on 10/03/22.
//

import Foundation

class Person: Codable {
    let name: String
    let description: String
    
    init(withName name: String, withDescription desc: String) {
        self.name = name
        self.description = desc
    }
    
    init(_ dict: [String : String]) {
        self.name = dict["name"]!
        self.description = dict["description"]!
    }
}


/*
 {
   "name": "foo",
   "description": "aaaa"
 }
 */

func handlingJSON() {
    
    // BACKEND
    let jsonString = #"""
 {
   "name": "foo",
   "description": "aaaa"
 }
"""#
    let data: Data = jsonString.data(using: .utf8)!
    
    // CLIENT
    
    // MARK: - Decode
    // JSONSerialization
    if let dict = try? JSONSerialization.jsonObject(with: data, options: .fragmentsAllowed) as? [String : String] {
        
        print(dict.description)
        
        let person = Person(dict)
        print(person.name)
    }
    
    // Codable -> Decodable
    do {
        let person = try JSONDecoder().decode(Person.self, from: data)
        print(person.name)
    } catch {
        print(error)
    }
    
    // MARK: - Encode
    
    // CLIENT
    let personToSave = Person(withName: "Gabi", withDescription: "AAAA")
    
    // JSONSerialization
    do {
        let dataToSave = try! JSONSerialization.data(withJSONObject: personToSave)
        try dataToSave.write(to: getPathForDatabase())
    } catch {
        print(error)
    }
    
    // Codable -> Encodable
    do {
        let dataToSave = try JSONEncoder().encode(personToSave)
        try! dataToSave.write(to: getPathForDatabase())
    } catch {
        print(error)
    }
}
