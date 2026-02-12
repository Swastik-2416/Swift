//
//  ViewController.swift
//  exercise
//
//  Created by GU on 29/08/25.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var myBtn: UIButton!
    var lightOn=true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        // Do any additional setup after loading the view.
        
    }
    fileprivate func updateUI() {
        if lightOn {
            view.backgroundColor = .white
        } else {
            view.backgroundColor = .black
        }
    }

    @IBAction func btnTapped(_ sender: Any) {
        lightOn.toggle()
        updateUI()
    }
    
}

