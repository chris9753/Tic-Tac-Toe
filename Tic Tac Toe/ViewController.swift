//
//  ViewController.swift
//  Tic Tac Toe
//
//  Created by Christopher Da Silva on 2015-01-05.
//  Copyright (c) 2015 Christopher Da Silva. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
var winner = 0
    var gameState : [Int] = [0,0,0,0,0,0,0,0,0]
    var goNumber = 1
    let winningComb = [[0,3,6],[1,4,7],[2,5,8],[0,1,2],[3,4,5],[6,7,8],[6,4,2],[0,4,8]]
    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var playUI: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    
    @IBAction func playAgain(sender: AnyObject) {
        winner = 0
        gameState = [0,0,0,0,0,0,0,0,0]
        goNumber = 1
        label.center = CGPointMake(label.center.x - 400, label.center.y)
        label.alpha = 0
        playUI.alpha = 0
        var button : UIButton
        for var i = 0 ; i < 9; i++ {
            button = view.viewWithTag(i) as UIButton
            button.setImage(nil, forState: .Normal)
        }
        
    }
    @IBAction func buttonPressed(sender: AnyObject) {
       
        
        if(gameState[sender.tag] == 0 && winner == 0) {
             var image = UIImage();
            if(goNumber%2==0){
                
                gameState[sender.tag] = 2
        image = UIImage(named: "painted-x.png")!
        
            } else {
                gameState[sender.tag] = 1
        image = UIImage(named: "letter-o-md.png")!
            }
            
         
            
            for comb in winningComb {
                if (gameState[comb[0]] == gameState[comb[1]] && gameState[comb[1]] == gameState[comb[2]] && gameState[comb[0]] != 0 ) {
                    winner = gameState[comb[0]]
                }
                
            }
            if winner != 0 {
                if(winner%2 == 0){
                     label.text=("X has won")
                }else {
                    label.text=("O has won")
                }
                UIView.animateWithDuration(0.4, animations: {
                    self.label.center = CGPointMake(self.label.center.x + 400, self.label.center.y)
                    self.label.alpha = 0.6
                    self.playUI.alpha = 1
                })
            } else if (contains(gameState, 0) == false ) {
                label.text = "Tie"
                label.alpha = 1
                UIView.animateWithDuration(0.4, animations: {
                    self.label.center = CGPointMake(self.label.center.x+400, self.label.center.y)
                    self.playUI.alpha = 1
                })
            }
            sender.setImage(image, forState: .Normal)
            goNumber++
        }
       
        
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(animated: Bool) {
        label.center = CGPointMake(label.center.x - 400, label.center.y)
        label.alpha = 0
        playUI.alpha = 0
    
    }

}


