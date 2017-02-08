//
//  ViewController.swift
//  NWcalculator
//
//  Created by Niwat Kaewkert on 2/6/2560 BE.
//  Copyright © 2560 Niwat Kaewkert. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var firstNum = 0.0
    var secondNum = 0.0
    var operation = ""
    var checkTyping = false
    var dot = false
    var dotCheck = 0
    var firstOperation = 0
    
    @IBOutlet weak var calDisplay: UILabel!
    
    
    @IBAction func numberTapped(_ sender: UIButton) {
        var number = sender.currentTitle
        
        if checkTyping {
            calDisplay.text = calDisplay.text! + number!
        } else {
            calDisplay.text = number
            checkTyping = true
        }
    }
    
    @IBAction func btnDecimal(_ sender: UIButton) {
        if dot {
            
        } else {
            calDisplay.text = calDisplay.text! + "."
            dot = true
            dotCheck = 1
            checkTyping = true
        }
    }
    
    @IBAction func operationTapped(_ sender: UIButton) {
//        checkTyping = false
//        firstNum = Double(calDisplay.text!)!
//        operation = sender.currentTitle!
//        dot = false
        if secondNum == 0.0 && firstOperation != 0 && checkTyping {
            secondNum = Double(calDisplay.text!)!
            if dot {
                var result = 0.0
                if operation == "+" {
                    result = firstNum + secondNum
                } else if operation == "-" {
                    result = firstNum - secondNum
                } else if operation == "×" {
                    result = firstNum * secondNum
                } else if operation == "÷"  {
                    result = firstNum / secondNum
                }
                calDisplay.text = String(result)
            } else if dotCheck == 1{
                var result = 0.0
                if operation == "+" {
                    result = firstNum + secondNum
                } else if operation == "-" {
                    result = firstNum - secondNum
                } else if operation == "×" {
                    result = firstNum * secondNum
                } else if operation == "÷"  {
                    result = firstNum / secondNum
                }
                calDisplay.text = String(result)
            } else {
                var result = 0
                if operation == "+" {
                    result = Int(firstNum) + Int(secondNum)
                    calDisplay.text =  String(result)
                } else if operation == "-" {
                    result = Int(firstNum) - Int(secondNum)
                    calDisplay.text =  String(result)
                } else if operation == "×" {
                    result = Int(firstNum) * Int(secondNum)
                    calDisplay.text =  String(result)
                } else if operation == "÷" {
                    if firstNum.truncatingRemainder(dividingBy: secondNum) != 0 {
                        var result = firstNum / secondNum
                        calDisplay.text =  String(result)
                    } else {
                        var result = firstNum / secondNum
                        calDisplay.text =  String(Int(result))
                    }
                }
            }
            secondNum = 0.0
//            print("Press Operation again")
//            print(firstNum)
//            print(secondNum)
            operation = ""
        }
        
        firstNum = Double(calDisplay.text!)!
        operation = sender.currentTitle!
        firstOperation += 1
        checkTyping = false
    }
    
    @IBAction func eqaulTapped(_ sender: UIButton) {
        checkTyping = false
        secondNum = Double(calDisplay.text!)!
        if dot {
            var result = 0.0
            if operation == "+" {
                result = firstNum + secondNum
            } else if operation == "-" {
                result = firstNum - secondNum
            } else if operation == "×" {
                result = firstNum * secondNum
            } else if operation == "÷"  {
                result = firstNum / secondNum
            }
            calDisplay.text = String(result)
        } else if dotCheck == 1{
            var result = 0.0
            if operation == "+" {
                result = firstNum + secondNum
            } else if operation == "-" {
                result = firstNum - secondNum
            } else if operation == "×" {
                result = firstNum * secondNum
            } else if operation == "÷"  {
                result = firstNum / secondNum
            }
            calDisplay.text = String(result)
        } else {
            var result = 0
            if operation == "+" {
                result = Int(firstNum) + Int(secondNum)
                calDisplay.text =  String(result)
            } else if operation == "-" {
                result = Int(firstNum) - Int(secondNum)
                calDisplay.text =  String(result)
            } else if operation == "×" {
                result = Int(firstNum) * Int(secondNum)
                calDisplay.text =  String(result)
            } else if operation == "÷" {
                if firstNum.truncatingRemainder(dividingBy: secondNum) != 0 {
                    var result = firstNum / secondNum
                    calDisplay.text =  String(result)
                } else {
                    var result = firstNum / secondNum
                    calDisplay.text =  String(Int(result))
                }
            }
            
            
        }
        firstOperation = 0
        operation = ""
    }
    
    @IBAction func btnClear(_ sender: UIButton) {
        firstNum = 0
        secondNum = 0
        operation = ""
        checkTyping = false
        calDisplay.text = "0"
        dot = false
        dotCheck = 0
        firstOperation = 0
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

