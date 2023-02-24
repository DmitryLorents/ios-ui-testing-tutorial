//
//  UITestingTutorialUITests.swift
//  UITestingTutorialUITests
//
//  Created by Mac on 24.02.2023.
//  Copyright © 2023 Code Pro. All rights reserved.
//

import XCTest
@testable import UITestingTutorial

class UITestingTutorialUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    func testValidLoginSuccess() {
        //given
        //let sut = LoginViewController()
        let validPassword = "abc123"//sut.expectedPassword//"abc123"
        let validUserName = "CodePro"//sut.expectedUserName//"CodePro"
        let app = XCUIApplication()
        let passwordTF = app.secureTextFields["Password"]
        let userNameTF = app.textFields["Username"]
        
        //when-1
        app.launch()
        app.navigationBars["Mockify Music"].buttons["Profile"].tap()
                        
        //then-1
        XCTAssertTrue(userNameTF.exists)
        XCTAssertTrue(passwordTF.exists)
        
        //when-2
        userNameTF.tap()
        userNameTF.typeText(validUserName)
        passwordTF.tap()
        passwordTF.typeText(validPassword)
        app/*@START_MENU_TOKEN@*/.staticTexts["Login"]/*[[".buttons[\"Login\"].staticTexts[\"Login\"]",".staticTexts[\"Login\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        let downloadCell = app.tables.staticTexts["My Downloads"]
        
        
        //then-2
        wait(for: [], timeout: 5)
        XCTAssertTrue(downloadCell.exists)
        
               
                        
    }
    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
