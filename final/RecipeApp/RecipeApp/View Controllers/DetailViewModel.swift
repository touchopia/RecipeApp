//
//  DetailViewModel.swift
//  RecipeApp
//
//  Created by Phil Wright on 7/8/22.
//

import UIKit

struct DetailViewModel {
    let meal: Meal
    var id: String { return meal.idMeal }
    var title: String { return meal.strMeal }
    var titleColor: UIColor { return .white }
    var instructions: String { return meal.strInstructions ?? "" }
    var thumbnail: String { return meal.strMealThumb }
    var labelsArray: [UILabel] {
        var labelsArray = [UILabel]()
        for ingredient in meal.ingredientsArray {
            let label = UILabel()
            label.textAlignment = .center
            label.text = ingredient.capitalized
            label.font = UIFont(name: "Avanir Next", size: 18)
            labelsArray.append(label)
        }
        return labelsArray
    }
}
