//
//  MealDetailViewController.swift
//  MealDB-MVC
//
//  Created by Phil Wright on 12/7/21.
//  Copyright © 2021 Touchopia, LLC. All rights reserved.

import UIKit

class MealDetailViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var instructionsLabel: UILabel!
    @IBOutlet weak var ingredientsLabel: UILabel!
    @IBOutlet weak var ingredientsStackView: UIStackView!
    
    let placeholder = UIImage(named: "placeholder-image")
    
    var meal: Meal?

    let client = MealsAPIClient()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ingredientsLabel.textColor = .white
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        refreshMeal()
    }
    
    private func refreshMeal() {
        getMeal()
    }
    
    private func getMeal() {
        if let meal = meal {
            client.getMeal(idString: meal.idMeal) { [weak self] result in
                DispatchQueue.main.async {
                    switch result {
                    case .success(let meal):
                        self?.meal = meal
                        self?.updateUI()
                    case .failure(let error):
                        self?.showAlert(title:"Network Error", message: error.localizedDescription, completion: self?.refreshMeal)
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
