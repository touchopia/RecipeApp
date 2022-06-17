//
//  HTTPClient.swift
//  RecipeApp
//
//  Created by Phil Wright on 6/17/22.
//  Copyright © 2022 Touchopia, LLC. All rights reserved.

import Foundation

protocol HTTPClient {
    func getMeals(category: String, completion: @escaping (MealsResultType) -> Void)
    func getMeal(idString: String, completion: @escaping (MealResultType) -> Void)
}
