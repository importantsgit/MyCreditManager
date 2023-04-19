//
//  Students.swift
//  MyCreditManager
//
//  Created by 이재훈 on 2023/04/19.
//

import Foundation

class StudentsManager {
    var person: [Student] = []
    
    func findStudent(name: String) -> Student? {
        return person.filter{$0.name == name}.first
    }
    
    func removeStudent(name: String) {
        if let removeIndex = person.firstIndex{$0.name == name} {}
        person.remove(at: person.distance(from: person.startIndex, to: removeIndex))
    }
}
