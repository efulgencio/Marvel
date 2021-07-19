//
//  MarvelTest.swift
//  MarvelTest
//
//  Created by Eduardo Fulgencio Comendeiro on 19/7/21.
//  Copyright © 2021 Eduardo Fulgencio. All rights reserved.
//

import XCTest
@testable import MarveleduardofulgencioApi

class MarvelTest: XCTestCase {
    
    var sut: ListadoModel!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = ListadoModel()
    }

    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
    }

    func testComprobarObtienePersonajes() throws {
        let promise = expectation(description: "Contiene elementos")

        sut.getListCharacter({ (result) in
            if result.results!.count > 0  {
              promise.fulfill()
            } else {
              XCTFail("No hay elementos")
            }
        })

       wait(for: [promise], timeout: 5)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }

}
