//
//  BDD_Cucumber_TestCases.swift
//  Kerwin_UITest
//
//  Created by Kerwin Lumpkins on 9/15/20.
//
import Foundation
import XCTest

class BDD_Cucumber_Test: KerTestBase {
  
  func testDefaultCellTypesCanSelectRadioButtonOption (){
    /*
     example test for a requirement written in gherkin (Cucumber) syntax
     Scenario: Default Cell Types Can Select Radio Button Option
     Given: User is viewing Default Cell Types page
     When: User taps on Radio Button labeled Option 1, Option 2 or Option 3
     Then: The application shall change the selected option to be what the user has selected
     */
    givenUserViewingDefaultCellTypesPage()
    whenUserTapsOnRadioButton()
    thenAppShallChangeSelectedOptionToThatUserSelected()
  }
  
}



extension KerTestBase {
  func givenUserViewingDefaultCellTypesPage() {
    pomMainPage.tapOnTableItem(whichItem: .useDefCellTypes)
    // this verifies that app is on Default Cell Types page and ensures
    // that the option radio buttons exist
    XCTAsyncAssert(uielement: pomDefaultCellTypes.radioOption2Label.uielement)
  }
  
  func whenUserTapsOnRadioButton() {
    pomDefaultCellTypes.tapOnTableItem(whichItem: .radioOption2Label)
  }
  
  func thenAppShallChangeSelectedOptionToThatUserSelected() {
    let rbSelected = pomDefaultCellTypes.whichRadioButtonIsChecked()
    XCTAssertEqual(rbSelected, radioButtonValues.Option2, "Option 2 radio button should be selected, instead was \(rbSelected)")
  }
  
}

