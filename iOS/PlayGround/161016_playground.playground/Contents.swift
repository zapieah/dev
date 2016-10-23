//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"



//Day 1
var a = 10
let b = 20

//a++ is not supported in swift3
a += 1
//let cant use ++ operator and cant change value
//b++
//b += 1

var name = "bogon"
// name is inited to String
// so cant change int
//name = 10

var d = 4.0
d = 1

var i = 1
// cant change type
//i = 3.0
i = Int.init(3.0)

var s:String = "3"

i = Int.init(s)!

var s1:String?

if s1 != nil {
    i = Int.init(s1!)!
}

s1 = "5"

if s1 != nil {
    i = Int.init(s1!)!
}

s1 = "hello"

//if s1 != nil {
//    i = Int.init(s1!)!
//}

    /*
    override func viewDidLoad() {
        super.viewDidLoad()
        var value = "hello"
        //value is not change, so it define let better than var
        label.text = self.value
    }
    */


let pi = 3.14
//pi is let, so cant change value
//pi = 3.14159

var pi2 = 3.14
pi2 = 3.14159


let piValue = 3.14
let printpiValue = "piValue is \(piValue)"
print("piValue = \(piValue)")
print(printpiValue)

let apple = 3
let google = 4
let appleStr = "apple\(apple)"
let googleStr = "google\(google)"
let applegoogleStr = "applegoogme\(apple+google)"






//Day 2


let names = ["Kim", "Jun", "Hel"]
let Kim = names[0]
let nameCount = names.count
let arrayCapacity = names.capacity
// name is let
//names.append("Choi")


var names2 = ["Kim", "Jun", "Hel"]
var Kim2 = names2[0]
var nameCount2 = names2.count
var arrayCapacity2 = names2.capacity

names2.append("Choi")
nameCount2 = names2.count
arrayCapacity2 = names2.capacity

var nums = [1,2,3,4,5]
print(nums)
nums.append(100)
print(nums)
nums[3] = 200
print(nums)
nums.sort()
print(nums)

let numA = [1,2,3]
var numB = numA
var numC = numA
var numD = numB

numB[2] = 100
print(numA)
print(numB)
print(numC)
print(numD)

let nn = [1,2]

let ds = [10.2, 0]

let xx = 1, yy = 2
let xxyyy = [xx,yy]

let xy1:[Double] = [Double.init(xx), Double.init(yy)]
let xy2:[Double] = [1.3, 2.4]
// cant change Type in this case
//let xy3:[Double] = [xx, yy]

let what = ["swift", 2.0] as [Any]

what[0]
what[1]


var Name:[String] = []

Name.append("kim")
Name
//var what = []
//what.append("hello")

var ages = ["kim":10, "jun":20]
ages["kim"]
ages



var z = [1,2,3,4]

if z.contains(2) {
    print("2 is member")
}
else {
    print("2 is not member")
}

if z.contains(10) {
    print("10 is member")
}
else {
    print("10 is not member")
}


var customDic = ["kim":10, "jun":20]

let dicV1 = customDic["kim"]
print(dicV1)
let dicV2 = customDic["jj"]
print(dicV2)
let dicV3 = customDic["jun"]!
print(dicV3)

let Ages = [13,23,34,45]
var dollars = 0;
for Age in Ages {
    if Age > 20 {
        dollars += 10
    }
    else {
        dollars += 5
    }
}
print("Total dollars = \(dollars)")


let nameAge = ["KIM": 20, "JUN":30, "CHOI":40]

print(nameAge["KIM"])


for nage in nameAge {
    if nameAge["CC"] != nil {
        print("hello \(nameAge["CC"]!)")
    }
}


let t1_ages = ["Kelly":13, "MAC":18, "John":34, "Kim":29]
var t1_dollar = 0
var t1_names = ["Kelly", "Grace", "Kim"]

for t1_name in t1_names {
    let t1_age = t1_ages[t1_name]
    if t1_age != nil {
        if t1_age! > 19 {
            t1_dollar += 20
        }
        else {
            t1_dollar += 15
        }
    }
    else {
        t1_dollar += 20
    }
}
print("Total cost : \(t1_dollar)")

t1_dollar = 0

for t1_name in t1_names {
    if let t1_age = t1_ages[t1_name] {
        if t1_age > 19 {
            t1_dollar += 20
        }
        else {
            t1_dollar += 15
        }
    }
    else {
        t1_dollar += 20
    }
}
print("Total cost2 : \(t1_dollar)")


var shoppingList = ["catfish", "water", "tulips", "blue paint"]
shoppingList[1] = "bottle of water"
print (shoppingList)
var occupations = ["Malcolm": "Captain", "Kaylee": "Mechanic"]
print(occupations)
occupations["HEL"] = "HELLO"
print(occupations)

occupations["Jayne"] = "PublicRelations"


let integerToDescribe = 5

var description = "The number \(integerToDescribe)"

switch integerToDescribe {
case 2, 3, 5, 7, 13, 17, 19:
    description += " a prime number, and also"
    fallthrough
default:
    description += " an integer."
}
print(description)

let puzzleInput = "hi a elulu ok pipuq"
var puzzleOutput = ""
for character in puzzleInput.characters {
    switch character {
    case "a", "i", "u", " ", "p", "q", "k":
        continue
    default:
        puzzleOutput.append(character)
    }
}

print(puzzleOutput)


var ch = "c"
print(ch)

switch ch {
case "a":
    print("a")
case "c":
    print("c")
default:
    print("default")
}

var vv:Int = 10
switch vv {
case 10:
    print("10")
case 20:
    print("20")
default:
    print("default")
}



let count:Int = 1000
var prefix:String
switch count {
case 0:
    prefix = "no"
case 1...3:
    prefix = "a few"
case 4...9:
    prefix = "several"
case 10...99:
    prefix = "tens of"
case 100..<1000:
    prefix = "hundreds of"
case 1000..<10000:
    prefix = "thousands of"
case 10000..<100000:
    prefix = "no"
default:
    prefix = "so many"
}

var sum = 0
for num in 1...10 {
    sum+=num
}

func greet(name:String, day:String) -> String {
    return "Hello \(name), today is \(day)"
}

let gr1 = greet(name: "Dave", day: "Monday")
let gr2 = greet(name: "Kelly", day: "Tuesday")

func average(numbers: Int...) -> Double {
    var sum = 0
    for num in numbers {
        sum += num
    }
    return Double.init(sum) / Double.init(numbers.count)
}

let avg1 = average(numbers: 10, 20, 30, 50)
let avg2 = average(numbers: 1,2,3,4,5,6,10)



//tuple
let pair = (12, 13.0)
pair
pair.0
pair.1

let point = (x:10, y:15)
point
point.x
point.y
point.0
point.1
point


func sum_average(numbers: Int...) -> (sum:Int, avg:Double) {
    var sum = 0
    for num in numbers {
        sum += num
    }
    let avg = Double(sum) / Double(numbers.count)
    return (sum:sum, avg:avg)
}

let sa1 = sum_average(numbers: 10,20,30)
let sa2 = sum_average(numbers: 1,2,3,4,5,6,7,8,9)
sa1.avg
sa1.sum
sa1.0
sa1.1
sa2.avg
sa2.sum
sa2.0
sa2.1


// nested func
func calculate(numbers:Int...) -> (sum:Int, avg:Double) {
    var sum = 0
    
    func increaseSumIfNumber(num:Int, devider:Int) {
        if (num % devider) == 0 {
            sum += 1
        }
    }
    
    for num in numbers {
        sum += num
        increaseSumIfNumber(num: num, devider: 2)
        increaseSumIfNumber(num: num, devider: 5)
    }
    let avg = Double(sum) / Double(numbers.count)
    return (sum:sum, avg:avg)
}

let sas1 = calculate(numbers: 10,20,30,40)
let sas2 = calculate(numbers: 1,2,3,4,5,6,7)


//arg = func
func points(num:Int, bonus:(Int)->Bool) -> Int {
    var pt = num * 10
    if bonus(num) {
        pt += 1
    }
    return pt
}


func odd(num:Int) -> Bool {
    return (num % 2) != 0
}

func negative(num:Int) -> Bool {
    return num < 0
}

points(num: 5, bonus: odd)
points(num: 6, bonus: odd)
points(num: 7, bonus: negative)
points(num: -1, bonus: negative)


//return func
func incrementor(num:Int) -> ((Void) -> Int) {
    var value = 0
    
    func increase() -> Int {
        value += num
        return value
        
    }
    return increase
}

let inc3 = incrementor(num: 3)
inc3()
inc3()

let inc7 = incrementor(num: 7)
inc7()
inc7()
inc3()


//closure
points(num: 5, bonus: {
    (num:Int)->Bool in
    return (num % 2) != 0
})

let negat = {
    (num:Int)->Bool in
    return num < 0
}

points(num: -1, bonus: negat)

let positive = {
    $0 > 0
}

let mod3 = points(num: 9, bonus: {
    ($0%3)==0
})
mod3
let mod7 = points(num: 9) { ($0 % 7) == 0 }
mod7




func test() -> Void {
    var numbers = [1,12,32,2,4,43,3]
    numbers.sort { (n1:Int, n2:Int) -> Bool in
        return n1 < n2
    }
    numbers
    numbers.sorted{ $0 < $1}
    numbers
    numbers.sort(by: >)
    numbers
    numbers.sort(by: <)
    numbers
    numbers.sort { (n1:Int, n2:Int) -> Bool in
        return n1 > n2
    }
    numbers
}

test()





