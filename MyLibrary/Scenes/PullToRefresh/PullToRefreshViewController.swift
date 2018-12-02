//
//  PullToRefreshViewController.swift
//  MyLibrary
//
//  Created by Vladislav Kondrashkov on 12/2/18.
//  Copyright © 2018 Vladislav Kondrashkov. All rights reserved.
//

import UIKit

protocol PullToRefreshView: class {
    func display(emojiList: [EmojiNode])
    func endRefreshing()
}

class PullToRefreshViewController: UIViewController, PullToRefreshView {
    var presenter: PullToRefreshPresenter!
    
    private var pullToRefreshView = UIView()
    private var emojiCollectionLayout = UICollectionViewFlowLayout()
    private lazy var emojiCollectionView = UICollectionView(frame: .zero, collectionViewLayout: emojiCollectionLayout)
    private var emojiDataSource = EmojiDataSource()
    private var refreshControl = UIRefreshControl()
    
    override func loadView() {
        pullToRefreshView.backgroundColor = UIColor(red: 44.0 / 255.0, green: 62.0 / 255.0, blue: 80.0 / 255.0, alpha: 1)
        
        emojiCollectionLayout.scrollDirection = .horizontal
        emojiCollectionView.dataSource = emojiDataSource
        emojiCollectionView.delegate = self
        emojiCollectionView.register(EmojiCollectionViewCell.self, forCellWithReuseIdentifier: "emojiCell")
        emojiCollectionView.backgroundColor = .clear
        emojiCollectionView.refreshControl = self.refreshControl
        pullToRefreshView.addSubview(emojiCollectionView)
        activateEmojiCollectionViewConstraints(view: emojiCollectionView)
        
        self.refreshControl.addTarget(self, action: #selector(didPulledToRefresh), for: .valueChanged)
        self.refreshControl.backgroundColor = .clear
        self.refreshControl.tintColor = .white
        
        view = pullToRefreshView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func display(emojiList: [EmojiNode]) {
        emojiDataSource.items = emojiList
        emojiCollectionView.reloadData()
    }
    
    func endRefreshing() {
        refreshControl.endRefreshing()
    }
    
    @objc func didPulledToRefresh() {
        presenter.didPulledToRefresh()
    }
}

extension PullToRefreshViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 300, height: 70)
    }
}

private typealias PrivatePullToRefreshViewController = PullToRefreshViewController
private extension PrivatePullToRefreshViewController {
    func activateEmojiCollectionViewConstraints(view: UIView) {
        
        guard let superview = view.superview else { return }
        view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: superview.topAnchor),
            view.bottomAnchor.constraint(equalTo: superview.bottomAnchor),
            view.leadingAnchor.constraint(greaterThanOrEqualTo: superview.leadingAnchor, constant: 20),
            view.trailingAnchor.constraint(greaterThanOrEqualTo: superview.trailingAnchor, constant: -20),
            view.widthAnchor.constraint(equalTo: superview.widthAnchor)
            ])
    }
}
