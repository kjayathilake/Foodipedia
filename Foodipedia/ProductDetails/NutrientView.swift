//
//  NutrientView.swift
//  Foodipedia
//
//  Created by Krishantha Jayathilake on 2022-07-12.
//

import UIKit

final class NutrientView: UIView {
    
    // MARK: Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Internal

    lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .fillProportionally
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .cloudGray
        return label
    }()
    
    lazy var separator: UIView = {
        let view = UIView()
        view.backgroundColor = .cloudGray
        return view
    }()
    
    lazy var percentageLabel: UILabel = {
        let label = UILabel()
        label.textColor = .cloudGray
        return label
    }()
    
    // MARK: Private
    
    private func setupView() {
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(separator)
        stackView.addArrangedSubview(percentageLabel)
        self.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: self.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            separator.heightAnchor.constraint(equalToConstant: 1),
            separator.widthAnchor.constraint(equalTo: stackView.widthAnchor, multiplier: 0.6)
        ])
    }
    
}
