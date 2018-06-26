//
//  ViewModel.swift
//  FlickrSearch
//
//  Created by user on 27/06/18.
//  Copyright © 2018 pankajBhardwaj. All rights reserved.
//

import Foundation

class ViewModel: NSObject {
    
    var networkCall = NetworkCall()
    
    var responseArray: [NSDictionary]?
    
    func getList(pageNo:Int, text:String,completionHandler: @escaping () -> Void) {
        networkCall.getDataFromServer(page: pageNo, searchText: text, completionHandler: { (responseData) in
            DispatchQueue.main.async {
                if let array = responseData
                {
                    self.responseArray = (self.responseArray ?? []) + array
                }
                completionHandler()
            }
        }) { (Error) in
            print(Error)
        }
    }
    
    func numberOfItemsToDisplay() -> Int {
        return responseArray?.count ?? 0
    }
    
    func imageUrlForCell(for indexPath: IndexPath) -> String {
        let photo = Photo(farm: responseArray?[indexPath.row].value(forKeyPath: "farm") as? Int ?? 2, server: responseArray?[indexPath.row].value(forKeyPath: "server") as? String ?? "", id: responseArray?[indexPath.row].value(forKeyPath: "id") as? String ?? "", secret: responseArray?[indexPath.row].value(forKeyPath: "secret") as? String ?? "")
        let baseUrl = "https://farm\(photo.farm).staticflickr.com/\(photo.server)/\(photo.id)_\(photo.secret).jpg"
        return baseUrl
    }
}
