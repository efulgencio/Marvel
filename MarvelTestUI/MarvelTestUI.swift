//
//  MarvelTestUI.swift
//  MarvelTestUI
//
//  Created by Eduardo Fulgencio Comendeiro on 20/7/21.
//  Copyright © 2021 Eduardo Fulgencio. All rights reserved.
//

import XCTest
@testable import MarveleduardofulgencioApi

class MarvelTestUI: XCTestCase {

    var app: XCUIApplication!
    var personajeView: XCUIElement?
    
    override func setUpWithError() throws {
        continueAfterFailure = false
        self.app = XCUIApplication()
        self.app.launch()
    }

    override func tearDownWithError() throws {
        app.terminate()
    }

    func testListoToDetalle() throws {
        
        app.tables["table_listado"].cells.element(boundBy: 0).tap()
        
        let personajeView = app.otherElements["personaje_view"]
        XCTAssertTrue(personajeView.exists)
    }
    
    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
