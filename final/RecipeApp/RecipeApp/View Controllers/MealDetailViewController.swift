//
//  MealDetailViewController.swift
//  MealDB-MVC
//
//  Created by Phil Wright on 12/7/21.
//  Copyright © 2021 Touchopia, LLC. All rights reserved.

import UIKit

class MealDetailViewController: UIViewController {
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var instructionsLabel: UILabel!
    @IBOutlet var ingredientsLabel: UILabel!
    @IBOutlet var ingredientsStackView: UIStackView!

    let placeholder = UIImage(named: "placeholder-image")
    var viewModel: DetailViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        ingredientsLabel.textColor = .white
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getMeal()
    }

    private func getMeal() {
        guard let viewModel = viewModel else { return }

        let client = MealsAPIClient()

        client.getMeal(idString: viewModel.id) { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case let .success(meal):
                    self?.viewModel = DetailViewModel(meal: meal)
                    self?.setupViewModel(with: self?.viewModel)
                case let .failure(error):
                    self?.showAlert(title: "Network Error", message: error.localizedDescription, completion: self?.getMeal)
                }
            }
        }
    }

    private func setupViewModel(with viewModel: DetailViewModel?) {
        guard let viewModel = viewModel else { return }

        titleLabel.text = viewModel.title
        titleLabel.textColor = viewModel.titleColor
        instructionsLabel.text = viewModel.instructions
        imageView.loadImageFromURL(urlString: viewModel.thumbnail, placeholder: placeholder)

        for label in viewModel.labelsArray {
            ingredientsStackView.addArrangedSubview(label)
        }
    }
}
