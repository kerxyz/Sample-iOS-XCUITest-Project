//
//  Created by Kerwin Lumpkins on 9/17/20.
//

import Foundation
import XCTest

enum UtilDeviceOperations {
    static let settingsApp = XCUIApplication(bundleIdentifier: "com.apple.Preferences")
    static let xcuielAirplaneModeSwitch: XCUIElement = settingsApp.tables.cells["Airplane Mode"]

    /** presses home button, then opens settings and determines state of airplane mode switch, then sets the value
    - parameter onTrueOffFalse: input true to turn on airplane mode, false to turn off
    - returns: none
    */
    static func setDeviceAirplaneMode (onTrueOffFalse: Bool) {
        XCUIDevice.shared.press(.home) // exits the app

        settingsApp.launch()
        let el = xcuielAirplaneModeSwitch
        var curBtnState = getStateOfAirplaneModeSwitch()
        if curBtnState == false {  // airplane mode is off
            if onTrueOffFalse == true {
                el.tap()
            }
        } else { // airplane mode is on
            if onTrueOffFalse == false {
                el.tap()
            }
        }

        curBtnState = getStateOfAirplaneModeSwitch()
        if curBtnState == onTrueOffFalse {
            print ("setting operation passed")
        } else {
            XCTFail("Attempt to set airplane mode failed")
        }
      
        XCUIApplication().activate()
    }

    /** fetches the state of the settings screen/airplane mode button
    - parameter none
    - returns: true if on, false if off
    */
    static func getStateOfAirplaneModeSwitch () -> Bool {
        var retval = false
        if let rawstr = xcuielAirplaneModeSwitch.value as? String {
            if rawstr.contains("0") {
                retval = false
            } else {
                retval = true
            }
        }
        return retval
    }
}

