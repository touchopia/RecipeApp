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
                        
            guard let data = data, error == nil else {
                // TODO: Do Error Handling Here
                completion(emptyMeals)
                return
            }
        
            do {
                let meals = try JSONDecoder().decode(MealsContainer.self, from: data)
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
        
        guard idString.isEmpty == false else {
            // TODO: Do Error Handling Here
            return
        }
        
        guard let url = URL(string: mealURLString + idString) else {
            // TODO: Do Error Handling Here
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
                        
            guard let data=data, error == nil else {
                // TODO: Do Error Handling Here
                return
            }
            
            do {
                let meals = try JSONDecoder().decode(MealsContainer.self, from: data)
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
