//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

print(str);

print(str+"\n");

let Constats  = 10
var Variables = 20
var x = 0.0 , y = 0.0 , z = 2.0
let string = "Happy ori"

print(string)

print(Constats)

print(Variables)

print(x)

print(y)

print(z)

var testString:String

testString = "Hello World"

print(testString)


let ConstantA = "Hello"

let ConstantB = 1

let ConstantC = 2.0

let ConstantD:String = "Hello World"

let ConstantE:Double = Double(ConstantB) + ConstantC

let http404Error = (404, "Not Found")
// http404Error is of type (Int, String), and equals (404, "Not Found")
let http200Status = (statusCode: 200, description: "OK")

let (statusCode, statusMessage) = http404Error
print("The status code is \(statusCode)")


// prints "The status code is 404"
print("The status message is \(statusMessage)")
// prints "The status message is Not Found"

let integerArray = (1,2,3,4,5)
let (a,b,c,d,e) = integerArray
print("a = \(a), b =  \(b), c = \(c), d = \(d), e = \(e)")

print("a = \(integerArray.0), b =  \(integerArray.1), c = \(integerArray.2), d = \(integerArray.3), e = \(integerArray.4)")

var surveyAnswer: String?

print(surveyAnswer)

var serverResponseCode : Int? = 404

if serverResponseCode != nil {
    print("convertedNumber has an integer value of \(serverResponseCode!).")
}

print("?? = \(serverResponseCode)")

//severResponseCode contains an actual Int value of 404

serverResponseCode = nil

//serverResponseCode now contains no value

print("?? = \(serverResponseCode)")

if serverResponseCode != nil {
    print("convertedNumber has an integer value of \(serverResponseCode!).")
}

if serverResponseCode == nil {
    print("convertedNumber has an integer value of nil.")
}


var shoppingList:[String] = ["Eggs","Milk"]

var shoppingList2 = ["coffee","water"]

print("\(shoppingList)")

print("\(shoppingList[0])")

print("\(shoppingList[1])")

shoppingList.append("Water")

print("\(shoppingList[2])")

shoppingList += (["Bread", "Soap"])

print("\(shoppingList[3])")

print("\(shoppingList[4])")


//item 개수 확인

print("The shopping list contains \(shoppingList.count) item.")

//배열이 비었는지 확인

if shoppingList.isEmpty {
    
    print("The shopping list is empty.")
    
} else {
    
    print("The shopping list is not empty.")
    
}

//배열 마지막에 추가

shoppingList.append("Flour")

shoppingList += ["Baking Powder"]

shoppingList += ["Chocolate Spread", "Cheese", "Butter"]

print("Start loop")
for item in shoppingList {
    print(item)
}

//for (index, value) in Enumerate(shoppingList) {
//    
//    print("Item \(index + 1): \(value)")
//    
//}
print("End loop")

//배열로 부터 값 찾기

var firstItem = shoppingList[0]


//배열에 값 넣기

shoppingList[0] = "six eggs"

// 법위를 지정해서 값을 넣을 수도 있습니다. 바꾸려는 범위가 실제 범위와 달라도 됩니다.

//4번 - 6번 index 의 값이  4,5번에 banans , apples 로 바뀝니다.


print(shoppingList[0])
shoppingList.remove(at: 0)
print(shoppingList[0])
shoppingList.remove(at: 0)
print(shoppingList[0])
shoppingList.remove(at: 0)
print(shoppingList[0])


shoppingList[4...6] = ["Bananas", "Apples"]


//특정 index 값 지우기 그리고 그 값 return

let mapleSyrup = shoppingList.remove(at: 0)

print(shoppingList[0])


//마지막 값 지우기 그리고 그 값 return

let apple = shoppingList.removeLast()

var someInts = [Int]()

someInts.append(0)
someInts.append(10)

for item in someInts {
    print("item = \(item)")
}



// full form
var airports: Dictionary<String, String>
    = ["YYZ":"Toronto Pearson", "DUB":"Dublin"]

// short form

var number: [Int:String] = [1 : "one", 2: "two" ]

// shorter from

var city = ["seoul":02 , "daegu":053 ]


//개수 확인

print("The airports dictionary contains \(airports.count) items")

// 비었는지 확인

if airports.isEmpty {
    
    print(" The airports dictinary is empty")
    
}


// 추가

airports["LHR"] = "London"

// 수정

airports["LHR"] = "London Heathrow"

// 수정 : 메소드를 사용

// return 값은 밸류 타입에 해당하는 Optinal 값

if let oldValue = airports.updateValue("Dublin Airport", forKey: "DUB") {
    
    print("The old value for DUB was \(oldValue).")
    
}

// 삭제

airports["YYZ"] = nil

print(airports["YYZ"])

if (airports["YYZ"] == nil) {
    print("airport YYZ is nil")
}

// 삭제 : 메소드 사용

// return 값은 삭제된 값

if let removedValue = airports.removeValue(forKey: "DUB") {
    print("The removed airport's name is \(removedValue)")
}


var namesOfInteagers = [Int : String]()

namesOfInteagers[16] = "sixteen"

namesOfInteagers = [:]

func HappyOri(myName : String) -> String {
    let greeting = "Happy" + myName
    print("greeting = \(greeting)")
    return greeting
}

func minMax(array: [Int]) -> (min: Int, max: Int) {
    
    var currentMin = array[0]
    var currentMax = array[0]
    for value in array[1..<array.count] {
        if value < currentMin {
            currentMin = value
        } else if value > currentMax {
            currentMax = value
        }
    }
    return (currentMin, currentMax)
}

let bounds = minMax(array: [8, -6, 2, 109, 3, 71])

print("min is \(bounds.min) and max is \(bounds.max)")

// prints "min is -6 and max is 109"


// 내부 파라미터 이름

func join(s1: String, s2: String, joiner: String) -> String {
    
    return s1 + joiner + s2
    
}

// 외부 파라미터 이름

func join(string s1: String, toString s2: String, withJoiner joiner: String)
    
    -> String {
        
        return s1 + joiner + s2
        
}

//단축 외부 파라미터 이름

//func join2(#string:String, #toString:String, #withJoiner:String) -> String {
//    
//    return string + withJoiner + toString
//    
//}

func plus(num : Int = 0 , num2 : Int = 0 ) -> Int {
    
    return num + num2
    
}


var plus_a = plus(num: 2, num2: 2)

//return is 4
print("plus_a = \(plus_a)")

var plus_b = plus()
print("plus_b = \(plus_b)")


//return is 0


func arithmeticMean(numbers: Double...) -> Double {
    
    var total: Double = 0
    
    for number in numbers {
        
        total += number
        
    }
    
    return total / Double(numbers.count)
    
}

var ari_a = arithmeticMean(numbers: 1, 2, 3, 4, 5)
print("ari_a = \(ari_a)")
// returns 3.0, which is the arithmetic mean of these five numbers

var ari_b = arithmeticMean(numbers: 3, 8.25, 18.75)
print("ari_b = \(ari_b)")

// returns 10.0, which is the arithmetic mean of these three numbers



func alignRight(str:String, count:Int, pad:Character) -> String {
    var string = str
    let amountToPad:Int = count // - Int(String.(string))// - countElements(string)
    if amountToPad < 1 {
        return string
    }
    let padString = String(pad)
    for _ in 1...amountToPad {
        string = padString + string
    }
    return string
}
let originalString:String = "hello"

let paddedString = alignRight(str:originalString, count: 10, pad: "-")
// paddedString is equal to "-----hello"
// originalString is still equal to "hello"
print(originalString)
print(paddedString)



func swapTwoInts(swapa:inout Int, swapb:inout Int) {
    let temporaryA = swapa
    swapa = swapb
    swapb = temporaryA
}





let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]

func backwards(s1: String, s2: String) -> Bool {
    return s1 > s2
}

//var reversed = sorted(names, backwards) // reversed is equal to ["Ewa", "Daniella", "Chris", "Barry", "Alex"]
//
//
//reversed = sorted(names, { (s1: String, s2: String) -> Bool in return s1 > s2 } )
//
//
//
//enum CompassPoint {   case North   case South   case East   case West }
//
//enum Planet {   case Mercury, Venus, Earth, Mars, Jupiter, Saturn, Uranus, Neptune }
//
//
//
//directionToHead = .South
//switch directionToHead {
//case .North:
//    println("Lots of planets have a north")
//case .South:
//    println("Watch out for penguins")
//case .East:
//    println("Where the sun rises")
//case .West:
//    println("Where the skies are blue")
//}
// prints "Watch out for penguins"



func findStockCode(company:String)->String? {
    if company == "Apple" {
        return "AAPL"
    }
    else if company == "Google" {
        return "GOOG"
    }
    else if (company == "Facebook") {
        return nil
    }
    return nil
}


var stockCode:String? = findStockCode(company: "Facebook")
let text = "Stock Code -"
if stockCode != nil {
    let message = text + stockCode!
    print(message)
}

stockCode = findStockCode(company: "Google")
if let tempStockCode = stockCode {
    let message = text + tempStockCode
    print(message)
}


let LogD = {
    print("LogD : ")
}

//var logString:String? = "String"
//print(logString)
//if LogD != nil {
//    let logX = LogD + logString
//}










