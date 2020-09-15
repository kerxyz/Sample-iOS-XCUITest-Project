//
//  UtilScreenShot.swift
//  Kerwin_UITest
//
//  Created by Kerwin Lumpkins on 9/15/20.
//

import Foundation
import XCTest

enum UtilScreenShot {
    /** Performs screen capture steps. Capture will be of the XCUIElement passed. So this can be used to capture the entire screen, or of only a sub element of the screen.
     
    - Parameters:
      - el: The XCUIElement to be captured. If the entire screen window is desired, send "app" or XCUIApplication()
      - capName: Desired name of the screen capture. Typical format for screen capture is TESTREF_HIGHLEVEL_LOWLEVEL example: CHARTING_MAP_DIRECT, or similar. Avoid use of spaces. It is highly desirable to make this name unique relative to names in other tests. Note that the name of the screenshot in the Xcode results file will be a UUID (long random string of alpha chars).  The capName
      argument is used to create the name of the file.  Filename will start with the capName arg + "&$" + LONG_HEX_NUMBER.  The &$ will help to parse out only the file name.
      - keepAlways: Boolean that asserts if the screen capture is to be kept. By default, screen capture files are discarded if a test passes. This function sets keepAlays to true by default. You must set it to false to override and allow Xcode to delete the screen capture associated with this function if the test calling it passes.
     
    - Returns : none
     */
    static func captureElement (el: XCUIElement, capName: String, keepAlways: Bool = true) {
        
        XCTContext.runActivity(named: capName) {activity in
            let shot = el.screenshot()
            let shotattachment = XCTAttachment(screenshot: shot)
            shotattachment.name = capName + "$$$&&&"
            // saved screenshot will have an _LONGHEXNUM appended to the name. adding this &$ makes it easier to truncate the remaining hex from name of file found in screenshots
            if keepAlways {
                shotattachment.lifetime = .keepAlways
            }
            activity.add(shotattachment)
        }

    }
}
