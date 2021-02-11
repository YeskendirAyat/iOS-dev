//
//  ViewController.swift
//  firstProject
//
//  Created by  Yeskendir Ayat on 29.01.2021.
//

import UIKit

class ViewController: UIViewController {
    //fields
    var calculator=CalculatorModel()
    var isStart=false
    @IBOutlet weak var mainLine: UILabel! // controller to view
    
    @IBAction func digidPressed(_ sender: UIButton) {
        //try use defoulting for "."
        if isStart {
            if (sender.currentTitle?.isEqual("."))! && !check(){
                return
            }
            else if (sender.currentTitle?.isEqual("."))! && check(){
                mainLine.text?.append(sender.currentTitle!)
                return
            }
            mainLine.text?.append(sender.currentTitle!) //? chained
        }
        else{
            mainLine.text="0"
            if (sender.currentTitle?.isEqual("."))!{
                mainLine.text?.append(sender.currentTitle!)
            }
            else{
                mainLine.text=sender.currentTitle
            }
            if mainLine.text=="0" {
                return
            }
            isStart=true
        }
    }
    var mainLineValue: String{
        get{return mainLine.text!}
        set{mainLine.text=newValue}
    }
    func check()->Bool{
        var cnt:Int=0
        for i in mainLine.text!{
            if i=="." {cnt+=1}
        }
        return cnt<1
    }
    @IBAction func operationPressed(_ sender: UIButton) {
        calculator.setOperand(Double(mainLineValue)!)
        calculator.performOperation(sender.currentTitle!)
        //        mainLineValue=calculator.getResult()
        mainLineValue=calculator.res
        isStart=false
    }
    override func viewDidLoad() { //Cycle as current time screen
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}
