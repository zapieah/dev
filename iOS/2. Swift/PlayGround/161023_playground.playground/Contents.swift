//: Playground - noun: a place where people can play
// YouTube - Matt Heaney Apps - iOS turtorial
import UIKit

var str = "Hello, playground"

//////////////////////
//Part 01. Variables//
//////////////////////

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


/////////////////////////
//Part 02. if-statement//
/////////////////////////
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

//////////////////////
//Part 03. Functions//
//////////////////////

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

//////////////////////
//Part 04. Optional //
//////////////////////
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


////////////////////
//Part 05. Arrays //
////////////////////
var players:[String] = ["Matt", "Brad", "Jay", "Emma"]

players[3]
let player1 = players[0]
let player2 = players[1]

players.first
players.last

players.count

var id1:Int
var id2:Int

id1 = players.index(of: "Matt")!
id2 = players.index(of: "Brad")!

var id3:Int = players.index(of: "Jay")!

if players.count >= 5{
    "Game On!"
}
else {
    "Need More Players!"
}
players.append("Roonie")
players.count
players.insert("Laura", at: 1)
players.count
players.remove(at: 2)
players
players.removeFirst()
players.removeLast()
players

players[0] = "Matt"
players

players = ["Matt", "Brad", "Jay", "Emma", "Laura"]

players.sort()
players.contains("Jay")
players.contains("Reece")
 
//////////////////
//Part 06. Sets //
//////////////////
var player: Set<String> = ["Matt", "Emma", "Jay", "Will"]
player.insert("Ronnie")
//player.insert(1)
player
player.count
player.insert("Will")
player.remove("Matt")

player.count
player.contains("Emma")
player.contains("Reece")
player.contains("Will")
player.index(of: "Will")
//////////////////////////////////////////////////////
var mySet1:Set<Int> = [0,1,2,3]
var mySet2:Set<Int> = [0,2,4,6]

let unionSet:Set<Int> = mySet1.union(mySet2)
unionSet

let intersectionSet:Set<Int> = mySet1.intersection(mySet2)
intersectionSet

let subtractSet:Set<Int> = mySet1.subtracting(mySet2)
subtractSet

//////////////////////////
//Part 07. Dictionaries //
//////////////////////////
//var scores:[Int] = [10, 14, 5, 3]
var scores:[String:Int] = ["Matt":10, "Jay":13, "Emma":15, "Will":5]
//scores[0]
scores["Matt"]
scores["Emma"]
scores["Joe"]
scores.count
scores.updateValue(18, forKey: "Will")
scores
scores.updateValue(22, forKey: "Ian")
scores
scores["Reece"] = 19
scores
scores.removeValue(forKey: "Matt")
scores

//////////////////
//Part 08. Loops//
//////////////////

var myNumber:Int = 0

for i in 1...100{
    myNumber += i
    print(myNumber)
}


var Players:[String] = ["Matt", "Emma", "Jay", "Will"]

for p in Players{
    print("This player is \(p)")
}

var Scores:[String:Int] = ["Matt":10, "Emma":15, "Jay":18]
Scores["Matt"]

for s in Scores.values {
    print("The score is \(s)")
}

for (p, s) in Scores{
    print("\(p)'s score is \(s)")
}


var exampleNumber:Int = 10

while exampleNumber > 0 {
    print("I am running, and example number is set to \(exampleNumber)")
    exampleNumber -= 1
}

var anotherExampleNumber:Int = 10
repeat {
    print("the repeat while loop is running, and number is set to \(anotherExampleNumber)")
    anotherExampleNumber -= 1
} while anotherExampleNumber > 0





