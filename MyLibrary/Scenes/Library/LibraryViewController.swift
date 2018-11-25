//
//  LibraryViewController.swift
//  MyLibrary
//
//  Created by Vladislav Kondrashkov on 11/25/18.
//  Copyright © 2018 Vladislav Kondrashkov. All rights reserved.
//

import UIKit

protocol LibraryView: class {
    
}

class LibraryViewController: UIViewController, LibraryView {
    var presenter: LibraryPresenter!
    
    private var libraryView = UIView(frame: .zero)
    private var gradientLayer = CAGradientLayer()
    private var titleLabel = UILabel()
    private var carouselLayout = UICollectionViewFlowLayout()
    private lazy var carouselView = UICollectionView(frame: .zero, collectionViewLayout: carouselLayout)
    private var libraryDataSource = LibraryDataSource()
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func loadView() {
        libraryView.backgroundColor = .clear
        let colorTop = UIColor(red: 41.0 / 255.0, green: 128.0 / 255.0, blue: 185.0 / 255.0, alpha: 1).cgColor
        let colorBottom = UIColor(red: 44.0 / 255.0, green: 62.0 / 255.0, blue: 80.0 / 255.0, alpha: 1).cgColor
        gradientLayer.colors = [colorTop, colorBottom]
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 0)
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 1)
        libraryView.layer.insertSublayer(gradientLayer, at: 0)
        
        titleLabel.text = "My projects"
        titleLabel.font = .boldSystemFont(ofSize: 34)
        titleLabel.textAlignment = .center
        titleLabel.textColor = .white
        libraryView.addSubview(titleLabel)
        activateTitleLabelConstraints(view: titleLabel)
        
        carouselLayout.scrollDirection = .horizontal
        carouselLayout.sectionInset.left = 20
        carouselLayout.sectionInset.right = 20
        carouselLayout.minimumLineSpacing = 20
        carouselView.dataSource = libraryDataSource
        carouselView.delegate = self
        carouselView.backgroundColor = .clear
        carouselView.register(CarouselViewCell.self, forCellWithReuseIdentifier: "card")
        libraryView.addSubview(carouselView)
        activateCarouselViewConstraints(view: carouselView, anchorView: titleLabel)
        
        view = libraryView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        gradientLayer.frame = view.bounds
    }
}

extension LibraryViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 300, height: 375)
    }
}

private typealias PrivateLibraryViewController = LibraryViewController
private extension PrivateLibraryViewController {
    func activateTitleLabelConstraints(view: UIView) {
        guard let superview = view.superview else { return }
        view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: superview.safeAreaLayoutGuide.topAnchor, constant: 40),
            view.leadingAnchor.constraint(equalTo: superview.leadingAnchor),
            view.trailingAnchor.constraint(equalTo: superview.trailingAnchor)
            ])
    }
    
    func activateCarouselViewConstraints(view: UIView, anchorView: UIView) {
        guard let superview = view.superview else { return }
        view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: anchorView.bottomAnchor, constant: 20),
            view.leadingAnchor.constraint(greaterThanOrEqualTo: superview.leadingAnchor),
            view.trailingAnchor.constraint(greaterThanOrEqualTo: superview.trailingAnchor),
            view.widthAnchor.constraint(equalTo: superview.widthAnchor),
            view.bottomAnchor.constraint(equalTo: superview.bottomAnchor)
            ])
    }
}
