//
//  pomUIAppearance.swift
//  Kerwin_UITest
//
//  Created by Kerwin Lumpkins on 9/13/20.
//
import Foundation
import XCTest

enum pomUIAppearancePage: String {
  case backButton = "Back"
  case switchCellSwitch = "SwitchCell"
  case tapActionCell = "TapActionCell"
  case cellNav = "CellNav"
  case navSubitleLabel = ".subtitle"
  case cellRadioButtonLabel = "CellRadioButton"
  case cellRadioButtonButton = "checkmark"
  case tableRef
  
  
  var uielement: XCUIElement {
    switch self {
    case .backButton, .cellRadioButtonButton:
      return XCUIApplication().buttons[self.rawValue]
    case .switchCellSwitch:
      return XCUIApplication().switches[self.rawValue]
    case .tapActionCell, .cellNav, .navSubitleLabel,.cellRadioButtonLabel:
      return XCUIApplication().staticTexts[self.rawValue]
    case .tableRef:
      return XCUIApplication().tables.firstMatch
    }
  }
  
  /** taps on the specified item for this page
  - parameter whichItem: which item on this page to tap
  - returns: none
  */
  static func tapOnTableItem (whichItem: pomUIAppearancePage){
    // radio button itself is disabled so cannot be tapped
    // so if radio button is arg, instead tap the static text for the cell
    if whichItem == .cellRadioButtonButton {
      cellRadioButtonLabel.uielement.tap()
    }
    else {
      whichItem.uielement.tap()
    }
  }
  
  /** retrieves the number of cells in table
  - parameters: none
  - returns: Int, count of cells in table
  */
  static func getNumOfTableCellItems () -> Int {
    return tableRef.uielement.cells.count
  }
  
  /** taps on the switch UI element to change its state from on to off and vice versa
  - parameters: none
  - returns: none
  */
  static func toggleSwitchCell () {
    switchCellSwitch.uielement.tap()
  }
  
  /** retrieves the on/off state of the switch
  - parameters: none
  - returns: Boolean, true if switch is in on state, else false
  */
  static func getValueOfSwitchCell () -> Bool {
    let rawval: String = switchCellSwitch.uielement.value as! String
    if rawval == "1" {
      return true
    }
    else {
      return false
    }
  }
  
  /** retrieves if the radio button is on (has checkmark)
  - parameters: none
  - returns: none
  */
  static func isRadioButtonChecked () -> Bool {
    return cellRadioButtonButton.uielement.exists
  }
  
}

