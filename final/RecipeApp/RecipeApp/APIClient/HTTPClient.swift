//
//  HTTPClient.swift
//  RecipeApp
//
//  Created by Phil Wright on 6/17/22.
//  Copyright © 2022 Touchopia, LLC. All rights reserved.

import Foundation

protocol HTTPClient {
    
    typealias HTTPClientResult = Result<(Data, HTTPURLResponse), Error>
    
    func get(from url: URL, completion: @escaping (HTTPClientResult) -> Void)
}

extension HTTPClient {
    
    public func get(from url: URL, completion: @escaping (HTTPClientResult) -> Void) {
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            completion(Result {
                if let error = error { throw error }
                else if let data=data, let response=response as? HTTPURLResponse { return (data, response) }
                else { throw NSError(domain: "UnknownError", code: 99)}
            })
        }.resume()
    }
}
