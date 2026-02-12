//
//  ViewController.swift
//  Assesment1
//
//  Created by GU on 02/09/25.
//

import UIKit

class ViewController: UIViewController {
    var playerChoice: Int = 0
    var computerChoice: Int = 0
    
    @IBOutlet weak var dispayMsg: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func playRound(playerChoice: Int) {
        computerChoice = Int.random(in: 0...2)
        var result = ""
        
        if playerChoice == computerChoice {
            result = "Draw"
        } else if (playerChoice == 0 && computerChoice == 2) ||
                    (playerChoice == 1 && computerChoice == 0) ||
                    (playerChoice == 2 && computerChoice == 1) {
            result = "Player Wins 🎉"
        } else {
            result = "Computer Wins 🤖"
        }
        
        print(result)
        dispayMsg.text = "You: \(choiceName(playerChoice)), Computer: \(choiceName(computerChoice)) → \(result)" 
    }
    
    func choiceName(_ choice: Int) -> String {
        switch choice {
        case 0: return "Rock"
        case 1: return "Paper"
        case 2: return "Scissors"
        default: return "Please Select"
        }
    }
    
    
    
    @IBAction func rockBtnTapped(_ sender: Any) {
        playRound(playerChoice: 0)
    }
    
    @IBAction func paperBtnTapped(_ sender: Any) {
        playRound(playerChoice: 1)
    }
    
    @IBAction func scissorsBtnTapped(_ sender: Any) {
        playRound(playerChoice: 2)
    }
}
    
    


