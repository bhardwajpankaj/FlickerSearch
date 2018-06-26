//
//  NetworkCall.swift
//  FlickrSearch
//
//  Created by user on 27/06/18.
//  Copyright © 2018 pankajBhardwaj. All rights reserved.
//

import Foundation

class NetworkCall: NSObject {
    
    func getDataFromServer(page:Int, searchText:String, completionHandler: @escaping ([NSDictionary]?) -> Void, errorHandler: @escaping (Error) -> Void) {
        let surl = "\(Constants.baseURL)/services/rest/?method=flickr.photos.search&api_key=\(Constants.api_key)&format=json&nojsoncallback=1&&safe_search=1&text=\(searchText)&page=\(page)"
        guard let url = URL(string: surl) else {
            print("Error");
            return
        }
        
        let sesseionDataTask = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let unwrappedData = data else {
                print("Error with data");
                return
            }
            do {
                if let responseJSON = try JSONSerialization.jsonObject(with: unwrappedData, options: .allowFragments) as? NSDictionary {
                    if let apps = responseJSON.value(forKeyPath: "photos.photo") as? [NSDictionary] {
                        completionHandler(apps)
                    }
                }
            } catch {
                errorHandler(error)
                print("Error : \(error.localizedDescription)")
            }
        }
        sesseionDataTask.resume()
    }
    
}
