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
    private var panGesture = UIPanGestureRecognizer()
    
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
        
        panGesture = UIPanGestureRecognizer(target: self, action: #selector(onPan))
        panGesture.delegate = self
        self.addGestureRecognizer(panGesture)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func display(description: String) {
        descriptionLabel.text = description
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        if (panGesture.state == UIGestureRecognizer.State.changed) {
            let pan: CGPoint = panGesture.translation(in: self)
            let width = self.contentView.frame.width
            let height = self.contentView.frame.height
            self.contentView.frame = CGRect(x: pan.x, y: 0, width: width, height: height);
            self.deleteLabel.frame = CGRect(x: pan.x + width + deleteLabel.frame.size.width, y: 0, width: 100, height: height)
        }
    }
    
    @objc func onPan(_ pan: UIPanGestureRecognizer) {
        if pan.state == UIGestureRecognizer.State.began {
            
        }
        else if pan.state == UIGestureRecognizer.State.changed {
            self.setNeedsLayout()
        }
        else {
            if abs(pan.velocity(in: self).x) > 500 {
                let collectionView: UICollectionView = self.superview as! UICollectionView
                let indexPath: IndexPath = collectionView.indexPathForItem(at: self.center)!
                collectionView.delegate?.collectionView!(collectionView, performAction: #selector(onPan(_:)), forItemAt: indexPath, withSender: nil)
            } else {
                UIView.animate(withDuration: 0.2, animations: {
                    self.setNeedsLayout()
                    self.layoutIfNeeded()
                })
            }
        }
    }
}

extension SwipeableCollectionViewCell: UIGestureRecognizerDelegate {
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
    
    override func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        return abs((panGesture.velocity(in: panGesture.view)).x) > abs((panGesture.velocity(in: panGesture.view)).y)
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
