//
//  Meal.swift
//  themealdb
//
//  Created by Phil Wright on 12/7/21.
//  Copyright © 2021 Touchopia, LLC. All rights reserved.

import Foundation

struct MealsItem: Codable {
    let meals: [Meal]
}

struct Meal: Codable {
    let idMeal: String
    let strMeal: String
    let strMealThumb: String
    let strDrinkAlternate: String?
    let strCategory: String?
    let strArea: String?
    let strInstructions: String?
    let strTags: String?
    let strYoutube: String?
    let strIngredient1: String?
    let strIngredient2: String?
    let strIngredient3: String?
    let strIngredient4: String?
    let strIngredient5: String?
    let strIngredient6: String?
    let strIngredient7: String?
    let strIngredient8: String?
    let strIngredient9: String?
    let strIngredient10: String?
    let strIngredient11: String?
    let strIngredient12: String?
    let strIngredient13: String?
    let strIngredient14: String?
    let strIngredient15: String?
    let strIngredient16: String?
    let strIngredient17: String?
    let strIngredient18: String?
    let strIngredient19: String?
    let strIngredient20: String?
    let strMeasure1: String?
    let strMeasure2: String?
    let strMeasure3: String?
    let strMeasure4: String?
    let strMeasure5: String?
    let strMeasure6: String?
    let strMeasure7: String?
    let strMeasure8: String?
    let strMeasure9: String?
    let strMeasure10: String?
    let strMeasure11: String?
    let strMeasure12: String?
    let strMeasure13: String?
    let strMeasure14: String?
    let strMeasure15: String?
    let strMeasure16: String?
    let strMeasure17: String?
    let strMeasure18: String?
    let strMeasure19: String?
    let strMeasure20: String?
    let strSource: String?
    let strImageSource: String?
    let strCreativeCommonsConfirmed: String?
    let dateModified: String?

    // Computed Properties

    var ingredientsArray: [String] {
        let instructions = Set([
            String("\(strMeasure1 ?? "") \(strIngredient1 ?? "")"),
            String("\(strMeasure2 ?? "") \(strIngredient2 ?? "")"),
            String("\(strMeasure3 ?? "") \(strIngredient3 ?? "")"),
            String("\(strMeasure4 ?? "") \(strIngredient4 ?? "")"),
            String("\(strMeasure5 ?? "") \(strIngredient5 ?? "")"),
            String("\(strMeasure6 ?? "") \(strIngredient6 ?? "")"),
            String("\(strMeasure7 ?? "") \(strIngredient7 ?? "")"),
            String("\(strMeasure8 ?? "") \(strIngredient8 ?? "")"),
            String("\(strMeasure9 ?? "") \(strIngredient9 ?? "")"),
            String("\(strMeasure10 ?? "") \(strIngredient10 ?? "")"),
            String("\(strMeasure11 ?? "") \(strIngredient11 ?? "")"),
            String("\(strMeasure12 ?? "") \(strIngredient12 ?? "")"),
            String("\(strMeasure13 ?? "") \(strIngredient13 ?? "")"),
            String("\(strMeasure14 ?? "") \(strIngredient14 ?? "")"),
            String("\(strMeasure15 ?? "") \(strIngredient15 ?? "")"),
            String("\(strMeasure16 ?? "") \(strIngredient16 ?? "")"),
            String("\(strMeasure17 ?? "") \(strIngredient17 ?? "")"),
            String("\(strMeasure18 ?? "") \(strIngredient18 ?? "")"),
            String("\(strMeasure19 ?? "") \(strIngredient19 ?? "")"),
        ]).compactMap { $0 }.filter { !$0.isEmpty }.sorted() // unwrap optionals
        return instructions
    }
}
