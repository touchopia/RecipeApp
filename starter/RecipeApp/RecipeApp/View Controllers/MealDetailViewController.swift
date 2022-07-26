//
//  MealDetailViewController.swift
//  MealDB-MVC
//
//  Created by Phil Wright on 12/7/21.
//  Copyright © 2021 Touchopia, LLC. All rights reserved.

import UIKit

class MealDetailViewController: UIViewController {
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var instructionsLabel: UILabel!
    @IBOutlet var ingredientsLabel: UILabel!
    @IBOutlet var ingredientsStackView: UIStackView!

    let placeholder = UIImage(named: "placeholder-image")

    var meal: Meal?

    let client = MealsAPIClient()

    override func viewDidLoad() {
        super.viewDidLoad()
        ingredientsLabel.textColor = .white
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getMeal()
    }

    func getMeal() {
        if let meal = meal {
            client.getMeal(idString: meal.idMeal) { [weak self] result in
                DispatchQueue.main.async {
                    switch result {
                    case let .success(meal):
                        self?.meal = meal
                        self?.updateUI()
                    case let .failure(error):
                        print(error)
                    }
                }
            }
        }
    }

    func updateUI() {
        if let meal = meal {
            titleLabel.text = meal.strMeal
            titleLabel.textColor = .white
            imageView.loadImageFromURL(urlString: meal.strMealThumb, placeholder: placeholder)
            instructionsLabel.text = meal.strInstructions

            let ingredientsArray = meal.ingredientsArray

            for ingredient in ingredientsArray {
                let label = UILabel()
                label.textAlignment = .center
                label.text = ingredient.capitalized
                label.font = UIFont(name: "Avanir Next", size: 18)
                ingredientsStackView.addArrangedSubview(label)
            }
        }
    }
}
