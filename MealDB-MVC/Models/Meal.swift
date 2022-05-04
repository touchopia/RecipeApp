//
//  Meal.swift
//  themealdb
//
//  Created by Phil Wright on 4/25/22.
//

import Foundation

struct MealsContainer : Codable {
    let meals: [Meal]
}

struct Meal : Codable {
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
            self.strIngredient1,
            self.strIngredient2,
            self.strIngredient3,
            self.strIngredient4,
            self.strIngredient5,
            self.strIngredient6,
            self.strIngredient7,
            self.strIngredient8,
            self.strIngredient9,
            self.strIngredient10,
            self.strIngredient11,
            self.strIngredient12,
            self.strIngredient13,
            self.strIngredient14,
            self.strIngredient15,
            self.strIngredient16,
            self.strIngredient17,
            self.strIngredient18,
            self.strIngredient19
        ]).compactMap { $0 }.filter { !$0.isEmpty }.sorted() // unwrap optionals
        return instructions
    }
    
    var measuresArray: [String] {
        let measures = Set([
            self.strMeasure1,
            self.strMeasure2,
            self.strMeasure3,
            self.strMeasure4,
            self.strMeasure5,
            self.strMeasure6,
            self.strMeasure7,
            self.strMeasure8,
            self.strMeasure9,
            self.strMeasure10,
            self.strMeasure11,
            self.strMeasure12,
            self.strMeasure13,
            self.strMeasure14,
            self.strMeasure15,
            self.strMeasure16,
            self.strMeasure17,
            self.strMeasure18,
            self.strMeasure19
        ]).compactMap { $0 }.filter { !$0.isEmpty }.sorted() // unwrap optionals
        return measures
    }
}

