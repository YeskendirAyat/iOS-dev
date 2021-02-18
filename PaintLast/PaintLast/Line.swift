//
//  Line.swift
//  PaintLast
//
//  Created by  Yeskendir Ayat on 18.02.2021.
//

import Foundation
import UIKit
class Line: Drawable {
    var p1:CGPoint
    var p2:CGPoint
    var isFill:Bool
    var color:UIColor
    
    init(p1:CGPoint,p2:CGPoint,isFill:Bool,color:UIColor) {
        self.p1=p1
        self.p2=p2
        self.isFill=isFill
        self.color=color
    }
    func drawPath(){
        let path = UIBezierPath()
        path.move(to: p1)
        path.addLine(to: p2)
        path.lineWidth = 3
        path.close()
        color.set()
        path.stroke()
    }
}
