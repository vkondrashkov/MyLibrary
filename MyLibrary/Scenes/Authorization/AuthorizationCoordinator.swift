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
    private var window: UIWindow
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func start() {
        view = AuthorizationViewController()
        let presenter = AuthorizationPresenterImplementation(view: view)
        view.presenter = presenter
        window.rootViewController = view
        window.makeKeyAndVisible()
    }
}
