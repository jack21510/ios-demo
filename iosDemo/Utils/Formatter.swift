//
//  Formatter.swift
//  iosDemo
//
//  Created by 陳昱嘉 on 2025/7/25.
//

import Foundation

func formattedTime(date: String) -> String {
    let inputFormatter = DateFormatter()
    inputFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm"

    if let date = inputFormatter.date(from: date) {
        let outputFormatter = DateFormatter()
        outputFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        return outputFormatter.string(from: date)
    } else {
        return date
    }
}
