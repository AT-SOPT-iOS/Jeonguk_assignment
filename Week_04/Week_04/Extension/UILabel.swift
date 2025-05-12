//
//  UILabel.swift
//  Week_03
//
//  Created by 정정욱 on 5/1/25.
//

import UIKit

extension UIFont {
    static func boldItalicSystemFont(ofSize size: CGFloat) -> UIFont {
        let baseDescriptor = UIFont.systemFont(ofSize: size).fontDescriptor
        let traits: [UIFontDescriptor.TraitKey: Any] = [
            .weight: UIFont.Weight.bold,
            .slant: 0.3 // 기울기 정도 (0.3 정도가 일반적인 italic 느낌)
        ]
        let descriptor = baseDescriptor.addingAttributes([.traits: traits])
        return UIFont(descriptor: descriptor, size: size)
    }
}
