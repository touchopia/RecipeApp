//
//  APIClient.swift
//  MealDB-MVC
//
//  Created by Phil Wright on 5/2/22.
//

import Foundation

class APIClient {
    static let shared = APIClient()
    private init() {}
    
    let categoryURLString = "https://www.themealdb.com/api/json/v1/1/filter.php?c=Dessert"
    let mealURLString = "https://www.themealdb.com/api/json/v1/1/lookup.php?i="
    
    func getMeals(completion: @escaping ([Meal]) -> Void) {
        
        let emptyMeals = [Meal]()
        
        guard let url = URL(string: categoryURLString) else {
            completion(emptyMeals)
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
                        
            guard let data=data else {
                completion(emptyMeals)
                return
            }
            
            if error != nil {
                completion(emptyMeals)
                return
            }
            
            let decoder = JSONDecoder()
            
            do {
                let meals = try decoder.decode(MealsContainer.self, from: data)
                let mealsArray = meals.meals
                completion(mealsArray)
            } catch let parseError {
                if let jsonString = String(data: data, encoding: .utf8) {
                    print("JSON String: \(jsonString)")
                }
                print("JSON Error: \(parseError.localizedDescription)")
            }
        }.resume()
    }
    
    func getMeal(idString: String, completion: @escaping (Meal) -> Void) {
        
        guard !idString.isEmpty else {
            return
        }
        
        guard let url = URL(string: mealURLString + idString) else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
                        
            guard let data=data else {
                return
            }
            
            if error != nil {
                return
            }
            
            let decoder = JSONDecoder()
            
            do {
                let meals = try decoder.decode(MealsContainer.self, from: data)
                if let meal = meals.meals.first {
                    completion(meal)
                }
            } catch let parseError {
                if let jsonString = String(data: data, encoding: .utf8) {
                    print("JSON String: \(jsonString)")
                }
                print("JSON Error: \(parseError.localizedDescription)")
            }
        }.resume()
    }
}
