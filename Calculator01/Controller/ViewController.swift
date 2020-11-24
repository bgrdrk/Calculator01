//
//  ViewController.swift
//  Calculator Layout iOS13
//
//  Created by Remigijus Klimovas with a help from Angela Yu on 2020.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: - Properties
    
    private var isFinishedTypingNumber = true
    
    private var displayValue: Double {
        // computed property. it is computed {here below} everytime we refer to it in a code
        get {
            guard let number = Double(displayLabel.text!) else {
                fatalError("Cannot convert display label text to a Double")
            }
            return number
        }
        
        // can use 'newValue' which is the actual new value set to 'displayValue'
        set {
            displayLabel.text = String(newValue)
        }
    }

    private var calculator = CalculatorLogic()
    
    //MARK: - Outlets and Actions
    
    @IBOutlet weak var displayLabel: UILabel!
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        
        isFinishedTypingNumber = true
        if let calcMethod = sender.currentTitle {
            calculator.setNumber(displayValue)
            if let result = calculator.calculate(symbol: calcMethod) {
                // 'displayValue' gets new value and runs the code in it's 'set' block above (in properties)
                displayValue = result
            }
        }
    }
    
    @IBAction func digitButtonPressed(_ sender: UIButton) {
    
        if let numValue = sender.currentTitle {
            if isFinishedTypingNumber {
                displayLabel.text = numValue
                isFinishedTypingNumber = false
            } else {
                if displayLabel.text!.contains(".") && sender.currentTitle == "." {
                    print("DEBUG: jau per daug tasku...")
                } else {
                    displayLabel.text?.append(numValue)
                }
            }
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

