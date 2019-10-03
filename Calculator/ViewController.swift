//
//  ViewController.swift
//  Calculator
//
//  Created by Mohammad Salamat on 2019-09-28.
//  Copyright © 2019 Mohammad Salamat. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var operandLabel: UILabel!
    @IBOutlet weak var operatorLabel: UILabel!
    
    @IBOutlet weak var result: UILabel!
    
    // so we can't spam 0 at the beginning (cause 00001 = 1, sure, but 00001 doesn't make sense)
    var zeroFlagStopper = true
    
    var operator__ = ""
    var operator_ = ""
    var operand = ""
    var operand2 = ""

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        let title = "A great calculator app by Mohammad Salamat"
        let message = "Homer means equals, Bart means 5, Broom means clear everything. Works gre-e-e-at on all phones AND orientations!"
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let action = UIAlertAction(title: "LETS GO!", style: .cancel, handler: nil)
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        result.text = "0"
        operandLabel.text = "0"
        operatorLabel.text = ""
    }
    
    @IBAction func zeroPressed(_ sender: UIButton) {
        if zeroFlagStopper {
            result.text = "0"
        } else if result.text == "0" {
            result.text = "0"
        } else {
            result.text! += "0"
        }
    }
    
    @IBAction func onePressed(_ sender: UIButton) {
        if zeroFlagStopper {
            result.text = "1"
            zeroFlagStopper = false
        } else {
            result.text! += "1"
        }
    }
    
    @IBAction func twoPressed(_ sender: UIButton) {
        if zeroFlagStopper {
            result.text = "2"
            zeroFlagStopper = false
        } else {
            result.text! += "2"
        }
    }
    
    @IBAction func threePressed(_ sender: UIButton) {
        if zeroFlagStopper {
            result.text = "3"
            zeroFlagStopper = false
        } else {
            result.text! += "3"
        }
    }
    
    @IBAction func fourPressed(_ sender: UIButton) {
        if zeroFlagStopper {
            result.text = "4"
            zeroFlagStopper = false
        } else {
            result.text! += "4"
        }
    }
    
    @IBAction func fivePressed(_ sender: UIButton) {
        if zeroFlagStopper {
            result.text = "5"
            zeroFlagStopper = false
        } else {
            result.text! += "5"
        }
    }
    
    @IBAction func sixPressed(_ sender: UIButton) {
        if zeroFlagStopper {
            result.text = "6"
            zeroFlagStopper = false
        } else {
            result.text! += "6"
        }
    }
    
    @IBAction func sevenPressed(_ sender: UIButton) {
        if zeroFlagStopper {
            result.text = "7"
            zeroFlagStopper = false
        } else {
            result.text! += "7"
        }
    }
    
    @IBAction func eightPressed(_ sender: UIButton) {
        if zeroFlagStopper {
            result.text = "8"
            zeroFlagStopper = false
        } else {
            result.text! += "8"
        }
    }
    
    @IBAction func ninePressed(_ sender: UIButton) {
        if zeroFlagStopper {
            result.text = "9"
            zeroFlagStopper = false
        } else {
            result.text! += "9"
        }
    }
    
    @IBAction func operationPress(_ sender: UIButton) {
        switch sender.tag {
        case 10:
            operator_ = "+"
        case 11:
            operator_ = "-"
        case 12:
            operator_ = "/"
        case 13:
            operator_ = "*"
        default:
            print("oh sheeet")
        }
        
        if(operand == ""){
            operand = result.text!
        } else {
            operand2 = result.text!
        }
        
        result.text! = ""
        
        if operand != "" && operand2 != ""{ // do math cause operands full
            let expression = operand + operator__ + operand2
            let expr = NSExpression(format: expression)
            let something = expr.expressionValue(with: nil, context: nil) as! Int
            
            // update stuffs
            operandLabel.text = String(something)
            operand = operandLabel.text!
            operand2 = ""
            result.text! = ""
        }
        
        operator__ = operator_
        
        if operator__ == "*" {
            operatorLabel.text = "x"
        } else {
            operatorLabel.text = operator__
        }
    }
    
    @IBAction func equalsPressed(_ sender: UIButton) {
        if operator_ == "" {
            return
        }
    
        operand2 = result.text!
        
        if operand != "" && operand2 != ""{ // do math cause operands full
            print("im here")
            let expression = operand + operator__ + operand2
            let expr = NSExpression(format: expression)
            let something = expr.expressionValue(with: nil, context: nil) as! Int64
            
            /* update stuffs */
            operandLabel.text = String(something)
            operand = operandLabel.text!
            operand2 = ""
            result.text! = ""
        }
        
        operator__ = operator_
        
        if operator__ == "*" {
            operatorLabel.text = "x"
        } else {
            operatorLabel.text = operator__
        }
    }
    
    @IBAction func clearButton(_ sender: UIButton) {
        operand = ""
        operand2 = ""
        operator_ = ""
        operator__ = ""
        operatorLabel.text = ""
        result.text = "0"
        operandLabel.text = "0"
        zeroFlagStopper = true
    }
}

