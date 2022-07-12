//
//  ProductViewController.swift
//  Foodipedia
//
//  Created by Krishantha Jayathilake on 2022-07-08.
//

import UIKit

/// A view controller that displays product details
final class ProductViewController: UIViewController {
    
    // MARK: Lifecycle
    
    init(viewModel: ProductViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        self.viewModel.view = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        reloadButton.addGradient(colors: [.blackGradient1, .blackGradient2], opacity: 1.0)
        reloadButtonShadowView.dropShadow(shadowColor: .shadowBlack, shadowOffset: CGSize(width: 0, height: 8))
    }
    
    // MARK: Internal
    
    lazy var highlishtsView: HighlightsView = {
        let view = HighlightsView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var nutrientsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.spacing = 10
        stackView.distribution = .fillEqually
        stackView.addArrangedSubview(carbsView)
        stackView.addArrangedSubview(proteinView)
        stackView.addArrangedSubview(fatView)
        return stackView
    }()
    
    lazy var reloadButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .blackGradient1
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(.white, for: .normal)
        button.setAttributedTitle(Constants.start.attributedButtonTitle(color: .primaryColor), for: .normal)
        button.layer.cornerRadius = 37.5
        button.clipsToBounds = true
        button.addTarget(self, action: #selector(reloadButtonTapped), for: .touchUpInside)
        return button
    }()
    
    lazy var reloadButtonShadowView: UIView = {
        let view = UIView()
        view.backgroundColor = .blackGradient2
        view.layer.cornerRadius = 37.5
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var carbsView: NutrientView = {
        let view = NutrientView()
        view.titleLabel.text = Constants.carbs
        view.percentageLabel.text = Constants.zeroPercentage
        return view
    }()
    
    lazy var proteinView: NutrientView = {
        let view = NutrientView()
        view.titleLabel.text = Constants.protein
        view.percentageLabel.text = Constants.zeroPercentage
        return view
    }()
    
    lazy var fatView: NutrientView = {
        let view = NutrientView()
        view.titleLabel.text = Constants.fat
        view.percentageLabel.text = Constants.zeroPercentage
        return view
    }()
    
    lazy var progressIndicator: UIActivityIndicatorView = {
        let view = UIActivityIndicatorView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.style = UIActivityIndicatorView.Style.large
        view.color = .primaryColor
        view.hidesWhenStopped = true
        return view
    }()
    
    // MARK: Private
    
    private func setupView() {
        self.view.addSubview(highlishtsView)
        self.view.addSubview(nutrientsStackView)
        self.view.addSubview(reloadButtonShadowView)
        self.view.addSubview(reloadButton)
        self.view.addSubview(progressIndicator)
        
        NSLayoutConstraint.activate([
            highlishtsView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            highlishtsView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            highlishtsView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9),
            highlishtsView.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9),
            nutrientsStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nutrientsStackView.topAnchor.constraint(equalTo: highlishtsView.bottomAnchor, constant: 50),
            nutrientsStackView.widthAnchor.constraint(equalToConstant: 300),
            nutrientsStackView.heightAnchor.constraint(equalToConstant: 70),
            reloadButtonShadowView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            reloadButtonShadowView.heightAnchor.constraint(equalToConstant: 75),
            reloadButtonShadowView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.75),
            reloadButtonShadowView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -75),
            reloadButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            reloadButton.heightAnchor.constraint(equalToConstant: 75),
            reloadButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.75),
            reloadButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -75),
            progressIndicator.centerXAnchor.constraint(equalTo: highlishtsView.centerXAnchor),
            progressIndicator.centerYAnchor.constraint(equalTo: highlishtsView.centerYAnchor),
            progressIndicator.widthAnchor.constraint(equalToConstant: 50),
            progressIndicator.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        highlishtsView.separator.isHidden = true
        nutrientsStackView.isHidden = true
        highlishtsView.caloriesPerServingLabel.isHidden = true
        progressIndicator.isHidden = true
        view.backgroundColor = .primaryColor
    }
    
    @objc private func reloadButtonTapped() {
        self.viewModel.fetchRandomProduct()
    }
    
    private func hideProductElements() {
        highlishtsView.caloryCountLabel.isHidden = true
        highlishtsView.foodTitleLabel.isHidden = true
        highlishtsView.separator.isHidden = true
        nutrientsStackView.isHidden = true
        highlishtsView.caloriesPerServingLabel.isHidden = true
    }
    
    private func showProdcutElements() {
        highlishtsView.caloryCountLabel.isHidden = false
        highlishtsView.foodTitleLabel.isHidden = false
        highlishtsView.separator.isHidden = false
        nutrientsStackView.isHidden = false
        highlishtsView.caloriesPerServingLabel.isHidden = false
    }
    
    private var viewModel: ProductViewModel
}

extension ProductViewController: ProductViewModelDelegate {
    func showLoading() {
        self.hideProductElements()
        self.progressIndicator.isHidden = false
        self.progressIndicator.startAnimating()
    }
    
    func showProductInfo() {
        self.showProdcutElements()
        self.progressIndicator.stopAnimating()
        self.reloadButton.setAttributedTitle(
            Constants.reload.attributedButtonTitle(color: .primaryColor),
            for: .normal
        )
        
        self.highlishtsView.foodTitleLabel.text = self.viewModel.productName
        self.highlishtsView.caloryCountLabel.text = self.viewModel.calories
        self.carbsView.percentageLabel.text = self.viewModel.carbs
        self.proteinView.percentageLabel.text = self.viewModel.protein
        self.fatView.percentageLabel.text = self.viewModel.fat
    }
    
    func showError() {
        self.progressIndicator.stopAnimating()
        let alert = UIAlertController(
            title: Constants.errorTitle,
            message: self.viewModel.errorMessage,
            preferredStyle: .alert
        )
        let action = UIAlertAction(title: Constants.ok, style: .default)
        alert.addAction(action)
        self.present(alert, animated: true)
    }
}
