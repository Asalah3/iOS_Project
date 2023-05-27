//
//  iOS_ProjectTests.swift
//  iOS_ProjectTests
//
//  Created by Asalah Sayed on 25/05/2023.
//

import XCTest
@testable import iOS_Project

final class iOS_ProjectTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    func testLoadCategoriesFromURL(){
        let expectation = expectation(description: "Waiting for the API Data")
        NetworkServices.fetchHomeCategoriesData(tag: "dinner"){ result in
            guard let result = result else{
                XCTFail()
                expectation.fulfill()
                return
            }
            XCTAssertNotEqual(result.results?.count,0, "Failed ..")
            expectation.fulfill()
        }
        waitForExpectations(timeout: 5)
    }

}
