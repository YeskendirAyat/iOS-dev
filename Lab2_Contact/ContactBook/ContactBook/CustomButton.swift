//
//  CustomButton.swift
//  ContactBook
//
//  Created by  Yeskendir Ayat on 12.02.2021.
//

import UIKit
@IBDesignable
class CustomButton: UIButton {
    @IBInspectable var customButton:Bool=false{
        didSet{
            if customButton{
                layer.cornerRadius=10
            }
        }
    }
    override func prepareForInterfaceBuilder(){
        if customButton{
            layer.cornerRadius=10
        }
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
