//
//  _0200527_FernandoBanonoyaba_NYCSchoolsTests.swift
//  20200527-FernandoBanonoyaba-NYCSchoolsTests
//
//  Created by fernando babonoyaba on 5/28/22.
//

import XCTest
@testable import _0200527_FernandoBanonoyaba_NYCSchools

class _0200527_FernandoBanonoyaba_NYCSchoolsTests: XCTestCase {
    
    let network = ViewModelController(networkManager: MockNetworkManager())
    
    func testViewModel() {
        network.createData(urlString: "test")
        XCTAssertEqual(network.getName(0)!, "Clinton School")
        XCTAssertEqual(network.getID(0), "02M260")
        XCTAssertTrue(network.isNotEmpty())

    }
    
}

