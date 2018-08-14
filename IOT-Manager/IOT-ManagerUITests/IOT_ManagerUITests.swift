//
//  IOT_ManagerUITests.swift
//  IOT-ManagerUITests
//
//  Created by roshan  singh  on 14/8/18.
//  Copyright © 2018 SAP. All rights reserved.
//

import XCTest

class IOT_ManagerUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
//    func readLoginDetails() -> (String,String) {
//        var logon: [String] = []
//        if let url = Bundle.main.url(forResource:"logon", withExtension: "txt") {
//            do {
//                let data = try Data(contentsOf:url)
//                let attibutedString = try NSAttributedString(data: data, documentAttributes: nil)
//                let fullText = attibutedString.string
//                let readings = fullText.components(separatedBy: CharacterSet.newlines)
//                for line in readings {
//                    logon.append(line)
//                }
//                print(readings)
//
//            } catch {
//                print(error)
//            }
//        }
//        return (logon[0],logon[1])
//    }
    
    func logonTest(application: XCUIApplication, email: String, pass: String) {
        
        let webViewsQuery = XCUIApplication().webViews
        let usernameField = webViewsQuery/*@START_MENU_TOKEN@*/.textFields["E-mail, ID, or User Name"]/*[[".otherElements[\"SAP Cloud Platform: Log On\"]",".otherElements[\"main\"]",".otherElements[\"Log On, web dialog\"].textFields[\"E-mail, ID, or User Name\"]",".textFields[\"E-mail, ID, or User Name\"]"],[[[-1,3],[-1,2],[-1,1,2],[-1,0,1]],[[-1,3],[-1,2],[-1,1,2]],[[-1,3],[-1,2]]],[0]]@END_MENU_TOKEN@*/
        let passwordField = webViewsQuery/*@START_MENU_TOKEN@*/.secureTextFields["Password"]/*[[".otherElements[\"SAP Cloud Platform: Log On\"]",".otherElements[\"main\"]",".otherElements[\"Log On, web dialog\"].secureTextFields[\"Password\"]",".secureTextFields[\"Password\"]"],[[[-1,3],[-1,2],[-1,1,2],[-1,0,1]],[[-1,3],[-1,2],[-1,1,2]],[[-1,3],[-1,2]]],[0]]@END_MENU_TOKEN@*/
        expectation(for: NSPredicate(format: "hittable == true"), evaluatedWith: usernameField, handler: nil)
        waitForExpectations(timeout: 60.0, handler: nil)
        
        usernameField.tap()
        usernameField.typeText(email)
        
        passwordField.tap()
        passwordField.typeText(pass)

        webViewsQuery/*@START_MENU_TOKEN@*/.buttons["Log On"]/*[[".otherElements[\"SAP Cloud Platform: Log On\"]",".otherElements[\"main\"]",".otherElements[\"Log On, web dialog\"].buttons[\"Log On\"]",".buttons[\"Log On\"]"],[[[-1,3],[-1,2],[-1,1,2],[-1,0,1]],[[-1,3],[-1,2],[-1,1,2]],[[-1,3],[-1,2]]],[0]]@END_MENU_TOKEN@*/.tap()
        
    }
    
    func testExample() {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        //todo :perform catch upon failed logon due to databse being switched off
        
        let app = XCUIApplication()
        
        // todo: write a file to read off login details
        // todo: note if running on simulator 'Hardware -> Keyboard -> Connect hardware keyboard' is off
        logonTest(application: app, email: "EMAIL-PLACEHOLDER", pass: "PASSWORD-PLACEHOLDER")

        
        
        
    }
    
}
