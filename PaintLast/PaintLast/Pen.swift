//
//  Pen.swift
//  PaintLast
//
//  Created by  Yeskendir Ayat on 18.02.2021.
//

import Foundation
import UIKit
class Pen: Drawable{
    private var pts: [CGPoint]?
    var color:UIColor
    var isFill:Bool
    init(pts:[CGPoint],color:UIColor,isFill:Bool) {
        self.pts=pts
        self.color=color
        self.isFill=isFill
    }
    func drawPath(){
        let path = UIBezierPath()
        for (i,p) in (pts?.enumerated())!{
            if(i==0)
            {
                path.move(to: p)
            }
            else {
                path.addLine(to: p)
            }
        }
        path.lineWidth = 4
        color.set()
        path.stroke()
    }
}
