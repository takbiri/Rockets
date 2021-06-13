//
//  RocketsViewModelTests.swift
//  Tappable TestTests
//
//  Created by Mohammad Takbiri on 6/13/21.
//

import XCTest
@testable import Tappable_Test

class RocketsViewModelTests: XCTestCase {
    
    var rockets: RocketsViewModel!
    
    override func setUp() {
        rockets = RocketsViewModel()
        super.setUp()
    }
    
    func testFetch(){
                
        weak var expectation = expectation(description: "timeout !")
        
        let model = SingleRocket(name: "Falcon 1", success_rate_pct: 40, first_flight: "2000/02/12", flickr_images: ["some image"], id: "123")
        
        rockets.fetchRockets { detail in
            XCTAssertNotNil(detail)
            XCTAssertEqual(model.success_rate_pct, detail[0].success_rate_pct)
            expectation?.fulfill()
        }
        
        self.waitForExpectations(timeout: 10){ error in
            expectation?.expectationDescription = "Test"
            print("X: async expectation")
            XCTAssertTrue(true)
        }


    }
    
    
    override func tearDown() {
        rockets = nil
        super.tearDown()
    }


}
