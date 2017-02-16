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
    var checkError = 0
    var checkEquals = 0
    
    @IBOutlet weak var calDisplay: UILabel!
    
    
    @IBAction func numberTapped(_ sender: UIButton) {
        var number = sender.currentTitle
        checkEquals = 0
        if checkTyping {
            if calDisplay.text == "Error" {
                calDisplay.text = number!
                checkError = 0
                print("1")
            } else {
                calDisplay.text = calDisplay.text! + number!
                print("2")
            }
        } else {
            calDisplay.text = number
            checkTyping = true
            print("4")
        }
    }
    
    @IBAction func btnDecimal(_ sender: UIButton) {
//        if dot {
//            
//        } else {
//            calDisplay.text = calDisplay.text! + "."
//            dot = true
//            dotCheck = 1
//            checkTyping = true
//        }
        
        if dot {
            
        } else if checkTyping {
            calDisplay.text = calDisplay.text! + "."
            dot = true
            dotCheck = 1
            checkTyping = true
            
        } else {
            calDisplay.text = "0" + "."
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
        checkEquals = 0
        if calDisplay.text == "Error" {
            checkError = 1
            operation = sender.currentTitle!
            firstOperation += 1
            checkTyping = false
            dot = false
            firstNum = 0.0
            secondNum = 0.0
            print("er1")
        } else if checkError != 1 {
            print("er2")
            if firstOperation != 0 && checkTyping {
                secondNum = Double(calDisplay.text!)!
                
                var result = 0.0
                if operation == "+" {
                    result = firstNum + secondNum
                    calDisplay.text = String(format: "%g", result)
                } else if operation == "-" {
                    result = firstNum - secondNum
                    calDisplay.text = String(format: "%g", result)
                } else if operation == "×" {
                    result = firstNum * secondNum
                    calDisplay.text = String(format: "%g", result)
                } else if operation == "÷" {
                    if secondNum == 0 {
                        calDisplay.text = "Error"
                    } else {
                        result = firstNum / secondNum
                        calDisplay.text = String(format: "%g", result)
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
            dot = false
        } else {
            calDisplay.text = "Error"
            checkError = 1
            operation = sender.currentTitle!
            firstOperation += 1
            checkTyping = false
            dot = false
            firstNum = 0.0
            secondNum = 0.0
        }
    }
    
    @IBAction func eqaulTapped(_ sender: UIButton) {
        if checkError == 1 {
            calDisplay.text = "Error"
            firstOperation = 0
            operation = ""
            
        } else {
            
            checkTyping = false
            
            var result = 0.0
            
            if checkEquals == 0
            {
                if operation == "+" {
                    secondNum = Double(calDisplay.text!)!
                    result = firstNum + secondNum
                    calDisplay.text = String(format: "%g", result)
                } else if operation == "-" {
                    secondNum = Double(calDisplay.text!)!
                    result = firstNum - secondNum
                    calDisplay.text = String(format: "%g", result)
                } else if operation == "×" {
                    secondNum = Double(calDisplay.text!)!
                    result = firstNum * secondNum
                    calDisplay.text = String(format: "%g", result)
                } else if operation == "÷" {
                    secondNum = Double(calDisplay.text!)!
                    if secondNum == 0 {
                        calDisplay.text = "Error"
                    } else {
                        result = firstNum / secondNum
                        calDisplay.text = String(format: "%g", result)
                    }
                }
                
                checkEquals += 1
            } else {
                print("checkMoreEqauls")
                firstNum = Double(calDisplay.text!)!
                if operation == "+" {
                    print("checkMoreEqauls + ")
                    result = firstNum + secondNum
                    print(result)
                    print(firstNum)
                    print(secondNum)
                    calDisplay.text = String(format: "%g", result)
                } else if operation == "-" {
                    result = firstNum - secondNum
                    calDisplay.text = String(format: "%g", result)
                } else if operation == "×" {
                    result = firstNum * secondNum
                    calDisplay.text = String(format: "%g", result)
                } else if operation == "÷" {
                    if secondNum == 0 {
                        calDisplay.text = "Error"
                    } else {
                        result = firstNum / secondNum
                        calDisplay.text = String(format: "%g", result)
                    }
                }

            }
            
            //secondNum = 0.0
            firstOperation = 0
            dot = false 
            //operation = ""
        }
        
    }
    
    @IBAction func btnClear(_ sender: UIButton) {
        firstNum = 0
        secondNum = 0
        operation = ""
        checkEquals = 0
        checkTyping = false
        calDisplay.text = "0"
        dot = false
        dotCheck = 0
        firstOperation = 0
        checkError = 0
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
