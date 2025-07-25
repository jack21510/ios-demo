//
//  iosDemoTests.swift
//  iosDemoTests
//
//  Created by 陳昱嘉 on 2025/7/19.
//

import XCTest
@testable import iosDemo

final class iosDemoTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testFetchWeatherForAllCities() {
        let expectation = self.expectation(description: "Fetch weather for all cities")

        WeatherManager.shared.fetchWeatherForAllCities { results in
            // 驗證至少有一個城市資料
            XCTAssertFalse(results.isEmpty, "應該要有至少一筆城市天氣資料")

            // 驗證台北市
            if let taipeiWeather = results["台北市"] {
                XCTAssertGreaterThan(taipeiWeather.latitude, 0)
                XCTAssertEqual(taipeiWeather.hourly.temperature_2m.count, taipeiWeather.hourly.time.count, "溫度與時間數量應一致")
            }

            // 標記 expectation 為完成
            expectation.fulfill()
        }

        // 等待最多 5 秒
        wait(for: [expectation], timeout: 5.0)
    }

}
