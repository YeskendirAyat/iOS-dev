import UIKit

var str = "Hello, playground"
var a=2

class Calc {
    var a=0,b=0
    func getSum(a par1: Int,b par2: Int)->Int{
        return par1+par2
    }
    func elements(Dict d:Array<Int>)->Int{
        return d[0]
    }
    static func elements1(Dict d:Array<Int>)->Int{
        return d[0]
    }
}
var calcTest1=Calc()
calcTest1.getSum(a: 10, b: 2)
var array1=[1,2,3,4,5]
calcTest1.elements(Dict: array1)
Calc.elements1(Dict: array1)


var txt="100"
if txt=="0" {
    print("equal to zero")
}
var c:Double=0
print(round(c))

print(round(1000000*(6.9/3))/1000000)

var check=2.0
//print(check%1)
print(floor(check))
if check.truncatingRemainder(dividingBy: 1) == 0{
    print("is Int")
}
if floor(check)==check{
    print("Yes")
}else{
    print("no")
}
 
