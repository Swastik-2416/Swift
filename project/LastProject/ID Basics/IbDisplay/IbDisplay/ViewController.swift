//
//  ViewController.swift
//  IbDisplay
//
//  Created by GU on 29/08/25.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var displayMsg: UITextField!
    
    @IBOutlet weak var buttonTap: UIButton!
    
    
    @IBOutlet weak var myText: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        myText.text = " "
        
    }

    @IBAction func myButtonTapped(_ sender: Any) {
        let name = displayMsg.text ?? "Enter your name"
        if name.isEmpty {
            myText.text = "Please enter your name"
        } else {
            myText.text = "Hello, \(name)! welcome!"
        }
        
    }
    
}

