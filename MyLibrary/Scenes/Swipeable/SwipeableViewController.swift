//
//  SwipeableViewController.swift
//  MyLibrary
//
//  Created by Vladislav Kondrashkov on 12/2/18.
//  Copyright © 2018 Vladislav Kondrashkov. All rights reserved.
//

import UIKit

protocol SwipeableView: class {
    
}

class SwipeableViewController: UIViewController, SwipeableView {
    var presenter: SwipeablePresenter!
    
    private var swipeableView = UIView(frame: .zero)
    private var swipeableCollectionLayout = UICollectionViewFlowLayout()
    private lazy var swipeableCollectionView = UICollectionView(frame: .zero, collectionViewLayout: swipeableCollectionLayout)
    private var swipeableDataSource = SwipeableDataSource()
    
    override func loadView() {
        swipeableView.backgroundColor = UIColor(red: 44.0 / 255.0, green: 62.0 / 255.0, blue: 80.0 / 255.0, alpha: 1)
        
        swipeableCollectionLayout.scrollDirection = .vertical
        swipeableCollectionLayout.sectionInset.left = 10
        swipeableCollectionLayout.sectionInset.right = 10
        
        swipeableCollectionView.dataSource = swipeableDataSource
        swipeableCollectionView.delegate = self
        swipeableCollectionView.register(SwipeableCollectionViewCell.self, forCellWithReuseIdentifier: "swipeableCell")
        swipeableCollectionView.backgroundColor = .clear
        swipeableView.addSubview(swipeableCollectionView)
        activateSwipeableCollectionViewConstraints(view: swipeableCollectionView)
        
        view = swipeableView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension SwipeableViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: swipeableCollectionView.bounds.width - 20, height: 50)
    }
}

extension SwipeableViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
        swipeableDataSource.items.remove(at: indexPath.row)
        swipeableCollectionView.reloadData()
    }
}

private typealias PrivateSwipeableViewController = SwipeableViewController
private extension PrivateSwipeableViewController {
    func activateSwipeableCollectionViewConstraints(view: UIView) {
        guard let superview = view.superview else { return }
        view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: superview.topAnchor),
            view.leadingAnchor.constraint(equalTo: superview.leadingAnchor),
            view.trailingAnchor.constraint(equalTo: superview.trailingAnchor),
            view.bottomAnchor.constraint(equalTo: superview.bottomAnchor),
            view.widthAnchor.constraint(equalTo: superview.widthAnchor)
            ])
    }
}
