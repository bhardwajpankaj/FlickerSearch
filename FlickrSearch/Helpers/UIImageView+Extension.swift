//
//  UIImageView+Extension.swift
//  FlickrSearch
//
//  Created by user on 27/06/18.
//  Copyright © 2018 pankajBhardwaj. All rights reserved.
//

import UIKit
let imageCache = NSCache<NSString, UIImage>()

extension UIImageView {
    //MARK: - Variables
    private struct Holder {
        static var _myComputedProperty = ""
    }
    var imageViewUrl:String? {
        get {
            return Holder._myComputedProperty
        }
        set(newValue) {
            Holder._myComputedProperty = newValue ?? ""
        }
    }
   
    func downloadImage(from imgURL: String, placeholder:UIImage) {
        let url = URLRequest(url: URL(string: imgURL)!)
        self.imageViewUrl = imgURL
        // check if the image is already in the cache
        if let imageToCache = imageCache.object(forKey: imgURL as NSString) {
            self.image = imageToCache
            return
        }
        
        self.image = #imageLiteral(resourceName: "placeholder")
        
        // download the image asynchronously
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if error != nil {
                print(error!)
                return
            }
            DispatchQueue.main.async {
                // create UIImage
                if let imageData = data
                {
                    let imageToCache = UIImage(data: imageData) ?? UIImage()
                    imageCache.setObject(imageToCache, forKey: imgURL as NSString)
                    if(imgURL == self.imageViewUrl){
                        self.image = imageToCache
                    }
                }
            }
        }
        task.resume()
    }
}
