//
//  HighlightsView.swift
//  Foodipedia
//
//  Created by Krishantha Jayathilake on 2022-07-12.
//

import UIKit

final class HighlightsView: UIView {
    
    // MARK: Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        circleView.layer.cornerRadius = circleView.frame.height / 2
        circleView.addGradient(colors: [.lightOrange, .darkOrange], opacity: 1.0, angle: 45)
        circleShadowView.layer.cornerRadius = circleShadowView.frame.height / 2
        circleShadowView.dropShadow(shadowColor: .shadowOrange, shadowOffset: CGSize(width: 0, height: 8))
    }
    
    // MARK: Internal

    lazy var circleView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        return view
    }()
    
    lazy var circleShadowView: UIView = {
        let view = UIView()
        view.backgroundColor = .darkOrange
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var caloryCountLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .systemFont(ofSize: 80, weight: .light)
        label.text = Constants.hello
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var foodTitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .systemFont(ofSize: 25, weight: .thin)
        label.numberOfLines = 2
        label.textAlignment = .center
        label.adjustsFontSizeToFitWidth = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var separator: UIView = {
       let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var caloriesPerServingLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .italicSystemFont(ofSize: 22)
        label.text = Constants.caloriesPerServing
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // MARK: Private
    
    private func setupView() {
        self.addSubview(circleShadowView)
        self.addSubview(circleView)
        self.addSubview(caloryCountLabel)
        self.addSubview(foodTitleLabel)
        self.addSubview(separator)
        self.addSubview(caloriesPerServingLabel)
        
        NSLayoutConstraint.activate([
            circleView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            circleView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            circleView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.85),
            circleView.heightAnchor.constraint(equalTo: circleView.widthAnchor),
            circleShadowView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            circleShadowView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            circleShadowView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.85),
            circleShadowView.heightAnchor.constraint(equalTo: circleShadowView.widthAnchor),
            caloryCountLabel.centerXAnchor.constraint(equalTo: circleView.centerXAnchor),
            caloryCountLabel.centerYAnchor.constraint(equalTo: circleView.centerYAnchor),
            separator.centerXAnchor.constraint(equalTo: circleView.centerXAnchor),
            separator.heightAnchor.constraint(equalToConstant: 1.0),
            separator.widthAnchor.constraint(equalTo: circleView.widthAnchor, multiplier: 0.33),
            separator.bottomAnchor.constraint(equalTo: caloryCountLabel.topAnchor, constant: -20),
            foodTitleLabel.centerXAnchor.constraint(equalTo: circleView.centerXAnchor),
            foodTitleLabel.bottomAnchor.constraint(equalTo: separator.topAnchor, constant: -8),
            foodTitleLabel.widthAnchor.constraint(equalTo: circleView.widthAnchor, multiplier: 0.5),
            caloriesPerServingLabel.centerXAnchor.constraint(equalTo: circleView.centerXAnchor),
            caloriesPerServingLabel.topAnchor.constraint(equalTo: caloryCountLabel.bottomAnchor, constant: 10)
        ])
    }
    
}
