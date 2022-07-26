//
//  Endpoints.swift
//  MealDB-MVC
//
//  Created by Phil Wright on 12/7/21.
//  Copyright © 2021 Touchopia, LLC. All rights reserved.

import Foundation

enum Endpoints {
    static var baseURLString: String {
        "https://www.themealdb.com/api/json/v1/1"
    }

    static func categoriesURL(with category: String) -> URL? {
        URL(string: "\(baseURLString)/filter.php?c=\(category)")
    }

    static func mealURL(with id: String) -> URL? {
        return URL(string: "\(baseURLString)/lookup.php?i=\(id)")
    }
}
