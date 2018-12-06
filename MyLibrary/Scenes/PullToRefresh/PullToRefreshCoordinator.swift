//
//  PullToRefreshCoordinator.swift
//  MyLibrary
//
//  Created by Vladislav Kondrashkov on 12/2/18.
//  Copyright © 2018 Vladislav Kondrashkov. All rights reserved.
//

import UIKit

class PullToRefreshCoordinator: Coordinator {
    private var view: PullToRefreshViewController!
    private var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        view = PullToRefreshViewController()
        let presenter = PullToRefreshPresenterImplementation(view: view)
        view.presenter = presenter
        navigationController.pushViewController(view, animated: true)
    }
}
