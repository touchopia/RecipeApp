//
//  MealTableViewCell.swift
//  themealdb
//
//  Created by Phil Wright on 12/7/21.
//  Copyright © 2021 Touchopia, LLC. All rights reserved.

import UIKit

class MealTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var mealImageView: UIImageView!
    
    var meal: Meal?
    
    let placeholderImage = UIImage(named: "placeholder-image")
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.mealImageView.image = nil
    }

    func updateUI() {
        guard let meal = meal else { return }
        
        self.mealImageView?.loadImageFromURL(urlString: meal.strMealThumb,
                                             placeholder: placeholderImage)
        self.titleLabel.text = meal.strMeal
    }
    
    func configure(meal: Meal) {
        self.meal = meal
        updateUI()
    }
}
