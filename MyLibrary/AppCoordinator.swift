//
//  AppCoordinator.swift
//  MyLibrary
//
//  Created by Vladislav Kondrashkov on 11/25/18.
//  Copyright © 2018 Vladislav Kondrashkov. All rights reserved.
//

import UIKit

protocol Coordinator {
    func start()
}

class AppCoordinator: Coordinator {
    private var window: UIWindow
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func start() {
        let libraryCoordinator = LibraryCoordinator(window: window)
        libraryCoordinator.start()
    }
}
