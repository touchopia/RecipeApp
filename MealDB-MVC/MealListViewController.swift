//
//  ViewController.swift
//  MealDB-MVC
//
//  Created by Phil Wright on 5/2/22.
//

import UIKit

class MealListViewController: UIViewController {

    private let cellIdentifier = "MealTableViewCell"
    
    @IBOutlet weak var tableView: UITableView!
    
    private var mealsArray = [Meal]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Meals"
        
        setupTableView()
        
        APIClient.shared.getMeals { [weak self] meals in
            
            DispatchQueue.main.async {
                self?.mealsArray = meals.sorted { $0.strMeal < $1.strMeal }
                self?.tableView.reloadData()
            }
        }
    }
    
    func setupTableView() {
        tableView.register(UINib(nibName: "MealTableViewCell", bundle: nil), forCellReuseIdentifier: cellIdentifier)
    }
    
}

extension MealListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showDetailMealView", sender: nil)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 144
    }
    
}

extension MealListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mealsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as? MealTableViewCell else {
            return UITableViewCell()
        }
        cell.configure(meal: mealsArray[indexPath.row])
        return cell
    }
    
}

