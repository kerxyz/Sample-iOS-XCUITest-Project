# Sample iOS XCUITest Project

> A simple iOS app with my XCUITest Framework created from scratch

> XCUITest, sample project, iOS UI Test

<a href="http://fvcproductions.com"><img src="https://cdn.shopify.com/s/files/1/1320/7675/files/sampleProject.jpg?v=1600048765?v=3&s=200" title="How to view files" alt="FVCproductions"></a>


> About this project

I downloaded a tableview based sample project from iosexample.com, and then added an 
XCUITest target, and then added framework and test cases files.  I made a few changes 
to the appsource code from the original project, like removing the apple TV and apple 
watch targets, just to simplify the project structure.

To view my framework raw files, just git the project and view the swift files:
Framework:
	Target - Kerwin_UITest

	KerBaseClass/KerTestBaseClass.swift -  This is base test class that I created. 
	
	Page Object Model - these files contain definition of element locators and helper 
	  functions for each of app's pages/screens
	
	POM/pomMainPage - has items for the app's main menu page
	POM/pomDefaultCellTypes - has items for the page opened by first menu item
	POM/pomUIAppearance - has items for 2nd app page
	POM/pomDynamicRows - has items for 3rd app page

	TestCases - inherits from the base class, and contains the UI test cases

<a href="https://iosexample.com/a-simple-way-to-create-a-uitableview-for-settings-in-swift/">View the original project source here</a>

If you want to build and run this project, you will need to install the cocoapods file that
is at the same directory level as the .xcworkspace file.

Here is a quick gif showing the test running. You can see controls being pressed and the 
output log file at the end.
<a href="https://recordit.co/Yen8xtlUwt" target="_blank">Click here to go to video directly</a>

**Recordit**

![Recordit GIF](https://recordit.co/Yen8xtlUwt)


## License


[![License](http://img.shields.io/:license-mit-blue.svg?style=flat-square)](http://badges.mit-license.org)

- **[MIT license](http://opensource.org/licenses/mit-license.php)**
- Copyright 2020 © <a href="https://www.kerkits.com" target="_blank">kerkits.com</a>.
