//
//  Students.swift
//  MyCreditManager
//
//  Created by 이재훈 on 2023/04/19.
//

import Foundation

enum Response {
    case success // 성공
    case duplication // 학생 중복
    case notExist // 학생 존재하지 않음
}

class StudentsManager {
    var person: [Student] = []
    
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
            person.remove(at: person.distance(from: person.startIndex, to: removeIndex))
            return .success
        } else {
            return .notExist
        }
    }
    
    func addSubject(name: String, subject: String, rating: String)->Response {
        guard let findIndex = person.firstIndex(where: {$0.name == name}) else {return .notExist}
        let personIndex = person.distance(from: person.startIndex, to: findIndex)
        person[personIndex].credits.updateValue(rating, forKey: subject)
        return .success
    }
    
    func removeSubject(name: String, subject: String)->Response {
        guard let findIndex = person.firstIndex(where: {$0.name == name}) else {return .notExist}
        let personIndex = person.distance(from: person.startIndex, to: findIndex)
        person[personIndex].credits.removeValue(forKey: subject)
        return .success
    }
    
    func viewRatings(name: String)->Response {
        guard let findIndex = person.firstIndex(where: {$0.name == name}) else {return .notExist}
        let personIndex = person.distance(from: person.startIndex, to: findIndex)
        printRating(student: person[personIndex])
        return .success
    }
    
    private func printRating(student: Student) {
        guard 0 != student.credits.count else {return}
        let credits = student.credits
        
        credits.forEach{
            print("\($0.key): \($0.value)")
        }
        var rating:Float = 0
        credits.forEach{
            switch $0.value {
            case "A+":
                rating += 4.5
            case "A":
                rating += 4.0
            case "B+":
                rating += 3.5
            case "B":
                rating += 3.0
            case "C+":
                rating += 2.5
            case "C":
                rating += 2.0
            case "D+":
                rating += 1.5
            case "D":
                rating += 1.0
            case "F":
                rating += 0
            default:fatalError("잘못된 성적입니다.")
            }
        }
        print(String(format: "평점 : %.2f", rating/Float(credits.count)))
    }
}
