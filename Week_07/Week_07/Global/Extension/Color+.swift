//
//  Color.swift
//  Week_07
//
//  Created by 정정욱 on 5/27/25.
//

import SwiftUI

extension Color {
    static var tvingRed: Color {
        return Color(hex: "#FF143C")
    }
    static var gray1: Color {
        return Color(hex: "#D6D6D6")
    }
    static var gray2: Color {
        return Color(hex: "#9C9C9C")
    }
    static var gray3: Color {
        return Color(hex: "#626262")
    }
    static var gray4: Color {
        return Color(hex: "#2E2E2E")
    }
    static var gray5: Color {
        return Color(hex: "#191919")
    }
    static var gray6: Color {
        return Color(hex: "#212121")
    }
    static var gray7: Color {
        return Color(hex: "#8C8C8C")
    }
    
    init(hex: String, alpha: Double = 1.0) {
        var hexFormatted: String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()

        if hexFormatted.hasPrefix("#") {
            hexFormatted = String(hexFormatted.dropFirst())
        }

        assert(hexFormatted.count == 6, "Invalid hex code used.")

        var rgbValue: UInt64 = 0
        Scanner(string: hexFormatted).scanHexInt64(&rgbValue)

        let red = Double((rgbValue & 0xFF0000) >> 16) / 255.0
        let green = Double((rgbValue & 0x00FF00) >> 8) / 255.0
        let blue = Double(rgbValue & 0x0000FF) / 255.0

        self.init(.sRGB, red: red, green: green, blue: blue, opacity: alpha)
    }
}
