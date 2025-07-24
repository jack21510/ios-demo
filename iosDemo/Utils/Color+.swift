//
//  Color+.swift
//  iosDemo
//
//  Created by 陳昱嘉 on 2025/7/25.
//

import SwiftUI

//app主要風格顏色
extension Color {
    static let primaryColor = Color(hex:"#9AD3E2")
    static let secondaryColor = Color(hex:"#71B6D4")
    
    
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: .whitespacesAndNewlines)
                      .replacingOccurrences(of: "#", with: "")

        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)

        let r, g, b, a: UInt64
        switch hex.count {
        case 6: // RRGGBB
            (r, g, b, a) = (int >> 16 & 0xff, int >> 8 & 0xff, int & 0xff, 255)
        case 8: // RRGGBBAA
            (r, g, b, a) = (int >> 24 & 0xff, int >> 16 & 0xff, int >> 8 & 0xff, int & 0xff)
        default:
            (r, g, b, a) = (1, 1, 1, 1) // default to white
        }

        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue: Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}

