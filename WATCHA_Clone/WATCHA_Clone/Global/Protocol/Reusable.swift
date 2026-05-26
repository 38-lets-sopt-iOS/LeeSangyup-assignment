//
//  Reusable.swift
//  WATCHA_Clone
//
//  Created by 이상엽 on 5/20/26.
//

import Foundation

protocol Reusable {
    static var identifier: String { get }
}

extension Reusable {
    static var identifier: String {
        return String(describing: Self.self)
    }
}
