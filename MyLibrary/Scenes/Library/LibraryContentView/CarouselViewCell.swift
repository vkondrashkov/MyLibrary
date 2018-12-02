//
//  CarouselViewCell.swift
//  MyLibrary
//
//  Created by Vladislav Kondrashkov on 11/25/18.
//  Copyright © 2018 Vladislav Kondrashkov. All rights reserved.
//

import UIKit

class CarouselViewCell: UICollectionViewCell {
    private let cardView = UIView()
    private let titleLabel = UILabel()
    private let descriptionLabel = UILabel()
    private let descriptionView = UIView()
    private let background = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        layer.cornerRadius = 10
        
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 5)
        layer.shadowOpacity = 0.5
        layer.shadowRadius = 6
        
        cardView.layer.cornerRadius = 10
        cardView.layer.masksToBounds = true
        
        contentView.addSubview(cardView)
        activateCardViewConstraints(view: cardView)
        
        cardView.addSubview(background)
        activateBackgroundConstraints(view: background)
        
        titleLabel.font = .boldSystemFont(ofSize: 24)
        titleLabel.textColor = .white
        cardView.addSubview(titleLabel)
        activateTitleConstraints(view: titleLabel)
        
        descriptionView.backgroundColor = .white
        cardView.addSubview(descriptionView)
        activateDescriptionViewConstraints(view: descriptionView)
        
        descriptionLabel.font = .boldSystemFont(ofSize: 17)
        descriptionLabel.textColor = .gray
        descriptionLabel.lineBreakMode = .byWordWrapping
        descriptionLabel.numberOfLines = 3
        descriptionView.addSubview(descriptionLabel)
        activateDescriptionConstraints(view: descriptionLabel)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func display(card: LibraryCard) {
        background.backgroundColor = card.background
        titleLabel.text = card.title
        descriptionLabel.text = card.description
    }
}

private typealias PrivateCarouselViewCell = CarouselViewCell
private extension PrivateCarouselViewCell {
    func activateCardViewConstraints(view: UIView) {
        guard let superview = view.superview else { return }
        view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            view.leadingAnchor.constraint(equalTo: superview.leadingAnchor),
            view.trailingAnchor.constraint(equalTo: superview.trailingAnchor),
            view.topAnchor.constraint(equalTo: superview.topAnchor),
            view.bottomAnchor.constraint(equalTo: superview.bottomAnchor)
            ])
    }
    
    func activateBackgroundConstraints(view: UIView) {
        guard let superview = view.superview else { return }
        view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: superview.topAnchor),
            view.leadingAnchor.constraint(equalTo: superview.leadingAnchor),
            view.trailingAnchor.constraint(equalTo: superview.trailingAnchor),
            view.bottomAnchor.constraint(equalTo: superview.bottomAnchor)
            ])
    }
    
    func activateTitleConstraints(view: UIView) {
        guard let superview = view.superview else { return }
        view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: superview.topAnchor, constant: 20),
            view.leadingAnchor.constraint(equalTo: superview.leadingAnchor, constant: 10),
            view.trailingAnchor.constraint(equalTo: superview.trailingAnchor)
            ])
    }
    
    func activateBackButtonConstraints(view: UIView) {
        guard let superview = view.superview else { return }
        view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: superview.topAnchor, constant: 20),
            view.leadingAnchor.constraint(equalTo: superview.leadingAnchor, constant: 20)
            ])
    }
    
    func activateDescriptionViewConstraints(view: UIView) {
        guard let superview = view.superview else { return }
        view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            view.bottomAnchor.constraint(equalTo: superview.bottomAnchor),
            view.leadingAnchor.constraint(equalTo: superview.leadingAnchor),
            view.trailingAnchor.constraint(equalTo: superview.trailingAnchor),
            view.heightAnchor.constraint(equalToConstant: 75)
            ])
    }
    
    func activateDescriptionConstraints(view: UIView) {
        guard let superview = view.superview else { return }
        view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            view.centerYAnchor.constraint(equalTo: superview.centerYAnchor),
            view.leadingAnchor.constraint(equalTo: superview.leadingAnchor, constant: 10),
            view.trailingAnchor.constraint(equalTo: superview.trailingAnchor)
            ])
    }
}
