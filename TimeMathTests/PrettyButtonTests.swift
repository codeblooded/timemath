//
//  TimeMathTests.swift
//  TimeMathTests
//
//  Created by Benjamin Reed on 2/7/15.
//  Copyright (c) 2015 infixis. All rights reserved.
//

import UIKit
import Quick
import Nimble
import TimeMath

class PrettyButtonSpec : QuickSpec {
    override func spec() {
        
        describe("PrettyButton") {
            
            var testButton : PrettyButton?
            
            beforeEach {
                testButton = PrettyButton()
            }
            
            it("should set light blue background for Numeric style") {
                let lightBlueColor = UIColor(red: 245/255.0, green: 252/255.0, blue: 1.0, alpha: 1.0)
                testButton.style = "Numeric"
                expect(testButton.backgroundColor).to(equal(lightBlueColor))
            }
            
            it("should set fluorescent blue background for Operator style") {
                let blueColor = UIColor(red: 209/255.0, green: 240/255.0, blue: 1.0, alpha: 1.0)
                testButton.style = "Operator"
                expect(testButton.backgroundColor).to(equal(blueColor))
            }
            
            it("should set white background for Other styles") {
                let whiteColor = UIColor.whiteColor()
                expect(testButton.backgroundColor).to(equal(whiteColor))
            }
        }
    }
}