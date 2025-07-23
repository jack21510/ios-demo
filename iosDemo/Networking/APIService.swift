//
//  APIManager.swift
//  iosDemo
//
//  Created by Jack on 2025/7/23.
//

import Moya

enum APIService {
    case forecast(latitude: Double, longitude: Double, hourly: String)
}

extension APIService: TargetType {
    
    // This is the base URL we'll be using, typically our server.
    var baseURL: URL {
        guard let url = URL(string: Constants.API.baseUrl) else { fatalError() }
        return url
    }
    
    // This is the path of each operation that will be appended to our base URL.
    var path: String {
        switch self {
        case .forecast:
            return Constants.Method.forecast
        }
    }
    
    // Here we specify which method our calls should use.
    var method: Moya.Method {
        switch self {
        case .forecast:
            return .get
        }
    }
    
    // Here we specify body parameters, objects, files etc.
    // or just do a plain request without a body.
    // In this example we will not pass anything in the body of the request.
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
    
    // These are the headers that our service requires.
    // Usually you would pass auth tokens here.
    var headers: [String: String]? {
        return ["Content-type": "application/json"]
    }
    
    // This is sample return data that you can use to mock and test your services,
    // but we won't be covering this.
    var sampleData: Data {
        return Data()
    }
}
