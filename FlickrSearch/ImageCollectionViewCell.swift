//
//  ImageCollectionViewCell.swift
//  FlickrSearch
//
//  Created by user on 27/06/18.
//  Copyright © 2018 pankajBhardwaj. All rights reserved.
//

import UIKit

class ImageCollectionViewCell: UICollectionViewCell {
   
    @IBOutlet weak var myImageView: UIImageView!
    var imagePath:String!
    override func prepareForReuse() {
        super.prepareForReuse()
        myImageView.image = nil
    }
}
