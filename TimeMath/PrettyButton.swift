//
//  PrettyButton.swift
//  TimeMath
//
//  Created by Benjamin Reed on 2/7/15.
//  Copyright (c) 2015 infixis. All rights reserved.
//

import UIKit

@IBDesignable public class PrettyButton: UIView {

    @IBInspectable var style : String?
    @IBInspectable var text : String?
    
    
    override public func layoutSubviews() {
        // make sure super renders subviews
        super.layoutSubviews()
        
        // set border and background colora based on `style`
        setAppropriateBackgroundAndBorderColors()
        
        // add the text label and its constraints
        addLabelAndConstraints()
    }
    
    public func setAppropriateBackgroundAndBorderColors() {
        // This checks the style attribute from the element in Interface Builder, and it
        // sets the corresponding background color.  Ideally, this would be an enum, but
        // the @IBInspectable tag seems to lack support for these.  :'(
        
        var color : UIColor?
        
        // if style is nil, then set it to 'Other'
        if (style == nil) {
            style = "Other"
        }
        
        switch (style!) {
        case "Numeric":
            color = UIColor(red: 245/255.0, green: 252/255.0, blue: 1.0, alpha: 1.0)
        case "Operator":
            color = UIColor(red: 209/255.0, green: 240/255.0, blue: 1.0, alpha: 1.0)
        case "Other":
            color = UIColor.whiteColor()
        default:
            break
        }
        
        self.backgroundColor = color;
        //        self.layer.backgroundColor = UIColor(red: 211/255.0, green: 211/255.0, blue: 211/255.0, alpha: 1.0)
    }
    
    public func addLabelAndConstraints() {
        // adds the text to the label, adds the current frame to the label, adds the label
        // to the view
        // TODO: ADD CONSTRAINTS
        
        // setup frame and set text
        let textLabel = UILabel(frame: CGRectMake(0, 0, self.bounds.width, self.bounds.height))
        textLabel.textAlignment = NSTextAlignment.Center
        textLabel.text = self.text
        
        // find and assign font
        let textFont = UIFont(name: "DIN Alternate", size: 32.0)
        if (textFont != nil) {
            textLabel.font = textFont!
        }
        
        // add it to the view
        self.addSubview(textLabel)
    }
    

}


