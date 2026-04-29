//
//  UIColor+.swift
//  WATCHA_Clone
//
//  Created by 이상엽 on 4/19/26.
//

import UIKit

extension UIColor {
    static let grey100 = UIColor(hex: "#84868D")
    static let grey200 = UIColor(hex: "#92959A")
    static let grey300 = UIColor(hex: "#57585C")
    static let grey400 = UIColor(hex: "#505155")
    static let grey500 = UIColor(hex: "#4A4C4D")
    static let grey600 = UIColor(hex: "#191A1C")

    static let white = UIColor(hex: "#FFFFFF")
    static let black = UIColor(hex: "#000000")
    static let pink = UIColor(hex: "#DE2A60")
    static let green = UIColor(hex: "#0ACA9E")
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
