//
//  KerTestBaseClass.swift
//  Kerwin_UITest
//
//  Created by Kerwin Lumpkins on 9/13/20.
//

import Foundation
import XCTest

class KerTestBase: XCTestCase {
  
  var app = XCUIApplication()   // shortcut name for XCUIApplication() to save on typing
  
  override func setUpWithError() throws {
    super.setUp()
    continueAfterFailure = false
    app.launch()
  }

  override func tearDownWithError() throws {
    super.tearDown()
  }
  
  func XCTAsyncAssert (uielement: XCUIElement) {
    let isElementExist = uielement.waitForExistence(timeout: 10)
    if isElementExist {
      XCTAssertTrue(uielement.exists, "Wait for UI element \(uielement) failed")
    }
  }
}
