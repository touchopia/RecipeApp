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
    @IBOutlet var ingrediateLabels: [UILabel]!
    
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
            self.titleLabel.text = meal.strMeal
            self.imageView.loadImageFromURL(urlString: meal.strMealThumb, placeholder: placeholder)
            
            instructionsLabel.text = meal.strInstructions
            
            ingrediateLabels[0].text = meal.strIngredient1 ?? ""
            ingrediateLabels[1].text = meal.strIngredient2 ?? ""
            ingrediateLabels[2].text = meal.strIngredient3 ?? ""
            ingrediateLabels[3].text = meal.strIngredient4 ?? ""
            ingrediateLabels[4].text = meal.strIngredient5 ?? ""
            ingrediateLabels[5].text = meal.strIngredient6 ?? ""
            ingrediateLabels[6].text = meal.strIngredient7 ?? ""
            ingrediateLabels[7].text = meal.strIngredient8 ?? ""
            ingrediateLabels[8].text = meal.strIngredient9 ?? ""
            ingrediateLabels[9].text = meal.strIngredient10 ?? ""
        }
    }
    
}
