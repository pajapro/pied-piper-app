//
//  CalculationViewModel.swift
//  PiedPiper
//
//  Created by Pavel Prochazka on 22/10/2016.
//  Copyright © 2016 MobileLife. All rights reserved.
//

import Foundation

class CalculationViewModel {
    
    enum Operator: String {
        case addition = "+"
        case subtraction = "-"
        case multiplication = "*"
        case division = "/"
    }
    
    enum ComputationError: Error { case divideByZero }
    
    /// Performs arithmetical operation on given operands.
    func perform(operation: Operator, on operandA: Double, and operandB: Double) throws -> Double {
        
        switch operation {
        case .addition:
            return operandA + operandB
        case .subtraction:
            return operandA - operandB
        case .multiplication:
            return operandA * operandB
        case .division:
            //guard operandB != 0 else { throw ComputationError.divideByZero }
            return operandA / operandB
        }
    }
}
