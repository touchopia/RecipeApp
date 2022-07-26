//
//  ViewControlle+Alert.swift
//  RecipeApp
//
//  Created by Phil Wright on 6/17/22.
//

import UIKit

public extension UIViewController {
    func showAlert(title: String, message: String, completion: (() -> Void)?) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Retry", style: .default, handler: { _ in
            if let completion = completion { completion() }
        }))
        present(alert, animated: true, completion: nil)
    }
}
