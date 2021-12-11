//
//  CollectionViewData.swift
//  MoviesApplication
//
//  Created by Bengi Anıl on 11.12.2021.
//

import Foundation

class CollectionViewData: GenericDataProtocol {
    
    private(set) var collectionComponentData: ItemCollectionView

    init(collectionComponentData: ItemCollectionView) {
        self.collectionComponentData = collectionComponentData
    }
}
