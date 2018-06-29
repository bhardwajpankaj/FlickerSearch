//
//  PhotoTest.swift
//  FlickrSearchTests
//
//  Created by user on 27/06/18.
//  Copyright © 2018 pankajBhardwaj. All rights reserved.
//

import XCTest
@testable import FlickrSearch

class PhotoTest: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testInit_shouldTake()
    {
        let photo = Photo(farm: 1, server: "896", id: "43003176501", secret: "86d5b7c0b4")
        XCTAssertEqual(photo.farm, 1)
        XCTAssertEqual(photo.server, "896")
        XCTAssertEqual(photo.id, "43003176501")
        XCTAssertEqual(photo.secret, "86d5b7c0b4")
    }
    
    
}
