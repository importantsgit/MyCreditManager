//
//  extension.swift
//  MyCreditManager
//
//  Created by 이재훈 on 2023/04/20.
//

import Foundation

extension Collection where Indices.Iterator.Element == Index {
    subscript (safe index: Index) -> Iterator.Element? {
        return indices.contains(index) ? self[index] : nil
    }
}

