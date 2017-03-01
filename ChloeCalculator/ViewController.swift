//
//  ViewController.swift
//  ChloeCalculator
//
//  Created by Chloe Lee on 2016. 9. 17..
//  Copyright © 2016년 Chloe Lee. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var firstRow: UILabel!
    @IBOutlet var secondRow: UILabel!
    @IBOutlet var thirdRow: UILabel!
    
    @IBOutlet var acBtn: UIButton!
    @IBOutlet var pntiveBtn: UIButton!
    @IBOutlet var percentageBtn: UIButton!
    @IBOutlet var divideBtn: UIButton!
    @IBOutlet var multipleBtn: UIButton!
    @IBOutlet var plusBtn: UIButton!
    @IBOutlet var minusBtn: UIButton!
    
    @IBOutlet var oneBtn: UIButton!
    @IBOutlet var twoBtn: UIButton!
    @IBOutlet var threeBtn: UIButton!
    @IBOutlet var fourBtn: UIButton!
    @IBOutlet var fiveBtn: UIButton!
    @IBOutlet var sixBtn: UIButton!
    @IBOutlet var sevenBtn: UIButton!
    @IBOutlet var eightBtn: UIButton!
    @IBOutlet var nineBtn: UIButton!
    @IBOutlet var zeroBtn: UIButton!
    
    @IBOutlet var decimalBtn: UIButton!
    @IBOutlet var exeBtn: UIButton!
    @IBOutlet var ansBtn: UIButton!

    var firstNum:Double?
    var secondNum:Double?
    var tempNum:String?
    var operatorNum:String?
    var answerNum:Double?
    var lastNum:Double?
    var lastOpt:String?
    
    var firstRowNum:String = ""
    var secondRowNum:String = ""
    var thridRowNum:String = ""
    
    @IBAction func acBtnClicked(sender: AnyObject) {
        print("ac button clicked")
        if tempNum != nil {
            tempNum = nil
            thirdRow.text = ""
        } else {
            firstNum = nil
            secondNum = nil
            answerNum = nil
            operatorNum = nil
            lastNum = nil
            lastOpt = nil
            acBtn.setTitle("AC", for: .normal)
            firstRow.text = ""
            secondRow.text = ""
            thirdRow.text = "0"
        }
    }
    @IBAction func pntiveBtnClicked(sender: AnyObject) {
        print("pn button clicked")
        if let tempAnswer = answerNum {
            if let temp = tempNum { //answer o , temp o
                print("answer o , temp o")
                tempNum = String(Double(temp)! * -1)
                print(tempNum)
                if tempNum == "-0.0" {
                    tempNum = "-0"
                    thirdRow.text = tempNum
                } else {
                    toWholeNumber(result: Double(tempNum!)!,row: 3)
                    //firstRow.text = ""
//                    secondRow.text = ""
                }
            } else { //answer o, temp x
                print("answer o , temp x")
                tempNum = String(tempAnswer * -1)
                toWholeNumber(result: Double(tempNum!)!, row:3)
                firstRow.text = ""
                secondRow.text = ""
            }
        } else {
            if let temp = tempNum {
                print("answer x , temp o")
                tempNum = String(Double(temp)! * -1)
                print(tempNum)
                if tempNum == "-0.0" {
                    tempNum = "-0"
                    thirdRow.text = tempNum
                } else {
                    toWholeNumber(result: Double(tempNum!)!, row:3)
                }
            } else {
                print("answer x , temp x")
                tempNum = "-0"
                print(" turn 0 to -0")
                print(tempNum)
                thirdRow.text = tempNum
            }
        }
    }

    @IBAction func percentageBtnClicked(sender: AnyObject) {
        print("% button clicked")
        if var temp = tempNum {
            temp = String(Double(temp)! / 100)
            tempNum = temp
            toWholeNumber(result: Double(temp)!, row:3)
        } else if var tempAns = answerNum {
            //toWholeNumber(result: tempAns, row: 1)
            //secondRow.text = "%"
            tempAns = tempAns / 100
            answerNum = tempAns
            toWholeNumber(result: tempAns, row:3)
        }
    }
    
    @IBAction func divideBtnClicked(sender: AnyObject) {
        print("/ button clicked")
        operateEquation(optr: "÷")
    }
    @IBAction func multipleBtnClicked(sender: AnyObject) {
        print("x button clicked")
        operateEquation(optr: "x")
    }
    @IBAction func plusBtnClicked(sender: AnyObject) {
        print("+ button clicked")
        operateEquation(optr: "+")
    }
    @IBAction func minusBtnClicked(sender: AnyObject) {
        print("minus button clicked")
        operateEquation(optr: "-")
    }
    @IBAction func exeBtnClicked(sender: AnyObject) {
        print("exe button clicked")
        operateEquation(optr: "=")
    }
    @IBAction func oneBtnClicked(sender: AnyObject){
        print("one clicked")
        tempNumBuilder(strNum: "1")
    }
    @IBAction func twoBtnClicked(sender: AnyObject) {
        print("2 button clicked")
        tempNumBuilder(strNum: "2")
    }
    @IBAction func threeBtnClicked(sender: AnyObject) {
        print("3 button clicked")
        tempNumBuilder(strNum: "3")
    }
    @IBAction func fourBtnClicked(sender: AnyObject) {
        print("4 button clicked")
        tempNumBuilder(strNum: "4")
    }
    @IBAction func fiveBtnClicked(sender: AnyObject) {
        print("5 button clicked")
        tempNumBuilder(strNum: "5")
    }
    @IBAction func sixBtnClicked(sender: AnyObject) {
        print("6 button clicked")
        tempNumBuilder(strNum: "6")
    }
    @IBAction func sevenBtnClicked(sender: AnyObject) {
        print("7 button clicked")
        tempNumBuilder(strNum: "7")
    }
    @IBAction func eightBtnClicked(sender: AnyObject) {
        print("8 button clicked")
        tempNumBuilder(strNum: "8")
    }
    @IBAction func nineBtnClicked(sender: AnyObject) {
        print("9 button clicked")
        tempNumBuilder(strNum: "9")
    }
    @IBAction func zeroBtnClicked(sender: AnyObject) {
        print("0 button clicked")
        tempNumBuilder(strNum: "0")
    }
    @IBAction func decimalBtnClicked(sender: AnyObject) {
        print(". button clicked")
        tempNumBuilder(strNum: ".")
    }
    @IBAction func ansBtnClicked(sender: AnyObject) {
        print("ans button clicked")
        if let tempAnswer = answerNum {
            tempNum = String(tempAnswer)
            toWholeNumber(result: tempAnswer, row:3)
            if firstNum == nil {
               firstRow.text = ""
                secondRow.text = ""
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func tempNumBuilder(strNum:String) {
        if let tempString = tempNum { //not empty
            if tempString == "0" {
                tempNum = strNum
            } else if tempString == "-0" {
                tempNum = String(Int(strNum)! * -1)
            } else {
                tempNum = tempString + strNum
            }
        } else { //empty
            if strNum == "." {
                tempNum = "0."
            } else {
                tempNum = strNum
            }
        }
        print(tempNum)
        thirdRow.text = tempNum
        thridRowNum = tempNum!
        acBtn.setTitle("C", for: .normal)
        if firstNum == nil {
            firstRow.text = ""
            secondRow.text = ""
        }
    }
    
    func execute(fst:Double, scd:Double, opt:String) -> Double { //print result
        var result:Double = 0
        if opt == "+" {
            result = fst + scd
        } else if opt == "-" {
            result = fst - scd
        } else if opt == "x" {
            result = fst * scd
        } else if opt == "÷" {
            result = fst / scd
        }
        firstNum = result
        secondNum = nil
        toWholeNumber2(result: result, op:"=", row:3)
        return result
    }
    
    func operateEquation(optr:String){
        if let unwrapNum = tempNum { //unwrap tempNum String
            if firstNum == nil { //check if firstNum contains a value
                if optr == "=" {
                    answerNum = Double(unwrapNum)
                    toWholeNumber2(result: answerNum!, op: "=", row: 3)
                    operatorNum = nil
                    lastNum = nil
                } else {
                    firstNum = Double(unwrapNum)
                    operatorNum = optr
                    toWholeNumber(result: firstNum!, row: 1)
                    secondRow.text = optr
                    secondRowNum = optr
                    thirdRow.text = ""
                }
            } else if secondNum == nil {
                secondNum = Double(unwrapNum)
                lastNum = secondNum
                answerNum = execute(fst: firstNum!, scd: secondNum!, opt: operatorNum!)
                if optr == "=" {
                    firstNum = nil
                    secondNum = nil
                   // secondRow.text = secondRowNum + " " + unwrapNum
                    toWholeNumber2(result: Double(unwrapNum)!, op: operatorNum!, row:2)
                    print("= button clicked")
                } else {
                    print(answerNum)
                    toWholeNumber(result: answerNum!, row: 1)
                    operatorNum = optr
                    secondRow.text = optr
                    thirdRow.text = ""
                }
            }
            tempNum = nil
        } else if let tempAns = answerNum, let tempOpt = operatorNum {
            if optr == "=" { //if the user press = again, execute the last operation eg. +3
                if let tempLast = lastNum {
                    answerNum = execute(fst: tempAns,scd: tempLast, opt: tempOpt)
                    toWholeNumber(result: tempAns, row: 1)
                    toWholeNumber2(result: lastNum!, op: tempOpt, row:2)
                    firstNum = nil
                    print("first "+String(describing:firstNum))
                } else {
                    operatorNum = nil
                    answerNum = tempAns
                    print("hmmm")
                }
            } else { //if the user wants to start another equation using the answer.Pressed +, -, x or ÷
                 print("firstdddd "+String(describing:firstNum))
                if firstNum == nil {
                    firstNum = answerNum
                    operatorNum = optr
                    //firstRow.text = String(describing: tempAns)
                    toWholeNumber(result:tempAns, row:1)
                    secondRow.text = optr
                    thirdRow.text = ""
                } else { //if the user selected another operator
                    operatorNum = optr
                    secondRow.text = optr
                }
            }
            tempNum = nil
        } else {
            if optr != "=" {
                if answerNum != nil , firstNum == nil {
                    operatorNum = optr
                    secondRowNum = optr
                    secondRow.text = operatorNum
                    firstNum = answerNum
                    toWholeNumber(result: firstNum!, row: 1)
                    thirdRow.text = ""
                }
            }
            print(String(describing: answerNum))
        }
    }
    
    
    func toWholeNumber(result:Double, row:Int) {
        if (result - Double(Int(result))) != 0 {
            if row == 1 {
                firstRow.text = String(result)
            } else if row == 2 {
                secondRow.text = String(result)
            } else if row == 3 {
                thirdRow.text = String(result)
            }
        } else {
            //tempNum = String(Int(result))
            if row == 1 {
                firstRow.text = String(Int(result))
            } else if row == 2 {
                secondRow.text = String(Int(result))
            } else if row == 3 {
                thirdRow.text = String(Int(result))
            }
        }
    }
    
    func toWholeNumber2(result:Double, op:String, row:Int) {
        if (result - Double(Int(result))) != 0 {
            if row == 2 {
                secondRow.text = op + " " + String(result)
            } else if row == 3 {
                thirdRow.text = op + " " + String(result)
            }
        } else {
            //tempNum = String(Int(result))
            if row == 2 {
                secondRow.text = op + " " + String(Int(result))
            } else if row == 3 {
                thirdRow.text = op + " " + String(Int(result))
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

