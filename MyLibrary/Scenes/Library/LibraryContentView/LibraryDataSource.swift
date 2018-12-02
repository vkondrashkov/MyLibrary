//
//  LibraryDataSource.swift
//  MyLibrary
//
//  Created by Vladislav Kondrashkov on 11/25/18.
//  Copyright © 2018 Vladislav Kondrashkov. All rights reserved.
//

import UIKit

class LibraryDataSource: NSObject, UICollectionViewDataSource {
    private var items: [LibraryCard] = [
        LibraryCard(title: "Login", description: "Animated authorization screen.", background: UIColor(red: 155.0 / 255.0, green: 89.0 / 255.0, blue: 182.0 / 255.0, alpha: 1.0)),
        LibraryCard(title: "PullToRefresh", description: "PullToRefresh implementation for UICollectionView", background: UIColor(red: 192.0 / 255.0, green: 57.0 / 255.0, blue: 43.0 / 255.0, alpha: 1.0)),
        LibraryCard(title: "Title", description: "Just template. Additional card in carousel view.", background: .gray)
    ]
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = items[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "card", for: indexPath) as! CarouselViewCell
        cell.display(card: item)
        cell.tag = indexPath.row
        
        return cell
    }
}
