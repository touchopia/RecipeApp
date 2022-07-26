//
//  ViewController.swift
//  MealDB-MVC
//
//  Created by Phil Wright on 12/7/21.
//  Copyright © 2021 Touchopia, LLC. All rights reserved.

import UIKit

class MealListViewController: UIViewController {
    @IBOutlet var tableView: UITableView!

    private let cellIdentifier = "MealTableViewCell"
    private var mealsArray = [Meal]()
    private var currentMeal: Meal?
    private let client = MealsAPIClient()

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Meals"
        configureTableView()

        client.getMeals(category: "Dessert") { [weak self] result in

            DispatchQueue.main.async {
                switch result {
                case let .success(meals):
                    self?.mealsArray = meals.sorted { $0.strMeal < $1.strMeal }
                    self?.tableView.reloadData()
                case let .failure(error):
                    print(error)
                }
            }
        }
    }

    func configureTableView() {
        tableView.register(UINib(nibName: "MealTableViewCell", bundle: nil), forCellReuseIdentifier: cellIdentifier)
    }

    override func prepare(for segue: UIStoryboardSegue, sender _: Any?) {
        if segue.identifier == "showDetailMealView" {
            if let viewController = segue.destination as? MealDetailViewController {
                if let currentMeal = currentMeal {
                    viewController.meal = currentMeal
                }
            }
        }
    }
}

extension MealListViewController: UITableViewDelegate {
    func tableView(_: UITableView, didSelectRowAt indexPath: IndexPath) {
        currentMeal = mealsArray[indexPath.row]
        performSegue(withIdentifier: "showDetailMealView", sender: nil)
    }

    func tableView(_: UITableView, heightForRowAt _: IndexPath) -> CGFloat {
        return 144
    }
}

extension MealListViewController: UITableViewDataSource {
    func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        return mealsArray.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as? MealTableViewCell else {
            return UITableViewCell()
        }

        let meal = mealsArray[indexPath.row]
        currentMeal = meal
        cell.configure(meal: meal)
        return cell
    }
}
