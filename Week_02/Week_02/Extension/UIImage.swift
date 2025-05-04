//
//  UIImage.swift
//  Week_02
//
//  Created by 정정욱 on 4/26/25.
//

import UIKit

enum ImageLiterals {
    // MARK: - DetailViewController
    static var tiving_logo: UIImage { .load(name: "tiving_logo") }
}

extension UIImage {
    static func load(name: String) -> UIImage {
        guard let image = UIImage(named: name, in: nil, compatibleWith: nil) else {
            return UIImage()
        }
        return image
    }

    static func load(systemName: String) -> UIImage {
        guard let image = UIImage(systemName: systemName, compatibleWith: nil) else {
            return UIImage()
        }
        return image
    }
}
