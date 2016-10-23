//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"


//variables
//Integer
var myInt:Int = 10
var score:Int = 20

score
score = 0
score += 1
score -= 2
score += 6
score *= 2
score /= 5
score += myInt
score /= 5

//Doubles

var myDoubles:Double = 10.2

myDoubles += 1.1
myDoubles -= 3.2
myDoubles *= 2

//String

var myString:String = "Hello"
myString
var playerName:String = "Jun"
var greetPlayer:String = "\(myString) \(playerName), your score is \(score)"

//Bools

var myBool:Bool = false
var shouldYouSubscribe = true

//Tuples

var myTuple:(Int,Int) = (10, 5)
var myPoint:(x:Int, y:Int) = (17, 82)
myPoint.x
myPoint.y

//var vs let
var myVarInt:Int = 10
let myLetInt:Int = 15
myVarInt += 1

//type conversion
var theInt:Int = 10
var theDouble:Double = 5.2

theInt + Int(theDouble)
Double(theInt) + theDouble



//if statement

var lives = 3

lives -= 1
lives -= 1
lives -= 1

if lives == 0 {
    "game over!"}


var sco = 5

if sco == 10 {
    "winner!"
}

if sco != 10 {
    "loser!"
}

if sco < 5{
    "Ouch, that's a low score!"
}

if sco > 7 {
    "Mice try!"
}

if sco >= 9{
    "Wow!"
}

if sco <= 5{
    "Low score!"
}

sco = 0

if score > 4 && sco < 7{
    "Keep tryinh!"
}


if sco == 10 || sco == 0{
    "Wow!"
}

if sco > 7{
    "Great score!"
}
else {
    "Unlucky, try again!"
}


var bonusRoundScore = 4

if bonusRoundScore == 4 {
    bonusRoundScore *= 2
}
if bonusRoundScore == 8{
    bonusRoundScore -= 2
}
else if bonusRoundScore == 12{
    bonusRoundScore -= 4
}

bonusRoundScore

var highScore = 5

switch highScore {
case 0: "Really? 0"
case 1: "Ouch"
case 2: "That's awful!"
case 3: "That's bad!"
case 4: "Hmm"
case 5: "Average"
case 6: "Getting there!"
case 7: "yeah!"
case 8: "Woo!"
case 9: "nailed it!"
case 10: "Champion!"
default: "Did you cheat?"
}




func sayHello(){
    "Hello!"
}

sayHello()
sayHello()
sayHello()
sayHello()
sayHello()

func sayHelloToUser(name:String) {
    "Hello \(name)"
}

sayHelloToUser(name: "jun")

sayHelloToUser(name: "kim")



func convertKMToMiles(km:Double) -> Double{
    let miles = km * 0.621371
    return miles
}


let fiveKKMInMiles = convertKMToMiles(km: 5.0)


var myInteger:Int = 10

func exampleFunction() {
    var myInteger:Int = 10
    myInteger = 0
    myInteger += 1
    
}

myInteger += 1


//Optional

let firstName:String = "John"
//let middleName:String = "William"
let middleName:String? = "William"
let lastName:String = "Smith"

let fullName:String = "\(firstName) \(middleName) \(lastName)"
let fullName2:String = "\(firstName) \(middleName!) \(lastName)"

let person2FirstName:String = "Sted"
let person2MiddleName:String? = nil
let person2LastName:String = "Jone"

//error
//let person2FullName:String = "\(person2FirstName) \(person2MiddleName!) \(person2LastName)"

//way 1
if person2MiddleName != nil {
    let person2FullName:String = "\(person2FirstName) \(person2MiddleName!) \(person2LastName)"
    print(person2FullName)
}
else {
    let person2FullName:String = "\(person2FirstName) nil \(person2LastName)"
}

//way 2
if let middleName2 = person2MiddleName {
    let person2FullName:String = "\(person2FirstName) \(middleName2) \(person2LastName)"
}
else {
    let person2FullName:String = "\(person2FirstName) \(person2LastName)"
}



//part 5 

