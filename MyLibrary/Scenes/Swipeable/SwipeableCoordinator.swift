//
//  SwipeableCoordinator.swift
//  MyLibrary
//
//  Created by Vladislav Kondrashkov on 12/2/18.
//  Copyright © 2018 Vladislav Kondrashkov. All rights reserved.
//

import UIKit

class SwipeableCoordinator: Coordinator {
    private var view: SwipeableViewController!
    private var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        view = SwipeableViewController()
        let presenter = SwipeablePresenterImplementation(view: view)
        view.presenter = presenter
        navigationController.pushViewController(view, animated: true)
    }
}
