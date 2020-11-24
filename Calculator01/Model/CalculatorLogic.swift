//
//  CalculatorLogic.swift
//  Calculator01
//
//  Created by Remis on 2020-11-24.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import Foundation

struct CalculatorLogic {
    
    private var number: Double?
    private var intermediateCalculation: (n1: Double, calcMethod: String)?
    
    mutating func setNumber(_ to: Double) {
        self.number = to
    }
    
    mutating func calculate(symbol: String) -> Double? {
        
        if let n = number {
            switch symbol {
            case "+/-":
                return n * -1
            case "AC":
                return 0
            case "%":
                return n / 100
            case "=":
                return performTwoNumCalculation(n2: n)
            default:
                intermediateCalculation = (n1: n, calcMethod: symbol)
//                return n
            }
        }
        return nil
    }
    
    private func performTwoNumCalculation(n2: Double) -> Double? {
        if let n1 = intermediateCalculation?.n1,
           let operation = intermediateCalculation?.calcMethod {

                switch operation {
                case "+":
                    return n1 + n2
                case "-":
                    return n1 - n2
                case "÷":
                    return n1 / n2
                case "×":
                    return n1 * n2
                default:
                    print("DEBUG: unknown operation -> \(operation)")
                }
        }
        return nil
    }
    
}
