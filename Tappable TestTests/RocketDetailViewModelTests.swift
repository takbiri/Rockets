//
//  RocketDetailViewModelTests.swift
//  Tappable TestTests
//
//  Created by Mohammad Takbiri on 6/13/21.
//

import SwiftUI
import XCTest
@testable import Tappable_Test

class RocketDetailViewModelTests: XCTestCase {

    var rocketDetailVM: RocketDetailViewModel!
    
    override func setUp() {
        rocketDetailVM = RocketDetailViewModel()
        super.setUp()
    }
    
    
    func testGetColor(){
        
        let orange = rocketDetailVM.getColorFromSuccessRate(45)
        XCTAssertEqual(Color.orange, orange)
        
        let red = rocketDetailVM.getColorFromSuccessRate(10)
        XCTAssertEqual(Color.red, red)
        
        let green = rocketDetailVM.getColorFromSuccessRate(70)
        XCTAssertEqual(Color.green, green)
        
    }
    
    func testFetch(){
                
        weak var expectation = expectation(description: "timeout !")
        
        let model = RocketDetail(name: "Falcon 1", success_rate_pct: 40, first_flight: "12/02/1996", flickr_images: ["https://some-image.com"], cost_per_launch: 5400000, country: "United state of America", wikipedia: "https://wikipedia.com", active: false, description: "some description")
        
        rocketDetailVM.rocketID = "5e9d0d95eda69955f709d1eb"
        rocketDetailVM.fetchRocket { detail in
            XCTAssertNotNil(detail)
            XCTAssertEqual(model.success_rate_pct, detail.success_rate_pct)
            expectation?.fulfill()
        }
        
        self.waitForExpectations(timeout: 10){ error in
            expectation?.expectationDescription = "Test"
            print("X: async expectation")
            XCTAssertTrue(true)
        }


    }
    
    
    override func tearDown() {
        rocketDetailVM = nil
        super.tearDown()
    }
}
