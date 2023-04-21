//
//  Student.swift
//  MyCreditManager
//
//  Created by 이재훈 on 2023/04/19.
//

import Foundation

struct Student {
    var name: String
    var credits: [String: String] = [:]
    
    init(name: String) {
        self.name = name
    }
}
