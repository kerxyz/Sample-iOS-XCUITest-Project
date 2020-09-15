//
//  Kerwin_UITest.swift
//  Kerwin_UITest
//
//  Created by Kerwin Lumpkins on 9/13/20.
//

import XCTest

class Kerwin_UITest: KerTestBase {

    /*  This test case does a thorough check of the app
    Each of the runActivity is equivalent to a manual test
    "step".  Each block has a description that says in plain
   English what the block does specifically
   */
    func testBasicOperationsUsingPOMDirect() throws {
      
      XCTContext.runActivity(named: "On Main page, tap on Use Default Cell Values to open") {_ in
        XCTAsyncAssert(uielement: pomMainPage.useDefCellTypes.uielement) // wait for item to exist
        pomMainPage.tapOnTableItem(whichItem: .useDefCellTypes)
        XCTAsyncAssert(uielement: pomDefaultCellTypes.tableHeadingLabel.uielement)  // wait to let table transition
        let headingLabel = pomDefaultCellTypes.tableHeadingLabel.uielement.label
        XCTAssertEqual(headingLabel, "Default Cell Types", "Heading at top of page incorrect")
      }
      
      XCTContext.runActivity(named: "Default Cell page, verify init values of Switches and radio buttons") {_ in
        let _ = pomDefaultCellTypes.cellSwitchSetting1.uielement.waitForExistence(timeout: 3)
        let sw1OnOff = pomDefaultCellTypes.isSwitchOn(whichSwitch: .switch1)
        XCTAssertTrue(sw1OnOff, "Switch Settings 1 should be on but is not")
        
        let rbSelected = pomDefaultCellTypes.whichRadioButtonIsChecked()
        XCTAssertEqual(rbSelected, radioButtonValues.Option1, "Option 1 radio button should be selected, instead was \(rbSelected)")
      }
      
      XCTContext.runActivity(named: "Default Cell page, verify able to select switch to change value") {_ in
        pomDefaultCellTypes.tapOnSwitch(whichSwitch: .switch1)
        let sw1OnOff = pomDefaultCellTypes.isSwitchOn(whichSwitch: .switch1)
        XCTAssertFalse(sw1OnOff, "Switch Settings 1 should be off but is on instead")
      }
      
      XCTContext.runActivity(named: "Default Cell page, tap button, verify alert message shows") {_ in
        XCTAsyncAssert(uielement: pomDefaultCellTypes.buttonTapMe.uielement)
        pomDefaultCellTypes.tapOnTableItem(whichItem: .buttonTapMe)
        XCTAssertTrue(pomDefaultCellTypes.alertButtonOK.uielement.exists, "Alert message should show with OK button but it is not present")
        pomDefaultCellTypes.tapOnTableItem(whichItem: .alertButtonOK)  // tap to dismiss alert
      }
      
      XCTContext.runActivity(named: "Default Cell Page, tap on Option 2, verify selection changes") {_ in
        XCTAsyncAssert(uielement: pomDefaultCellTypes.radioOption2Label.uielement)
        pomDefaultCellTypes.tapOnTableItem(whichItem: .radioOption2Label)
        
        let rbSelected = pomDefaultCellTypes.whichRadioButtonIsChecked()
        XCTAssertEqual(rbSelected, radioButtonValues.Option2, "Option 2 radio button should be selected, instead was \(rbSelected)")
        
        pomDefaultCellTypes.tapOnTableItem(whichItem: .backButton)  // tap to go back to main menu
      }
      
      XCTContext.runActivity(named: "Main page, tap on UILabel Customization to open UI Appearance page") {_ in
        XCTAsyncAssert(uielement: pomMainPage.uiLabelCustomization.uielement) // wait for item to exist
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
        
        pomDefaultCellTypes.tapOnTableItem(whichItem: .backButton)  // tap on back to return to main menu
      }
      
      XCTContext.runActivity(named: "On Main menu, tap on Dynamic Rows, verify able to add rows") {_ in
        XCTAsyncAssert(uielement: pomMainPage.dynamicRows.uielement)  // wait for item to exist
        pomMainPage.tapOnTableItem(whichItem: .dynamicRows)  // tap on dynamic rows to open page
        XCTAsyncAssert(uielement: pomDynamicRows.tableHeadingLabel.uielement)
        let headingLabel = pomDynamicRows.tableHeadingLabel.uielement.label
        XCTAssertEqual(headingLabel, "Dynamic", "Heading at top of page incorrect")
        
        let origNumRows = pomDynamicRows.getCountOfDynamicallyAddedCells()
        XCTAssertEqual(origNumRows, 0, "Initial number of dynamic rows should be zero")
        
        pomDynamicRows.tapOnTableItem(whichItem: .addCellLabel)
        var curNumRows = pomDynamicRows.getCountOfDynamicallyAddedCells()
        XCTAssertEqual(curNumRows, origNumRows+1, "Number of Dynamically added rows should have increased to 1 but is \(curNumRows)")
        
        pomDynamicRows.tapOnTableItem(whichItem: .addCellLabel)
        curNumRows = pomDynamicRows.getCountOfDynamicallyAddedCells()
        XCTAssertEqual(curNumRows, origNumRows+2, "Number of Dynamically added rows should have increased to 2 but is \(curNumRows)")
      }
      
      XCTContext.runActivity(named: "Back button should return to main menu") {_ in
        pomDynamicRows.tapOnTableItem(whichItem: .backButton)
      }
        
    }
  

    func testLaunchPerformance() throws {
        if #available(iOS 13.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTOSSignpostMetric.applicationLaunch]) {
                XCUIApplication().launch()
            }
        }
    }
}
