//
//  ViewController.swift
//  PiedPiper
//
//  Created by Pavel Procházka on 20/10/2016.
//  Copyright © 2016 MobileLife. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: Properties
    
    private var operandA: Double? {
        didSet {
            if let value = self.operandA {
                self.operandALabel.text = "\(value)"
            } else {
                self.operandALabel.text = "?"
            }
        }
    }
    
    private var operandB: Double? {
        didSet {
            if let value = self.operandB {
                self.operandBLabel.text = "\(value)"
            } else {
                self.operandBLabel.text = "?"
            }
        }
    }
    
    private var opr: CalculationViewModel.Operator? {
        didSet {
            if let value = self.opr {
                self.operatorLabel.text = "\(value.rawValue)"
            } else {
                self.operatorLabel.text = "?"
            }
        }
    }
    
    private let viewModel = CalculationViewModel()

    @IBOutlet weak var operandALabel: UILabel!
    
    @IBOutlet weak var operandBLabel: UILabel!
    
    @IBOutlet weak var operatorLabel: UILabel!
    
    @IBOutlet weak var resultLabel: UILabel!
    
    // MARK: Lifecycle
    
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
    
    // MARK: Actions

    @IBAction func generate(_ sender: AnyObject) {
        self.operandA = self.generateRandomNumber(upperBound: 100)   // range is 0 to 99
        self.operandB = self.generateRandomNumber(upperBound: 100)
        
        let operators = ["+", "-", "*", "/"]
        let randomIndex = Int(self.generateRandomNumber(upperBound: 4))
        
        if let unwrappedOperator = CalculationViewModel.Operator(rawValue: operators[randomIndex]) {
            self.opr = unwrappedOperator
        } else {
            self.opr = .addition
        }
        
        self.compute()
    }
	
    @IBAction func clear(_ sender: AnyObject) {
        self.operandA = nil
        self.operandB = nil
        self.opr = nil
        self.resultLabel.text = ""
    }
    
    // MARK: Private function
    
    private func generateRandomNumber(upperBound: Int) -> Double {
        return Double(arc4random_uniform(UInt32(upperBound)))
    }
    
    private func compute() {
        guard let a = self.operandA, let b = self.operandB, let opr = self.opr else { return }
        
        self.resultLabel.text = "Crunching the result...🤖"
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
            do {
                let result = try self.viewModel.perform(operation: opr, on: a, and: b)
                UIView.animate(withDuration: 3) {
                    self.resultLabel.text = "\(result)"
                }
                
            } catch {
                self.resultLabel.text = "Unknown"
            }
        }
    }
}

