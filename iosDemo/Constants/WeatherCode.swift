//
//  WeatherCode.swift
//  iosDemo
//
//  Created by Jack on 2025/7/23.


import Foundation

struct WeatherCodeConstants {
    /// 天氣代碼與中文描述對應表
    static let descriptions: [Int: String] = [
        0: "☀️ 晴天",
        1: "🌤 部分晴",
        2: "🌤 部分晴",
        3: "⛅️ 多雲",
        45: "🌫 有霧",
        48: "🌫 有霜",
        51: "🌧 毛毛雨",
        53: "🌧 毛毛雨",
        55: "🌧 毛毛雨",
        56: "🌧 凝結毛毛雨",
        57: "🌧 凝結毛毛雨",
        61: "🌧 小雨",
        63: "🌧 中雨",
        65: "🌧 大雨",
        66: "🌧 凝結小雨",
        67: "🌧 凝結大雨",
        71: "❄️ 小雪",
        73: "❄️ 中雪",
        75: "❄️ 大雪",
        77: "❄️ 雪粒",
        80: "🌦 小陣雨",
        81: "🌦 中陣雨",
        82: "🌦 大陣雨",
        85: "❄️ 小陣雪",
        86: "❄️ 大陣雪",
        95: "⛈ 雷雨",
        96: "⛈ 雷雨伴有小冰雹",
        99: "⛈ 雷雨伴有大冰雹"
    ]
    
    /// 根據代碼回傳對應描述，找不到回傳"未知"
    static func description(for code: Int) -> String {
        return descriptions[code] ?? "未知"
    }
    
    static func animationName(for code: Int) -> String {
            switch code {
            case 0: // 晴
                return "sunny"
            case 1, 2: // 晴有雲
                return "windy"
            case 3, 45, 48: // 多雲
                return "cloudy"
            case 51...67, 80...82, 95...99: // 雨
                return "rainy"
            case 71, 73, 75, 77, 85, 86: // 各種雪
                return "sonw"
            default:
                return "sunny"
            }
        }
}
