//
//  XCTUIAyeAyeUITests.swift
//  XCTUIAyeAyeUITests
//
//  Created by My3 Shenoy on 11/16/21.
//

import XCTest

class XCTUIAyeAyeUITests: XCTestCase {
    let app = XCUIApplication()

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
        app.launch()
    }
    
    // Check if static text exists
    func testWelcome() throws {
        let welcome = app.staticTexts["Welcome!"]
        
        XCTAssert(welcome.exists)
    }
    
    func testWelcomeLabel() throws {
        let welcome = app.staticTexts.element
        XCTAssertEqual(welcome.label, "Welcome!")
    }
    
    // The UI Element's text becomes it's default accessibility identfier
    // Test breaks if text changes because accessibility ID is now different
    func testLoginButtonWithNoAccessibilityId() throws {
        let login = app.buttons["Login"]
        XCTAssert(login.exists)
    }
    
    func testLoginButtonWithAccessibilityId() throws {
        let login = app.buttons["loginButton"]
        XCTAssert(login.exists)
    }
    
    func testLoginAppearance() throws {
        // Load the LoginView
        app.buttons["loginButton"].tap()
        let loginNavBarTitle = app.staticTexts["Login"]
        XCTAssert(loginNavBarTitle.waitForExistence(timeout: 0.5))
    }
    
    func testLoginForm() throws {
        app.buttons["loginButton"].tap()
        
        let userName = app.textFields["Username"]
        XCTAssert(userName.exists)
        
        let password = app.secureTextFields["Password"]
        XCTAssert(password.exists)
        
        let loginButton = app.buttons["loginNow"]
        XCTAssert(loginButton.exists)
        XCTAssertEqual(loginButton.label, "Login")
        
        let dismiss = app.buttons["Dismiss"]
        XCTAssert(dismiss.exists)
        
    }
    
    func testNavBarAppearance() {
        app.buttons["loginButton"].tap()
        
        let navBar = app.navigationBars.element
        let navBarTitle = app.navigationBars.staticTexts["Login"]
        XCTAssert(navBar.exists)
        XCTAssert(navBarTitle.waitForExistence(timeout: 0.5))
    }
    
    
}
