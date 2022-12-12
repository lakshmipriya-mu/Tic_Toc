//
//  ViewController.swift
//  Tic Toc game
//
//  Created by Lakshmi Priya on 12/5/22.
//

import UIKit

class ViewController: UIViewController {
    
    enum Turn {
    case Zero
    case Cross
    }
    
    var ZERO = "O"
    var CROSS = "X"
    var board = [UIButton]()
    var nonActiveplayer = Turn.Cross
    var activePlayer = Turn.Cross
    var zeroScore = 0
    var crossScore = 0

    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label1: UILabel!
    
    @IBOutlet weak var a1: UIButton!
    
    @IBOutlet weak var a2: UIButton!
    
    @IBOutlet weak var a3: UIButton!
    
    @IBOutlet weak var b1: UIButton!
    
    @IBOutlet weak var b2: UIButton!
    
    @IBOutlet weak var b3: UIButton!
    
    @IBOutlet weak var c1: UIButton!
    
    @IBOutlet weak var c2: UIButton!
    
    @IBOutlet weak var c3: UIButton!
    
    
    @IBAction func boardTapaction(_ sender: UIButton) {
        
        boardParameters(sender)
        
        if victory(CROSS) {
            crossScore += 1
            alert(title: "Crosses Win!")
        }
        
        if victory(ZERO) {
            zeroScore += 1
            alert(title: "Zero Win!")
        }
        
        if(fullBoard()) {
            alert(title: "Draw")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        boardValue()
        // Do any additional setup after loading the view.
    }
    
    func boardValue() {
        board.append(a1)
        board.append(a2)
        board.append(a3)
        board.append(b1)
        board.append(b2)
        board.append(b3)
        board.append(c1)
        board.append(c2)
        board.append(c3)
    }
    
    func victory(_ word :String) -> Bool {
        
        // Horizontal Victory
        if symbol(a1, word) && symbol(a2, word) && symbol(a3, word) {
            return true
        }
        
        if symbol(b1, word) && symbol(b2, word) && symbol(b3, word) {
            return true
        }
        
        if symbol(c1, word) && symbol(c2, word) && symbol(c3, word) {
            return true
        }
        
        // Vertical Victory
        if symbol(a1, word) && symbol(b1, word) && symbol(c1, word) {
            return true
        }
        
        if symbol(a2, word) && symbol(b2, word) && symbol(c2, word) {
            return true
        }
        
        if symbol(a3, word) && symbol(b3, word) && symbol(c3, word) {
            return true
        }
        
        // Diagonal Victory
        if symbol(a1, word) && symbol(b2, word) && symbol(c3, word) {
            return true
        }
        
        if symbol(a3, word) && symbol(b2, word) && symbol(c1, word) {
            return true
        }
        
        return false
    }
    
    func symbol(_ button: UIButton, _ mark: String) -> Bool{
        return button.title(for: .normal) == mark
    }
    
    
    func alert(title: String){
        let message = "\nZero " + String(zeroScore) + "\n\nCross " + String(crossScore)
        let newalert = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
        newalert.addAction(UIAlertAction(title: "Reset", style: .default, handler: { (_) in
            self.resetBoard()
        }))
        self.present(newalert, animated: true)
    }
    
    func resetBoard(){
        
        for button in board {
            button.setTitle(nil, for: .normal)
            button.isEnabled = true
        }
        
        if nonActiveplayer == Turn.Zero {
            nonActiveplayer = Turn.Cross
            label1.text = CROSS
        } else if nonActiveplayer == Turn.Cross {
            nonActiveplayer = Turn.Zero
            label1.text = ZERO
        }
        
        activePlayer = nonActiveplayer
    }
  
    
    func fullBoard() -> Bool {
        for button in board {
            if button.title(for: .normal) == nil {
                return false
            }
        }
        return true
    }
    
    
    func boardParameters(_ sender:UIButton) {
        if (sender.title(for: .normal) == nil) {
            if(activePlayer == Turn.Zero){
                sender.setTitle(ZERO, for: .normal)
                activePlayer = Turn.Cross
                label1.text = CROSS
            } else if(activePlayer == Turn.Cross){
                sender.setTitle(CROSS, for: .normal)
                activePlayer = Turn.Zero
                label1.text = ZERO
            }
            sender.isEnabled = false
        }
        
    }
    

}

