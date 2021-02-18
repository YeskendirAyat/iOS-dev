//
//  Circle.swift
//  PaintLast
//
//  Created by  Yeskendir Ayat on 18.02.2021.
//

import Foundation
import UIKit
class Circle:Drawable{
    private var circleCentre: CGPoint
    private var radius: CGFloat = 0.0
    private var color: UIColor
    private var strokeWidth: CGFloat = 0.0
    private var isFilled: Bool
    init(radius:CGFloat,circleCentre:CGPoint,color:UIColor,strokeWidth:CGFloat, isFilled:Bool ){
        self.radius=radius
        self.circleCentre=circleCentre
        self.color=color
        self.strokeWidth=strokeWidth
        self.isFilled=isFilled
    }
    func drawPath(){
        let path=UIBezierPath(arcCenter: self.circleCentre, radius: self.radius, startAngle: 0, endAngle: 2*Double.pi.cg, clockwise: isFilled)
        path.lineWidth=strokeWidth
        color.set()
        (isFilled) ? (path.fill()) : (path.stroke())
        
    }
}
extension Double{
    var cg: CGFloat{
        return CGFloat(self)
    }
}
