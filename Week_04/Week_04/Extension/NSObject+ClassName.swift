//
//  NSObject+ClassName.swift
//  Week_04
//
//  Created by 정정욱 on 5/13/25.
//

import Foundation

extension NSObject {
    static var className: String {
        return String(describing: self)
    }
}
