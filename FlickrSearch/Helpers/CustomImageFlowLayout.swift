//
//  CustomImageFlowLayout.swift
//  FlickrSearch
//
//  Created by user on 27/06/18.
//  Copyright © 2018 pankajBhardwaj. All rights reserved.
//

import UIKit

class CustomImageFlowLayout: UICollectionViewFlowLayout {
    
    override init() {
        super.init()
        setupLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupLayout()
    }
    
    override var itemSize: CGSize {
        set {
        }
        get {
            let numberOfColumns = Constants.NumberOfColumns
            let itemWidth = (Int(self.collectionView!.bounds.width) - (numberOfColumns - 1)) / numberOfColumns
            return CGSize(width: itemWidth, height: itemWidth)
        }
    }
    
    private func setupLayout() {
        minimumInteritemSpacing = 1
        minimumLineSpacing = 1
        scrollDirection = .vertical
    }
    
}
