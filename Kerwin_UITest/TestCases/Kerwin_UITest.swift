//
//  Kerwin_UITest.swift
//  Kerwin_UITest
//
//  Created by Kerwin Lumpkins on 9/13/20.
//

import XCTest

class Kerwin_UITest: KerTestBase {

    
    func testBasicOperationsUsingPOMDirect() throws {
      print ("ok")
      
      XCTContext.runActivity(named: "On main page, tap on UILabel Customization to open UI Appearance page") {_ in
        XCTAsyncAssert(uielement: pomMainPage.uiLabelCustomization.uielement)
        pomMainPage.tapOnTableItem(whichItem: .uiLabelCustomization)
      }

      XCTContext.runActivity(named: "On UIAppearance page, check switch value inital value is true") {_ in
        XCTAsyncAssert(uielement: pomUIAppearancePage.switchCellSwitch.uielement)
        let origValSwitch = pomUIAppearancePage.getValueOfSwitchCell()
        XCTAssertTrue(origValSwitch, "Initial value of switch should be true but was \(origValSwitch)")
      }
      
      XCTContext.runActivity(named: "Toggle switch value, verify it is now false") {_ in
        pomUIAppearancePage.toggleSwitchCell()
        let newValSwitch = pomUIAppearancePage.getValueOfSwitchCell()
        XCTAssertFalse(newValSwitch, "SwitchCell should have changed to false but was \(newValSwitch)")
      }
      
      XCTContext.runActivity(named: "Verify that start value of radio button is checked") {_ in
        XCTAssertTrue(pomUIAppearancePage.isRadioButtonChecked(), "Radio button should be checked but is not")
      }
      
      XCTContext.runActivity(named: "Tap on radio button, verify state changed") {_ in
        XCTAsyncAssert(uielement: pomUIAppearancePage.cellRadioButtonButton.uielement)
        
        pomUIAppearancePage.tapOnTableItem(whichItem: .cellRadioButtonLabel)
        XCTAssertFalse(pomUIAppearancePage.isRadioButtonChecked(), "Radio button should be unchecked but is not")
      }
        
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTOSSignpostMetric.applicationLaunch]) {
                XCUIApplication().launch()
            }
        }
    }
}
