//
//  MealsAPIClient.swift
//  MealDB-MVC
//
//  Created by Phil Wright on 12/7/21.
//  Copyright © 2021 Touchopia, LLC. All rights reserved.

import Foundation

final class MealsAPIClient: HTTPClient {
    
    typealias MealResultType = Result<Meal, Error>
    typealias MealsResultType = Result<[Meal], Error>
    
    func getMeals(category: String, completion: @escaping (MealsResultType) -> Void) {
        guard let categoryURL = Endpoints.categoriesURL(with: category) else {
            let categoryError = NSError(domain: "Category :\(category) not found", code: 0)
            completion(.failure(categoryError))
            return
        }
        
        let task = URLSession.shared.dataTask(with: categoryURL) { data, _, error in
            
            guard let data = data, error == nil else {
                guard let error = error else { return }
                completion(.failure(error))
                return
            }
            
            do {
                let meals = try JSONDecoder().decode(MealsItem.self, from: data)
                let mealsArray = meals.meals
                completion(.success(mealsArray))
            } catch let error {
                completion(.failure(error))
            }
        }
        task.resume()
    }
    
    func getMeal(idString: String, completion: @escaping (MealResultType) -> Void) {
        
        guard let url = Endpoints.mealURL(with: idString) else {
            let urlError = NSError(domain: "URL error when calling meal endpoint", code: 0)
            completion(.failure(urlError))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            guard let data=data, let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200, error == nil else {
                guard let error = error else { return }
                completion(.failure(error))
                return
            }
            
            do {
                let meals = try JSONDecoder().decode(MealsItem.self, from: data)
                if let meal = meals.meals.first {
                    completion(.success(meal))
                }
            } catch let error {
                completion(.failure(error))
            }
        }.resume()
    }
}
