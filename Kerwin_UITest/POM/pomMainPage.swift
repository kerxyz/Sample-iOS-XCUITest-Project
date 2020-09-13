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
  case dynamicRows = "Dynamic Rows"
  case tableRef
  
  
  var uielement: XCUIElement {
    switch self {
    case .useDefCellTypes, .useCustomCellTypes, .uiLabelCustomization, .dynamicRows:
      return XCUIApplication().staticTexts[self.rawValue]
    case .tableRef:
      return XCUIApplication().tables.firstMatch
    }
  }
  
  static func tapOnTableItem (whichItem: pomMainPage){
    whichItem.uielement.tap()
  }
  
}
