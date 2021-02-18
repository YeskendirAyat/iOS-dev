//
//  Triangle.swift
//  PaintLast
//
//  Created by  Yeskendir Ayat on 18.02.2021.
//

import Foundation
import UIKit
class Triangle: Drawable {

    var p1:CGPoint
    var p2:CGPoint
    var color:UIColor
    var isFill:Bool
    init(p1:CGPoint,p2:CGPoint,color:UIColor,isFill:Bool){
        self.p1=p1
        self.p2=p2
        self.color=color
        self.isFill=isFill
    }
    func drawPath() {
        let triangle = UIBezierPath()
        triangle.move(to: CGPoint(x: p1.x, y: p1.y))
        triangle.addLine(to: CGPoint(x: p1.x, y: p2.y))
        triangle.addLine(to: CGPoint(x: p2.x, y: p2.y))
        triangle.close()
        color.setFill()
        (isFill) ? (triangle.fill()) : (triangle.stroke())
    }
}

