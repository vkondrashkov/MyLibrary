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
        LibraryCard(title: "Технологии", description: "Ностальгия. Вспоминаем старые игры на компе", background: .cyan),
        LibraryCard(title: "Авто", description: "Разбираем ДТП с гибелью покупателя \"омывайки\"", background: .orange),
        LibraryCard(title: "Люди", description: "\"Не крали и не обманывали\"", background: UIColor.yellow),
        LibraryCard(title: "Технологии", description: "Как вулкан оставил землю без лета", background: .green),
        LibraryCard(title: "Недвижимость", description: "Комаровка днем и ночью. Фоторепортаж", background: .brown),
        LibraryCard(title: "Люди", description: "У Минска новый мэр", background: .purple)
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
        
        return cell
    }
}
