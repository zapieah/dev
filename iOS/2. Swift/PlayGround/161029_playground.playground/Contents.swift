//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"


//Test feature
let frame = CGRect(x:0, y:0, width:200, height:50)
var startButton:UIButton = UIButton(frame: CGRect(x:0, y:0, width:250, height:50))

startButton.backgroundColor = UIColor.green

startButton.setTitle("Hello World",for:.normal)

var myView:UIView = UIView(frame: CGRect(x:0, y:0, width:320, height:568))
myView.backgroundColor = UIColor.black
startButton.center = CGPoint(x:160,y:200)
myView.addSubview(startButton)

