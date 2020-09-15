//
//  pomDynamic.swift
//  Kerwin_UITest
//
//  Created by Kerwin Lumpkins on 9/13/20.
//  Copyright © 2020 bcylin. All rights reserved.
//

import Foundation
import XCTest

enum pomDynamicRows : String {
  case backButton = "Back"
  case addCellLabel = "AddCell"
  case tableHeadingLabel = "Dynamic"
  case tableRef
  
  var uielement: XCUIElement {
    switch self{
    case .backButton:
      return XCUIApplication().buttons[self.rawValue]
    case .addCellLabel:
      return XCUIApplication().staticTexts[self.rawValue]
    case .tableHeadingLabel:
      return XCUIApplication().navigationBars[self.rawValue].staticTexts.firstMatch
    case .tableRef:
      return XCUIApplication().tables.firstMatch
    }
  }
  
  /** taps on the specified item for this page
  - parameter whichItem: which item on this page to tap
  - returns: none
  */
  static func tapOnTableItem (whichItem: pomDynamicRows) {
    whichItem.uielement.tap()
  }
  
  /** retrieves a count of how many dynamically added cells are present on page
  - parameters: none
  - returns: Int, count of dynamically added cells
  */
  static func getCountOfDynamicallyAddedCells () -> Int {
    return tableRef.uielement.cells.count - 1 // num of dynamically added cells is total less one (AddCell takes up one cell/row)
  }
}
