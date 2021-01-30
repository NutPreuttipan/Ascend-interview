//
//  Ascend_interviewTests.swift
//  Ascend-interviewTests
//
//  Created by Preuttipan Janpen on 28/1/2564 BE.
//

import XCTest
@testable import Ascend_interview

class Ascend_interviewTests: XCTestCase {
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func test_API_GetProduct_Can_Be_Call() {
        let expectation = XCTestExpectation(description: "Download data from api")
        BaseService.sendRawRequestWithArrayResponse(endPointURL:Configuration.product.getProduct, method: .get, parameter: nil, headers: nil, responseType: ProductResponseModel.self, success: { (response) in
            XCTAssert(true)
            expectation.fulfill()
        }) { (error) in
            XCTFail(error.localizedDescription)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 10.0)
    }
}
