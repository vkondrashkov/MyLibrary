//
//  SwipeableCollectionViewCell.swift
//  MyLibrary
//
//  Created by Vladislav Kondrashkov on 12/2/18.
//  Copyright © 2018 Vladislav Kondrashkov. All rights reserved.
//

import UIKit

class SwipeableCollectionViewCell: UICollectionViewCell {
    private var descriptionLabel = UILabel(frame: .zero)
    private var deleteLabel = UILabel(frame: .zero)
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        contentView.backgroundColor = UIColor(red: 44.0 / 255.0, green: 62.0 / 255.0, blue: 80.0 / 255.0, alpha: 1)
        backgroundColor = .red
        
        descriptionLabel.font = .boldSystemFont(ofSize: 24)
        descriptionLabel.textColor = .white
        contentView.addSubview(descriptionLabel)
        activateDescriptionLabelConstraints(view: descriptionLabel)
        
        deleteLabel.text = "Delete"
        deleteLabel.textColor = .white
        insertSubview(deleteLabel, belowSubview: contentView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func display(description: String) {
        descriptionLabel.text = description
    }
}

private typealias PrivateSwipeableCollectionViewCell = SwipeableCollectionViewCell
private extension PrivateSwipeableCollectionViewCell {
    func activateDescriptionLabelConstraints(view: UIView) {
        guard let superview = view.superview else { return }
        view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: superview.topAnchor),
            view.leadingAnchor.constraint(equalTo: superview.leadingAnchor),
            view.trailingAnchor.constraint(equalTo: superview.trailingAnchor),
            view.bottomAnchor.constraint(equalTo: superview.bottomAnchor)
            ])
    }
}
