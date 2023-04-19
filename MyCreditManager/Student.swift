//
//  Student.swift
//  MyCreditManager
//
//  Created by 이재훈 on 2023/04/19.
//

import Foundation

struct Student {
    var name: String
    var credits: [String: String]?
    
    init(name: String) {
        self.name = name
    }
    
    func printRating() {
        guard let credits = credits else {return}
        
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
        
        //FIXME: 평점 소수점 2자리만 나오게 바꾸기
        print("평점 : \(rating/Float(credits.count))")
    }
}
