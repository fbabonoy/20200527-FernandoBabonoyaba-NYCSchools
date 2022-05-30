//
//  _0200527_FernandoBanonoyaba_NYCSchoolsTests.swift
//  20200527-FernandoBanonoyaba-NYCSchoolsTests
//
//  Created by fernando babonoyaba on 5/28/22.
//

import XCTest
@testable import _0200527_FernandoBanonoyaba_NYCSchools

class ViewModelControllerTests: XCTestCase {
    
    private var network: ViewModelControllerProtocal?

    override func setUp() {
        super.setUp()
        network = ViewModelController(networkManager: MockNetworkManager())
        network?.createData(urlString: "test")
    }
    
    override func tearDown() {
        network = nil
        super.tearDown()
    }
    
    func testViewModelName() {
        XCTAssertEqual(network?.getName(0)!, "Clinton School")
    }
    
    func testViewModelID() {
        XCTAssertEqual(network?.getID(0), "02M260")
    }
    
    func testViewModelMathScore() {
        XCTAssertEqual(network?.math(), "404")
    }
    
    func testViewModelReadingScore() {
        XCTAssertEqual(network?.reading(), "355")
    }
    
    func testViewModelWritingScore() {
        XCTAssertEqual(network?.writing(), "363")
    }
}

