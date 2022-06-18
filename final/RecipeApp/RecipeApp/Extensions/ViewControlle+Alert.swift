//
//  ViewControlle+Alert.swift
//  RecipeApp
//
//  Created by Phil Wright on 6/17/22.
//

import UIKit

extension UIViewController {
    public func showAlert(title: String, message: String, completion: (() -> ())?) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Retry", style: .default, handler: { alert in
            if let completion = completion { completion() }
        }))
        self.present(alert, animated: true, completion: nil)
    }
}
