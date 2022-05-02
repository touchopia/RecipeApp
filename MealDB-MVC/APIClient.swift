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
                if let jsonString = String(data: data, encoding: .utf8) {
                    let jsonData = Data(jsonString.utf8)
                    let meals = try decoder.decode(MealsContainer.self, from: jsonData)
                    let mealsArray = meals.meals
                    completion(mealsArray)
                }
            } catch let parseError {
                completion(emptyMeals)
                print("JSON Error \(parseError.localizedDescription)")
            }
            
        }.resume()

    }
}
