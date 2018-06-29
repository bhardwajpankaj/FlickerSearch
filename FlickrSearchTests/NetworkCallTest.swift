//
//  NetworkCallTest.swift
//  FlickrSearchTests
//
//  Created by user on 27/06/18.
//  Copyright © 2018 pankajBhardwaj. All rights reserved.
//

import XCTest
@testable import FlickrSearch

class NetworkCallTest: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    func testAsyncCalback() {
        let service = NetworkCall()
        service.getDataFromServer(page: 1, searchText: "kittens", completionHandler: { (responseData) in
            XCTAssertTrue(true)
        }) { (error) in
            XCTFail()
            
        }
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    
}
