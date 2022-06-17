//
//  MealsAPIClientTests.swift
//  RecipeAppTests
//
//  Created by Phil Wright on 6/17/22.
//  Copyright © 2022 Touchopia, LLC. All rights reserved.

import XCTest
@testable import RecipeApp

class MealsAPIClientTests: XCTestCase {
    
    var client: HTTPClient?
    
    func test_initSUT() {
        let client = makeSUT()
        XCTAssertNotNil(client)
    }
    
    // Helper Methods
    
    func makeSUT() -> HTTPClient {
        return MealsAPIClient()
    }
}
