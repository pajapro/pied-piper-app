//
//  ViewController.swift
//  PiedPiper
//
//  Created by Pavel Procházka on 20/10/2016.
//  Copyright © 2016 MobileLife. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}

	@IBAction func showAlert(_ sender: AnyObject) {
		let alert = UIAlertController(title: "😂😂😂", message: "Do you really think we would open source our treasure?", preferredStyle: .alert)
		alert.addAction(UIAlertAction(title: "No", style: .cancel, handler: nil))
		self.present(alert, animated: true, completion: nil)
	}
}

