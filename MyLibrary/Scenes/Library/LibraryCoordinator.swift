//
//  LibraryCoordinator.swift
//  MyLibrary
//
//  Created by Vladislav Kondrashkov on 11/25/18.
//  Copyright © 2018 Vladislav Kondrashkov. All rights reserved.
//

import UIKit

class LibraryCoordinator: Coordinator {
    private var view: LibraryViewController!
    private var navigationController: UINavigationController!
    private var window: UIWindow
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func start() {
        view = LibraryViewController()
        view.coordinator = self
        navigationController = UINavigationController(rootViewController: view)
        let presenter = LibraryPresenterImplementation(view: view)
        view.presenter = presenter
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
        view.coordinator = self
    }
    
    func startNewFlow(tag: Int) {
        switch tag {
        case 0:
            let authorizationCoordinator = AuthorizationCoordinator(navigationController: navigationController)
            authorizationCoordinator.start()
        case 1:
            let pullToRefreshCoordinator = PullToRefreshCoordinator(navigationController: navigationController)
            pullToRefreshCoordinator.start()
        case 2:
            let swipeableCoordinator = SwipeableCoordinator(navigationController: navigationController)
            swipeableCoordinator.start()
        default:
            return
        }
    }
}
