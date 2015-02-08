//
//  ViewControllerTests.swift
//  TimeMath
//
//  Created by Benjamin Reed on 2/8/15.
//  Copyright (c) 2015 infixis. All rights reserved.
//

import UIKit
import Quick
import Nimble
import TimeMath

class ViewControllerSpec: QuickSpec {
    override func spec() {
        
        describe("ViewController") {
            
            var vc : ViewController?
            
            beforeEach {
                vc = ViewController()
            }
            
            it("should respond to C button and clear everything") {
                // fill with data
                vc.tapEvent_1()
                vc.tapEvent_5()
                
                // check if cleared
                vc.tapEvent_C()
                expect(vc.heap1.count).to(equal(0))
                expect(vc.heap2.count).to(equal(0))
            }
            
            it("should divide two numbers") {
                // 01:00
                vc.tapEvent_1()
                vc.tapEvent_0()
                vc.tapEvent_0()
                
                vc.tapEvent_DIV()
                
                // 00:02
                vc.tapEvent_2()
                
                vc.tapEvent_EQ()
                expect(vc.lab_focused.text).to(equal("00:30"))
            }
            
            it("should multiply two numbers") {
                // 01:00
                vc.tapEvent_1()
                vc.tapEvent_0()
                vc.tapEvent_0()
                
                vc.tapEvent_MUL()
                
                // 00:02
                vc.tapEvent_2()
                
                vc.tapEvent_EQ()
                expect(vc.lab_focused.text).to(equal("02:00"))
            }
            
            it("should subtract two numbers") {
                // 01:00
                vc.tapEvent_1()
                vc.tapEvent_0()
                vc.tapEvent_0()
                
                vc.tapEvent_SUB()
                
                // 00:25
                vc.tapEvent_2()
                vc.tapEvent_5()
                
                vc.tapEvent_EQ()
                expect(vc.lab_focused.text).to(equal("00:35"))
            }
            
            it("should add two numbers") {
                // 00:35
                vc.tapEvent_3()
                vc.tapEvent_5()
                
                vc.tapEvent_ADD()
                
                // 00:25
                vc.tapEvent_2()
                vc.tapEvent_5()
                
                vc.tapEvent_EQ()
                expect(vc.lab_focused.text).to(equal("01:00"))
            }
            
            it("should add and display a number for heap1") {
                // 01:00
                vc.tapEvent_1()
                vc.tapEvent_0()
                vc.tapEvent_0()
                
                expect(vc.lab_focused.text).to(equal("01:00"))
            }
            
            it("should add and display a number for heap2 when operator tapped") {
                // 00:01
                vc.tapEvent_1()
                
                vc.tapEvent_ADD()
                
                // 02:00
                vc.tapEvent_2()
                vc.tapEvent_0()
                vc.tapEvent_0()
                
                expect(vc.lab_focused.text).to(equal("02:00"))
            }
            
            it("should display heap1's number in tiny label when heap2 active") {
                // 00:01
                vc.tapEvent_1()
                
                vc.tapEvent_ADD()
                
                // 02:00
                vc.tapEvent_2()
                vc.tapEvent_0()
                vc.tapEvent_0()
                
                expect(vc.lab_unfocused.text).to(equal("00:01"))
            }
            
            it("should properly find composition of heaps by adding a single zero") {
                // numbers entered as 1-2-4
                vc.heap1 = [4,2,1]
                vc.composition(&vc.heap1)
                expect(vc.heap1).to(contain(4))
                expect(vc.heap1).to(contain(2))
                expect(vc.heap1).to(contain(1))
                expect(vc.heap1).to(contain(0))
            }
            
            it("should properly find composition of heaps by adding multiple zeros") {
                // numbers entered as 1
                vc.heap1 = [1]
                vc.composition(&vc.heap1)
                expect(vc.heap1[0]).to(equal(1))
                expect(vc.heap1[1]).to(equal(0))
                expect(vc.heap1[2]).to(equal(0))
                expect(vc.heap1[3]).to(equal(0))
            }
            
            it("should properly find composition of heaps by converting to minutes") {
                // numbers entered as 1-0-0
                vc.heap1 = [0,0,1]
                let minutes = vc.composition(&vc.heap1)
                expect(minutes).to(equal(60))
            }
        }
        
    }
}
