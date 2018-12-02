//
//  AuthorizationCoordinator.swift
//  MyLibrary
//
//  Created by Vladislav Kondrashkov on 12/1/18.
//  Copyright © 2018 Vladislav Kondrashkov. All rights reserved.
//

import UIKit

class AuthorizationCoordinator: Coordinator {
    private var view: AuthorizationViewController!
    private var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        view = AuthorizationViewController()
        let presenter = AuthorizationPresenterImplementation(view: view)
        view.presenter = presenter
        navigationController.pushViewController(view, animated: true)
    }
}
