//
//  Custom.swift
//  PaintLast
//
//  Created by  Yeskendir Ayat on 18.02.2021.
//

import UIKit
protocol Drawable {
    func drawPath()
}

class Custom: UIView {
    var mainVC : ViewController!
    var shapeType="pen"
    var arrayOfFigures:[Drawable]=[] 
    var point1:CGPoint?
    var point2:CGPoint!
    var points = [CGPoint]()
    var color:UIColor=UIColor.black
    var fillShape:Bool=true
    var penTrack:CGPoint?
    
    override func draw(_ rect: CGRect) {
//        setNeedsDisplay()

        // Drawing code
//        let circle=Circle.init(radius: 100,circleCentre: CGPoint(x: 100, y: 200), color: UIColor.red,strokeWidth: 4, isFilled: true)
//        let rect = Rectangle.init(p1: CGPoint(x: 30, y: 100), p2: center, color: UIColor.black, strokeWidth: 5, isFilled: false)
////        rect.drawPath()
//        arrayOfFigures.append(circle)
//        arrayOfFigures.append(rect)
//        for figure in arrayOfFigures {
//            figure.drawPath()
//        }
//        setNeedsDisplay()

//        circle.drawPath()
        
//        if let p1=point1{
//            print(color)
//            let rect=Rectangle(p1: p1, p2: point2, color: self.color, strokeWidth: 4, isFilled: self.fillShape)
//            reload()
//            arrayOfFigures.append(rect)
        if let p1=point1{
            switch shapeType {
            case "circle":
                let circle=Circle(radius: point2.x-p1.x,circleCentre: p1, color: color,strokeWidth: 4, isFilled: fillShape)
                arrayOfFigures.append(circle)
            case "rectangle":
                let rect=Rectangle(p1: p1, p2: point2, color: self.color, strokeWidth: 4, isFilled: self.fillShape)
                arrayOfFigures.append(rect)
            case "triangle":
                let triangle=Triangle(p1: p1, p2: point2, color: color, isFill: fillShape)
                arrayOfFigures.append(triangle)
            case "line":
                let line = Line(p1: p1, p2: point2, isFill: fillShape, color: color)
                arrayOfFigures.append(line)
            case "pen":
                let pen = Pen(pts: points, color: color, isFill: fillShape)
                points = [CGPoint]()
                arrayOfFigures.append(pen)
            default:
                break
            }
                
            
//            let triangle=Triangle(p1: p1, p2: point2, color: color, isFill: fillShape)
//            let line = Line(p1: p1, p2: point2, isFill: fillShape, color: color)
            
//            arrayOfFigures.append(line)
            
//                let pen = Pen(pts: points, color: color, isFill: fillShape)
//                pen.drawPath()
//                arrayOfFigures.append(pen)
//                points = [CGPoint]()

            
//            let circle=Circle.init(radius: abs(point2.x-p1.x),circleCentre: CGPoint(x: abs(point2.x-p1.x), y:abs( point2.y-p1.y)), color: UIColor.red,strokeWidth: 4, isFilled: true)
//            circle.drawPath()
        }
        if !arrayOfFigures.isEmpty {
            for figure in arrayOfFigures {
                figure.drawPath()
//                setNeedsDisplay()
            }
        }
//
        
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        point1=touches.first?.location(in: self)
    }
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        point2=touches.first?.location(in: self)
        reload()
    }
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if shapeType=="pen"{
            guard let touch = touches.first?.location(in: self) else{return}
            points.append(touch)
        }
    }
        
    func Pencing(_ firstPoint: CGPoint, _ secondPoint: CGPoint) {
//        let line = UIBezierPath()
//        line.move(to: firstPoint)
//        line.addLine(to: secondPoint)
//        
        
        
    }
    func reload(){
        setNeedsDisplay()
    }
    func Clear(){
        arrayOfFigures.removeAll()
//        reload()
    }
    func back(){
        arrayOfFigures.removeLast()
//        reload()
    }
    
}
