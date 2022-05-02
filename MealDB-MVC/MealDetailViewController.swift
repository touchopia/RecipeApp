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
    
    let placeholder = UIImage(named: "placeholder-image")
    
    var meal: Meal?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
    }
    
    func updateUI() {
        if let meal = meal {
            self.titleLabel.text = meal.strMeal
            self.imageView.loadImageFromURL(urlString: meal.strMealThumb, placeholder: placeholder)
        }
    }
    
}
