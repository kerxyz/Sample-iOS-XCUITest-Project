//
//  pomMainPage.swift
//  Kerwin_UITest
//
//  Created by Kerwin Lumpkins on 9/13/20.
//

import Foundation
import XCTest

enum pomMainPage: String {
  case useDefCellTypes = "Use default cell types"
  case useCustomCellTypes = "Use custom cell types"
  case uiLabelCustomization = "UILabel customization"
  case dynamicRows = "Dynamic"
  case tableRef
  
  
  var uielement: XCUIElement {
    switch self {
    case .useDefCellTypes, .useCustomCellTypes, .uiLabelCustomization, .dynamicRows:
      return XCUIApplication().staticTexts[self.rawValue]
    case .tableRef:
      return XCUIApplication().tables.firstMatch
    }
  }
  
  /** taps on the specified item for this page
  - parameter whichItem: which item on this page to tap
  - returns: none
  */
  static func tapOnTableItem (whichItem: pomMainPage){
    whichItem.uielement.tap()
  }
  
}
