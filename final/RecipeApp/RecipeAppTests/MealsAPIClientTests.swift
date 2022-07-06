//
//  MealsAPIClientTests.swift
//  RecipeAppTests
//
//  Created by Phil Wright on 6/17/22.
//  Copyright © 2022 Touchopia, LLC. All rights reserved.

import XCTest
import RecipeApp

class MealsAPIClientTests: XCTestCase {
    
    private var client: HTTPClient?
    
    func test_initSUT() {
        self.client = makeSUT()
        XCTAssertNotNil(self.client)
    }
    
    // Helper Methods
    func makeSUT() -> HTTPClient {
        return MealsAPIClient()
    }
}
