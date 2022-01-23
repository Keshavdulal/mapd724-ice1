//
//  MAPD724_W2022_ICE1_Keshav_DulalUITestsLaunchTests.swift
//  MAPD724-W2022-ICE1-Keshav-DulalUITests
//
//  Created by Keshav Dulal on 23/01/2022.
//

import XCTest

class MAPD724_W2022_ICE1_Keshav_DulalUITestsLaunchTests: XCTestCase {

    override class var runsForEachTargetApplicationUIConfiguration: Bool {
        true
    }

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    func testLaunch() throws {
        let app = XCUIApplication()
        app.launch()

        // Insert steps here to perform after app launch but before taking a screenshot,
        // such as logging into a test account or navigating somewhere in the app

        let attachment = XCTAttachment(screenshot: app.screenshot())
        attachment.name = "Launch Screen"
        attachment.lifetime = .keepAlways
        add(attachment)
    }
}
