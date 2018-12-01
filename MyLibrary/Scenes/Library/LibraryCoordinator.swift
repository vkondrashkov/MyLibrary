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
    private var window: UIWindow
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func start() {
        view = LibraryViewController()
        let navigationController = UINavigationController(rootViewController: view)
        let presenter = LibraryPresenterImplementation(view: view)
        view.presenter = presenter
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
}
