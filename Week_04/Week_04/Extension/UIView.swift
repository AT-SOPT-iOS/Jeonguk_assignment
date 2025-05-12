//
//  UIView.swift
//  Week_03
//
//  Created by 정정욱 on 5/1/25.
//

import UIKit

extension UIView {
    func addSubviews(_ views: UIView...) {
        views.forEach { self.addSubview($0) }
    }
}
