//
//  ViewController.swift
//  TimeMath
//
//  Created by Benjamin Reed on 2/7/15.
//  Copyright (c) 2015 infixis. All rights reserved.
//

import UIKit

public enum Operand {
    case Division
    case Multiplication
    case Subtraction
    case Addition
}

public class ViewController: UIViewController, UIAlertViewDelegate {
    public var heap1 : [Int] = []
    public var heap2 : [Int] = []
    public var operand : Operand?
    public var heap1Full : Bool = false
    
    @IBOutlet weak var backdropView: UIView!
    @IBOutlet weak public var lab_focused: UILabel!
    @IBOutlet weak public var lab_unfocused: UILabel!

    @IBOutlet weak var btn_0: PrettyButton!
    @IBOutlet weak var btn_1: PrettyButton!
    @IBOutlet weak var btn_2: PrettyButton!
    @IBOutlet weak var btn_3: PrettyButton!
    @IBOutlet weak var btn_4: PrettyButton!
    @IBOutlet weak var btn_5: PrettyButton!
    @IBOutlet weak var btn_6: PrettyButton!
    @IBOutlet weak var btn_7: PrettyButton!
    @IBOutlet weak var btn_8: PrettyButton!
    @IBOutlet weak var btn_9: PrettyButton!
    @IBOutlet weak var btn_AM: PrettyButton!
    @IBOutlet weak var btn_PM: PrettyButton!
    @IBOutlet weak var btn_C: PrettyButton!
    @IBOutlet weak var btn_RE: PrettyButton!
    @IBOutlet weak var btn_DIV: PrettyButton!
    @IBOutlet weak var btn_MUL: PrettyButton!
    @IBOutlet weak var btn_SUB: PrettyButton!
    @IBOutlet weak var btn_ADD: PrettyButton!
    @IBOutlet weak var btn_EQ: PrettyButton!
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        
        // hide the unfocused label until it is needed
        lab_unfocused.hidden = true
        
        setUpEvents()
    }

    override public func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setUpEvents() {
        // initializes and configures all UITapGestureRecognizers
        // needed for the calculator
        
        let tapr_0 = UITapGestureRecognizer(target: self, action: "tapEvent_0")
        btn_0.addGestureRecognizer(tapr_0)
        
        let tapr_1 = UITapGestureRecognizer(target: self, action: "tapEvent_1")
        btn_1.addGestureRecognizer(tapr_1)
        
        let tapr_2 = UITapGestureRecognizer(target: self, action: "tapEvent_2")
        btn_2.addGestureRecognizer(tapr_2)
        
        let tapr_3 = UITapGestureRecognizer(target: self, action: "tapEvent_3")
        btn_3.addGestureRecognizer(tapr_3)
        
        let tapr_4 = UITapGestureRecognizer(target: self, action: "tapEvent_4")
        btn_4.addGestureRecognizer(tapr_4)
        
        let tapr_5 = UITapGestureRecognizer(target: self, action: "tapEvent_5")
        btn_5.addGestureRecognizer(tapr_5)
        
        let tapr_6 = UITapGestureRecognizer(target: self, action: "tapEvent_6")
        btn_6.addGestureRecognizer(tapr_6)
        
        let tapr_7 = UITapGestureRecognizer(target: self, action: "tapEvent_7")
        btn_7.addGestureRecognizer(tapr_7)
        
        let tapr_8 = UITapGestureRecognizer(target: self, action: "tapEvent_8")
        btn_8.addGestureRecognizer(tapr_8)
        
        let tapr_9 = UITapGestureRecognizer(target: self, action: "tapEvent_9")
        btn_9.addGestureRecognizer(tapr_9)
        
        let tapr_AM = UITapGestureRecognizer(target: self, action: "tapEvent_AM")
        btn_AM.addGestureRecognizer(tapr_AM)
        
        let tapr_PM = UITapGestureRecognizer(target: self, action: "tapEvent_PM")
        btn_PM.addGestureRecognizer(tapr_PM)
        
        let tapr_C = UITapGestureRecognizer(target: self, action: "tapEvent_C")
        btn_C.addGestureRecognizer(tapr_C)
    
        let tapr_RE = UITapGestureRecognizer(target: self, action: "tapEvent_RE")
        btn_RE.addGestureRecognizer(tapr_RE)
        
        let tapr_DIV = UITapGestureRecognizer(target: self, action: "tapEvent_DIV")
        btn_DIV.addGestureRecognizer(tapr_DIV)
        
        let tapr_MUL = UITapGestureRecognizer(target: self, action: "tapEvent_MUL")
        btn_MUL.addGestureRecognizer(tapr_MUL)
        
        let tapr_SUB = UITapGestureRecognizer(target: self, action: "tapEvent_SUB")
        btn_SUB.addGestureRecognizer(tapr_SUB)
        
        let tapr_ADD = UITapGestureRecognizer(target: self, action: "tapEvent_ADD")
        btn_ADD.addGestureRecognizer(tapr_ADD)
        
        let tapr_EQ = UITapGestureRecognizer(target: self, action: "tapEvent_EQ")
        btn_EQ.addGestureRecognizer(tapr_EQ)
    }
    
// MARK: Numeric Button Events
    public func tapEvent_0() {
        addNumericToHeaps(0)
    }
    
    public func tapEvent_1() {
        addNumericToHeaps(1)
    }
    
    public func tapEvent_2() {
        addNumericToHeaps(2)
    }
    
    public func tapEvent_3() {
        addNumericToHeaps(3)
    }
    
    public func tapEvent_4() {
        addNumericToHeaps(4)
    }
    
    public func tapEvent_5() {
        addNumericToHeaps(5)
    }
    
    public func tapEvent_6() {
        addNumericToHeaps(6)
    }
    
    public func tapEvent_7() {
        addNumericToHeaps(7)
    }
    
    public func tapEvent_8() {
        addNumericToHeaps(8)
    }
    
    public func tapEvent_9() {
        addNumericToHeaps(9)
    }
    
// MARK: Functional Button Events
    public func tapEvent_AM() {
        showAlertView()
    }
    
    public func tapEvent_PM() {
        showAlertView()
    }
    
    public func tapEvent_C() {
        // when the C button is pressed, both stacks are cleared, as well
        // as, their AM/PM counterparts
        heap1 = []
        heap2 = []
        
        // clear the labels
        lab_unfocused.text = ""
        lab_unfocused.hidden = true
        lab_focused.text = "00:00"
    }
    
    public func tapEvent_RE() {
        showAlertView()
    }
    
// MARK: Operator Button Events
    public func tapEvent_DIV() {
        operand = .Division
        finalizeHeap(true)
    }
    
    public func tapEvent_MUL() {
        operand = .Multiplication
        finalizeHeap(true)
    }
    
    public func tapEvent_SUB() {
        operand = .Subtraction
        finalizeHeap(true)
    }
    
    public func tapEvent_ADD() {
        operand = .Addition
        finalizeHeap(true)
    }
    
    public func tapEvent_EQ() {
        let val1 = composition(&heap1)
        let val2 = composition(&heap2)
        var result : Double
        
        switch (operand!) {
        case .Division:
            result = val1 / val2
        case .Multiplication:
            result = val1 * val2
        case .Subtraction:
            result = val1 - val2
        case .Addition:
            result = val1 + val2
        }
        
        // clean heaps
        heap1 = []
        heap2 = []
        heap1Full = false
        operand = nil
        
        // display the result
        lab_unfocused.hidden = true
        let hours = Int(result / 60)
        let minutes = Int(result % 60)
        let hoursPretty = hours < 10 ? "0\(hours)" : "\(hours)"
        let minutesPretty = minutes < 10 ? "0\(minutes)" : "\(minutes)"
        lab_focused.text = "\(hoursPretty):\(minutesPretty)"
    }

// MARK: Convienence Methods
    public func addNumericToHeaps(number : Int) {
        // adds the numbers to the appropriate heaps and calls
        // other methods to set display
        if (finalizeHeap(false)) {
            heap1.insert(number, atIndex: 0)
            setLabels(heap1, label: lab_focused)
        }
        else {
            heap2.insert(number, atIndex: 0)
            setLabels(heap2, label: lab_focused)
        }
    }
    
// MARK: Internal Calculations
    public func finalizeHeap(force : Bool) -> Bool {
        // checks whether the second heap should become active.
        // if force is set, it doesn't check.
        // returns whether space if available in heap1
        
        if (force || (heap1.count == 4)) {
            // switch to heap2
            heap1Full = true
            // set label
            lab_unfocused.hidden = false
            setLabels(heap1, label: lab_unfocused)
        }
        
        return !heap1Full
    }
    
    public func setLabels(heap : [Int], label : UILabel) {
        // Creates and sets the label for the heap
        // using a copy of the reverse
        
        var copy = heap.reverse()
        // assume anything less than four numbers is a zero
        if (copy.count < 4) {
            let missing = 4 - copy.count
            // insert missing zeros
            for i in 0..<missing {
                copy.insert(0, atIndex: 0)
            }
        }
        
        let text = "\(copy[0])\(copy[1]):\(copy[2])\(copy[3])"
        label.text = text
    }
    
    public func composition(inout heap : [Int]) -> Double {
        // assume anything less than four numbers is a zero
        if (heap.count < 4) {
            let missing = 4 - heap.count
            // insert missing zeros
            for i in 0..<missing {
                heap.append(0)
            }
        }
        
        // find the decimal representation of the time
        let t1 = Double(10 * heap[3])
        let t2 = Double(heap[2])
        let t3 = Double(10 * heap[1])
        let t4 = Double(heap[0])
        return (((t1 + t2) * 60) + (t3 + t4))
    }

// MARK: UIAlertView
    public func showAlertView() {
        let alert = UIAlertView(title: "Purchase Only", message: "Despite the limited functionality of this app, we need to take all your money to enable that feature.", delegate: self, cancelButtonTitle: "Cancel", otherButtonTitles: "Buy")
        
        alert.show()
    }
    
    public func alertView(alertView: UIAlertView, clickedButtonAtIndex buttonIndex: Int) {
        
        if (buttonIndex == 1) {
            UIAlertView(title: "Wait... what?", message: "You just can't be serious!", delegate: self, cancelButtonTitle: "Nevermind").show()
        }
    }
    
}

