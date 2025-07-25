//
//  WeatherAPI.swift
//  iosDemo
//
//  Created by Jack on 2025/7/23.
//

import Moya

enum WeatherAPI {
    case forecast(latitude: Double, longitude: Double, hourly: String)
}

extension WeatherAPI: TargetType {
    
    var baseURL: URL {
        guard let url = URL(string: Constants.API.baseUrl) else { fatalError() }
        return url
    }
    
    var path: String {
        switch self {
        case .forecast:
            return Constants.Method.forecast
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .forecast:
            return .get
        }
    }
    
    
    var task: Task {
        switch self {
        case .forecast(let latitude, let longitude, let hourly):
            return .requestParameters(parameters: [
                "latitude": latitude,
                "longitude": longitude,
                "hourly": hourly
            ], encoding: URLEncoding.default)
        }
    }
    
    
    var headers: [String: String]? {
        return ["Content-type": "application/json"]
        //也會有token 只是目前這隻天氣API不需要
    }
    
    
    var sampleData: Data {
        return Data()
    }
}
