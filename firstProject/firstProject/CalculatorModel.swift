//
//  CalculatorModel.swift
//  firstProject
//
//  Created by  Yeskendir Ayat on 30.01.2021.
//

import Foundation

enum Operation {
    //    case constant(Double)
    case unaryOperation((Double)->Double)
    case binaryOperation((Double,Double)->Double)
    case equals
}
//func add(_ a: Double,_ b:Double) -> Double {
//    return a+b
//}
struct CalculatorModel {
    private var anyProcentOperation:Bool=false
    private var solution: Double?
    private var saving : SaveFirstOperandAndOperation?
    var operations:Dictionary<String,Operation> = [
        "+/-":Operation.unaryOperation({$0 * -1}),
        "%":Operation.unaryOperation({$0/100}),
        "AC":Operation.unaryOperation({$0*0}),
        "=":Operation.equals,
        "+":Operation.binaryOperation({$0+$1}),// Type inference
        "-":Operation.binaryOperation({$0-$1}),
        "/":Operation.binaryOperation({$0/$1}),
        "*":Operation.binaryOperation({$0*$1})
    ]
    mutating func setOperand(_ operand:Double){
        solution=operand
    }
    mutating func performOperation(_ operation:String){
        switch operations[operation]! {
        
        case .unaryOperation(let function):
            solution=function(solution!)
        case .binaryOperation(let function):
            anyProcentOperation=false
            saving=SaveFirstOperandAndOperation(firstOperand: solution!, operation: function)//храним старое число и функцию в структуре SaveFirstOperandAndOperation
            
        case .equals:
            solution=saving?.performOperationWith(secondOperand:solution!)
        }
    }
    var res: String{
        get{
            if solution==0 {
                return "0"
            }
//            if  solution!%1==0{
            if solution!.truncatingRemainder(dividingBy: 1) == 0{
                return(String(Int(solution!)))
            }
            return String(round(100000000*(solution!))/100000000)
        }
    }
    struct SaveFirstOperandAndOperation {
        var firstOperand: Double
        var operation:(Double,Double)->Double
        func performOperationWith(secondOperand op2:Double)->Double{
            return operation(firstOperand,op2)
        }
    }
}
