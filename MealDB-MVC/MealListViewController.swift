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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Meals"
        
        setupTableView()
    }
    
    func setupTableView() {
        tableView.register(UINib(nibName: "MealTableViewCell", bundle: nil), forCellReuseIdentifier: cellIdentifier)
    }
    
}

extension MealListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 88
    }
    
}

extension MealListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as? MealTableViewCell else {
            return UITableViewCell()
        }
        
        cell.mealImageView.image = UIImage(named: "placeholder-image")
        cell.titleLabel.text = "Testing"
        return cell
    }
    
    
}

