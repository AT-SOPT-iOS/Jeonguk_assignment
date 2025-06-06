//
//  UIColor.swift
//  Week_03
//
//  Created by 정정욱 on 5/1/25.
//

import UIKit

extension UIColor {
    static var TvingRed: UIColor {
        return UIColor(hex: "#FF143C")
    }
    static var Gray8C: UIColor {
        return UIColor(hex: "#8C8C8C")
    }
    static var GrayD9: UIColor {
        return UIColor(hex: "#D9D9D9")
    }
    static var Gray21: UIColor {
        return UIColor(hex: "#212121")
    }
    static var Gray5: UIColor {
        return UIColor(hex: "#191919")
    }
    static var Gray4: UIColor {
        return UIColor(hex: "#2E2E2E")
    }
    static var Gray3: UIColor {
        return UIColor(hex: "#626262")
    }
    static var Gray2: UIColor {
        return UIColor(hex: "#9C9C9C")
    }
    static var Gray1: UIColor {
        return UIColor(hex: "#D6D6D6")
    }
}

extension UIColor {
    convenience init(hex: String, alpha: CGFloat = 1.0) {
        var hexFormatted: String = hex.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines).uppercased()

        if hexFormatted.hasPrefix("#") {
            hexFormatted = String(hexFormatted.dropFirst())
        }

        assert(hexFormatted.count == 6, "Invalid hex code used.")
        var rgbValue: UInt64 = 0
        Scanner(string: hexFormatted).scanHexInt64(&rgbValue)

        self.init(red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0, alpha: alpha)
    }
}

