//
//  Students.swift
//  MyCreditManager
//
//  Created by 이재훈 on 2023/04/19.
//

import Foundation

enum Response {
    case success
    case duplication
    case notExist
    case getStudent(student: Student)
    case failure
}

class StudentsManager {
    var person: [Student] = []
    
    
    func getStudent(name: String) -> Response {
        if let student = person.filter({$0.name == name}).first {
            return .getStudent(student: student)
        }
        return .failure
    }
    
    func addStudent(name: String) -> Response {
        if !person.contains(where: {$0.name == name}) {
            person.append(Student(name: name))
            return .success
        } else {
            return .duplication
        }
    }
    
    func removeStudent(name: String) -> Response {
        if let removeIndex = person.firstIndex(where: {$0.name == name}) {
            let student = person.remove(at: person.distance(from: person.startIndex, to: removeIndex))
            return .success
        } else {
            return .notExist
        }
    }
    
    func addSubject(name: String, subject: String, rating: String)->Response {
        guard let findIndex = person.firstIndex(where: {$0.name == name}) else {return .notExist}
        let personIndex = person.distance(from: person.startIndex, to: findIndex)
        person[personIndex].credits?.updateValue(subject, forKey: rating)
        return .success
    }
    
    func removeSubject(name: String, subject: String)->Response {
        guard let findIndex = person.firstIndex(where: {$0.name == name}) else {return .notExist}
        let personIndex = person.distance(from: person.startIndex, to: findIndex)
        person[personIndex].credits?.removeValue(forKey: subject)
        return .success
    }
    
    func viewRatings(name: String)->Response {
        guard let findIndex = person.firstIndex(where: {$0.name == name}) else {return .notExist}
        let personIndex = person.distance(from: person.startIndex, to: findIndex)
        person[personIndex].printRating()
        return .success
    }
}
