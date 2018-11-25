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
    
    override func loadView() {
        libraryView.backgroundColor = .white
        
        view = libraryView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

private typealias PrivateLibraryViewController = LibraryViewController
private extension PrivateLibraryViewController {
    
}
