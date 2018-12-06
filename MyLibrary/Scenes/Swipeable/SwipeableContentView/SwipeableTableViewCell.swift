//
//  SwipeableCollectionViewCell.swift
//  MyLibrary
//
//  Created by Vladislav Kondrashkov on 12/2/18.
//  Copyright © 2018 Vladislav Kondrashkov. All rights reserved.
//

import UIKit

class SwipeableTableViewCell: UITableViewCell {
    private var descriptionLabel = UILabel(frame: .zero)
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.backgroundColor = .clear
        descriptionLabel.font = .boldSystemFont(ofSize: 24)
        descriptionLabel.textColor = .white
        contentView.addSubview(descriptionLabel)
        activateDescriptionLabelConstraints(view: descriptionLabel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func display(description: String) {
        descriptionLabel.text = description
    }
}

private typealias PrivateSwipeableTableViewCell = SwipeableTableViewCell
private extension PrivateSwipeableTableViewCell {
    func activateDescriptionLabelConstraints(view: UIView) {
        guard let superview = view.superview else { return }
        view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: superview.topAnchor),
            view.leadingAnchor.constraint(equalTo: superview.leadingAnchor, constant: 10),
            view.trailingAnchor.constraint(equalTo: superview.trailingAnchor, constant: -10),
            view.bottomAnchor.constraint(equalTo: superview.bottomAnchor)
            ])
    }
}
