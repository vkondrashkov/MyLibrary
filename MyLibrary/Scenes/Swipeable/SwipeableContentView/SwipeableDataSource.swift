//
//  SwipeableDataSource.swift
//  MyLibrary
//
//  Created by Vladislav Kondrashkov on 12/2/18.
//  Copyright © 2018 Vladislav Kondrashkov. All rights reserved.
//

import UIKit

class SwipeableDataSource: NSObject, UICollectionViewDataSource {
    var items: [SwipeableNode] = [
        SwipeableNode(description: "First task"),
        SwipeableNode(description: "Some item placed here"),
        SwipeableNode(description: "OMG, what's the point"),
        SwipeableNode(description: "Another item"),
        SwipeableNode(description: "Hope it works fine"),
        SwipeableNode(description: "Final one"),
        SwipeableNode(description: "Sorry, joke"),
        SwipeableNode(description: "Need to make some more"),
        SwipeableNode(description: "And it's not final one"),
        SwipeableNode(description: "Hello 🙂"),
        SwipeableNode(description: "Final one")
    ]
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = items[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "swipeableCell", for: indexPath) as! SwipeableCollectionViewCell
        cell.display(description: item.description)
        
        return cell
    }
}
