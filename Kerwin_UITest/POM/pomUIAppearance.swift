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
  
  static func getNumOfTableCellItems () -> Int {
    return tableRef.uielement.cells.count
  }
  
  static func toggleSwitchCell () {
    switchCellSwitch.uielement.tap()
  }
  
  static func getValueOfSwitchCell () -> Bool {
    let rawval: String = switchCellSwitch.uielement.value as! String
    if rawval == "1" {
      return true
    }
    else {
      return false
    }
  }
  
  static func isRadioButtonChecked () -> Bool {
    return cellRadioButtonButton.uielement.exists
  }
  
}

