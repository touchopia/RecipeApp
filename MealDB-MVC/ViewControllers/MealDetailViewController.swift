//
//  MealDetailViewController.swift
//  MealDB-MVC
//
//  Created by Phil Wright on 5/2/22.
//

import UIKit

class MealDetailViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var instructionsLabel: UILabel!
    @IBOutlet weak var ingredientsLabel: UILabel!
    @IBOutlet weak var ingredientsStackView: UIStackView!
    
    let placeholder = UIImage(named: "placeholder-image")
    
    var meal: Meal?

    override func viewDidLoad() {
        super.viewDidLoad()
        ingredientsLabel.textColor = .white
    }
    
    override func viewWillAppear(_ animated: Bool) {
        getMeal()
        super.viewWillAppear(animated)
    }
    
    func getMeal() {
        if let meal = meal {
            APIClient.shared.getMeal(idString: meal.idMeal) { [weak self] meal in
                self?.meal = meal
                
                DispatchQueue.main.async {
                    self?.updateUI()
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
