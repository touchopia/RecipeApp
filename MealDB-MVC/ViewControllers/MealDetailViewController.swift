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
    @IBOutlet weak var stackView: UIStackView!
    
    let placeholder = UIImage(named: "placeholder-image")
    
    var meal: Meal?

    override func viewDidLoad() {
        super.viewDidLoad()
        
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
            
            let instructions = Set([
                meal.strIngredient1,
                meal.strIngredient2,
                meal.strIngredient3,
                meal.strIngredient4,
                meal.strIngredient5,
                meal.strIngredient6,
                meal.strIngredient7,
                meal.strIngredient8,
                meal.strIngredient9,
                meal.strIngredient10,
                meal.strIngredient11,
                meal.strIngredient12,
                meal.strIngredient13,
                meal.strIngredient14,
                meal.strIngredient15,
                meal.strIngredient16,
                meal.strIngredient17,
                meal.strIngredient18,
                meal.strIngredient19
            ]).compactMap { $0 }.filter { !$0.isEmpty }.sorted() // unwrap optionals
            
            for instruction in instructions {
                let label = UILabel()
                label.textAlignment = .center
                label.text = instruction.capitalized
                label.font = UIFont(name: "Avanir Next", size: 18)
                stackView.addArrangedSubview(label)
            }
            
        }
    }
    
}
