//
//  pomDefaultCellTypes.swift
//  Kerwin_UITest
//
//  Created by Kerwin Lumpkins on 9/13/20.
//  Copyright © 2020 bcylin. All rights reserved.
//

import Foundation
import XCTest

enum radioButtonValues : String {
  case Option1
  case Option2
  case Option3
  case ERROR_radioButton
}

enum switchID : String {
  case switch1
  case switch2
}

enum pomDefaultCellTypes : String {
  case tableHeadingLabel = "Default Cell Types"
  case cellSwitchSetting1 = "Setting 1"
  case cellSwitchSetting2 = "Setting 2"
  case buttonTapMe = "Tap Me"
  case cellGear = "Gear"
  case cellGlobe = "Globe"
  case cellGlobeInfoButton = "More Info"
  case cellClock = "Clock"
  case cellPlain = "Plain"
  case radioOption1Label = "Option 1"
  case radioOption2Label = "Option 2"
  case radioOption3Label = "Option 3"
  case radioButtonIndicator = "checkmark"
  case alertButtonOK = "OK"
  case backButton = "Back"
  
  var uielement : XCUIElement {
    switch self {
    case .cellSwitchSetting1, .cellSwitchSetting2, .buttonTapMe, .cellGear,
         .cellGlobe, .cellClock, .cellPlain, .radioOption1Label, .radioOption2Label,
         .radioOption3Label:
      return XCUIApplication().staticTexts[self.rawValue]
    case .cellGlobeInfoButton, .radioButtonIndicator, .alertButtonOK, .backButton:
      return XCUIApplication().buttons[self.rawValue]
    case .tableHeadingLabel:
      return XCUIApplication().navigationBars[self.rawValue].staticTexts.firstMatch
    }
  }
  
  static func tapOnTableItem (whichItem: pomDefaultCellTypes) {
    whichItem.uielement.tap()
  }
  
  static func tapOnSwitch (whichSwitch: switchID) {
    if whichSwitch == .switch1 {
      XCUIApplication().switches[cellSwitchSetting1.rawValue].tap()
    }
    else {
      XCUIApplication().switches[cellSwitchSetting2.rawValue].tap()
    }
  }
  
  static func isSwitchOn (whichSwitch: switchID) -> Bool {
    var retval: Bool = false
    var rawValStr = ""
    if whichSwitch == .switch1 {
      rawValStr = XCUIApplication().switches[cellSwitchSetting1.rawValue].value as! String
    }
    else {
      rawValStr = XCUIApplication().switches[cellSwitchSetting2.rawValue].value as! String
    }
    if rawValStr.contains("1") {
      retval = true
    }
    else {
      retval = false
    }
    return retval
  }
  
  static func whichRadioButtonIsChecked () -> radioButtonValues {
    var retval: radioButtonValues = .ERROR_radioButton
    let parentCell = XCUIApplication().tables.cells.containing(.button, identifier: radioButtonIndicator.rawValue)
    let rawStr = parentCell.staticTexts.firstMatch.label
    if rawStr.contains("1"){
      retval = .Option1
    }
    else if rawStr.contains("2"){
      retval = .Option2
    }
    else if rawStr.contains("3"){
      retval = .Option3
    }
    return retval
  }
}
