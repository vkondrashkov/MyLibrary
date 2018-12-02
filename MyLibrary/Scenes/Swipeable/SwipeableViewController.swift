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
    private var swipeableTableView = UITableView(frame: .zero)
    private var swipeableDataSource = SwipeableDataSource()
    
    override func loadView() {
        swipeableView.backgroundColor = UIColor(red: 44.0 / 255.0, green: 62.0 / 255.0, blue: 80.0 / 255.0, alpha: 1)
        
        
        swipeableTableView.dataSource = swipeableDataSource
        swipeableTableView.delegate = self
        swipeableTableView.register(SwipeableTableViewCell.self, forCellReuseIdentifier: "swipeableCell")
        swipeableTableView.backgroundColor = .clear
        swipeableTableView.separatorStyle = .none
        swipeableView.addSubview(swipeableTableView)
        activateSwipeableTableViewConstraints(view: swipeableTableView)
        
        view = swipeableView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}

extension SwipeableViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.backgroundColor = .clear
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let delete = UITableViewRowAction(style: .normal, title: "Delete") { action, index in
            self.swipeableDataSource.items.remove(at: index.row)
            tableView.deleteRows(at: [index], with: .bottom)
        }
        delete.backgroundColor = UIColor(red: 231.0 / 255.0, green: 76.0 / 255.0, blue: 60.0 / 255.0, alpha: 1)
        
        let download = UITableViewRowAction(style: .normal, title: "Share") { action, index in
            print("Share button tapped")
        }
        download.backgroundColor = UIColor(red: 243.0 / 255.0, green: 156.0 / 255.0, blue: 18.0 / 255.0, alpha: 1)
        return [delete, download]
    }
    
    func tableView(_ tableView: UITableView, canPerformAction action: Selector, forRowAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return true
    }
}

private typealias PrivateSwipeableViewController = SwipeableViewController
private extension PrivateSwipeableViewController {
    func activateSwipeableTableViewConstraints(view: UIView) {
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
