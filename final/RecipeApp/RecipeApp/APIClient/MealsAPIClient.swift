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

        get(from: categoryURL) { result in
            switch result {
            case .success(let (data, response)):
                if response.statusCode == 200 {
                    do {
                        let meals = try JSONDecoder().decode(MealsItem.self, from: data)
                        let mealsArray = meals.meals
                        completion(.success(mealsArray))
                    } catch {
                        completion(.failure(error))
                    }
                }
            case let .failure(error):
                completion(.failure(error))
            }
        }
    }

    func getMeal(idString: String, completion: @escaping (MealResultType) -> Void) {
        guard let url = Endpoints.mealURL(with: idString) else {
            let urlError = NSError(domain: "URL error when calling meal endpoint", code: 0)
            completion(.failure(urlError))
            return
        }

        get(from: url) { result in
            switch result {
            case .success(let (data, response)):
                if response.statusCode == 200 {
                    do {
                        let meals = try JSONDecoder().decode(MealsItem.self, from: data)
                        if let meal = meals.meals.first {
                            completion(.success(meal))
                        }
                    } catch {
                        completion(.failure(error))
                    }
                }
            case let .failure(error):
                completion(.failure(error))
            }
        }
    }
}
