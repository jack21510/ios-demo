//
//  CityLocationLoader.swift
//  iosDemo
//
//  Created by Jack on 2025/7/23.
//

import Foundation

class CityLocationLoader {
    static func load() -> [CityLocation] {
        
        guard let url = Bundle.main.url(forResource: "TaiwanCityCoordinates.json", withExtension: nil) else {
            print("找不到檔案路徑")
            return []
        }
        
        guard let data = try? Data(contentsOf: url) else {
            print("無法讀取檔案資料")
            return []
        }
                
        let decoder = JSONDecoder()
        
        guard let cities = try? decoder.decode([CityLocation].self, from: data) else {
            print("JSON 解析失敗")
            return []
        }
                
        return cities
        
    }
}
