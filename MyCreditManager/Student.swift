//
//  Student.swift
//  MyCreditManager
//
//  Created by 이재훈 on 2023/04/19.
//

import Foundation

struct Student {
    var name: String
    var credits: [String: String] = [:] {
        didSet {
            print(name, credits)
        }
    }
    
    init(name: String) {
        self.name = name
    }
    
    func printRating() {
        guard 0 != self.credits.count else {return}
        
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
