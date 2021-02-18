//
//  ViewController.swift
//  PaintLast
//
//  Created by  Yeskendir Ayat on 18.02.2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var CustomView: Custom!
    @IBOutlet weak var FillCheck: UISwitch!
    @IBOutlet weak var backButton: UIButton!
    var colors:[UIColor]=[.black,.blue,.green,.yellow,.red]
    
    @IBAction func SelectForm(_ sender: UIButton) {
        CustomView.shapeType=sender.currentTitle!
        print(sender.currentTitle!)
    }
    @IBAction func SelectColor(_ sender: UIButton) {
        CustomView.color=colors[Int(sender.currentTitle!)!]
//        print(colors[Int(sender.currentTitle!)!])
    }
    @IBAction func changeFill(_ sender: UISwitch) {
        if (FillCheck.isOn) {
            CustomView.fillShape=true
        }
        else{
            CustomView.fillShape=false
        }
//        print("changeFill",FillCheck.isOn)
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        CustomView.mainVC = self
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(ViewController.Tap))
        let longGesture = UILongPressGestureRecognizer(target: self, action: #selector(ViewController.Long))
        backButton.addGestureRecognizer(tapGesture)
        backButton.addGestureRecognizer(longGesture)
    }
    
    @objc func Tap() {
//        if !CustomView.arrayOfFigures.isEmpty{
//            CustomView.setNeedsDisplay()
//            CustomView.back()
            CustomView.arrayOfFigures.removeLast()
//            CustomView.reload()
            CustomView.setNeedsDisplay()
            print("just pushed")
//        }
    }
    
    @objc func Long(){
//        if !CustomView.arrayOfFigures.isEmpty{
            CustomView.Clear()
            
//            CustomView.reload()
            CustomView.setNeedsDisplay()
            print("Long pressed")
//        }
    }
    
}
