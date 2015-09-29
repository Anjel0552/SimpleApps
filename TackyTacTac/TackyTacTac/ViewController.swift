//
//  ViewController.swift
//  TackyTacTac
//
//  Created by Anjel Villafranco on 9/24/15.
//  Copyright © 2015 Anjel Villafranco. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var grid = [[0,0,0],[0,0,0],[0,0,0]]
    
    
    var isPlayer1Turn = true
    var player1Score = 0
    var player2Score = 0
    var stalemateScore = 0
    
    let gameStatusLabel = UILabel(frame: CGRect(x: 0, y: 100, width: 250, height: 50))
    let gameScoreLabel = UILabel(frame: CGRect(x: 0, y: 70, width: 250, height: 70))
    let gameResetButton = UILabel(frame: CGRect(x: 0, y: 550, width: 160, height: 50))
    let scoreResetButton = UILabel(frame: CGRect(x: 180, y: 70, width: 160, height: 50))
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        view.backgroundColor = UIColor.whiteColor()
        
        
        gameResetButton.setTitle("End Game", forState: UIControlState.Normal)
        gameResetButton.backgroundColor = UIColor.magentaColor()
        view.addSubview(gameResetButton)
        gameResetButton.addTarget(self, action: "resetGame", forControlEvents: .TouchUpInside)
        
        scoreResetButton.setTitle("Reset Score", forState: UIControlState.Normal)
        scoreResetButton.addTarget(self, action: "resetScore", forControlEvents: .TouchUpInside)
        view.addSubview(scoreResetButton)
        scoreResetButton.backgroundColor = UIColor.blueColor()

        
        gameStatusLabel.text = "Player 1 Begin!"
        gameStatusLabel.textAlignment = .Center
        gameStatusLabel.center.x = view.center.x
        
        
        view.addSubview(gameStatusLabel)
        
        gameScoreLabel.text = "Score"
        gameScoreLabel.textAlignment = .Center
        gameScoreLabel.center.x = view.center.x
        
        
        view.addSubview(gameScoreLabel)
        
        
        
        
        let screenHeight = Int(UIScreen.mainScreen().bounds.height)
        let screenWidth = Int(UIScreen.mainScreen().bounds.width)
        
        let buttonHW = 120
        let buttonSpacing = 4
        
        let gridHW = (buttonHW * 3) + (buttonSpacing * 2)
        
        let leftSpacing = (screenWidth - gridHW) / 2
        
        let topSpacing = (screenHeight - gridHW) / 2
        
        for (r,row) in grid.enumerate() {
            
            for (c,_) in row.enumerate() {
                
                let x = c * (buttonHW + buttonSpacing) + leftSpacing
                
                let y = r * (buttonHW + buttonSpacing) + topSpacing
                
                
                
                
                let button = TTTButton(frame: CGRect (x: x, y: y, width: buttonHW, height: buttonHW))
                button.backgroundColor = UIColor.cyanColor()
                button.row = r
                button.col = c
                
                button.addTarget(self, action: "spacePressed:", forControlEvents: .TouchUpInside)
                
                
                view.addSubview(button)
                
                
                
                
            }
            
        }
        
    }
    
    func resetScore() {
        
        gameScoreLabel.text = "Score: P 1:\(player1Score) P 2:\(player2Score) S:\(stalemateScore)"
        player1Score = 0
        player2Score = 0
        stalemateScore = 0
    }
    
    
    func resetGame() {
        
        
        for subview in view.subviews {
            
            if let button = subview as? TTTButton {
                
                button.player = 0
                
            }
        }
    }
    
    
    func spacePressed(button: TTTButton) {
        
        
        
        if button.player == 0 {
            
            button.player = isPlayer1Turn ? 1 : 2
            
            grid[button.row][button.col] = isPlayer1Turn ? 1 : 2
            
            gameStatusLabel.text = isPlayer1Turn ? "Player 1" : "Player2"
            
            isPlayer1Turn = !isPlayer1Turn
            
            checkForWinner()
            
            view.addSubview(gameScoreLabel)
            
            
        }
        
        
    }
    
    func checkForWinner() {
        
        let possibilities = [
            
            
            
            ((0,0),(0,1),(0,2)),
            ((1,0),(1,1),(1,2)),
            ((2,0),(2,1),(2,2)),
            ((0,0),(1,0),(2,0)),
            ((0,1),(1,1),(2,1)),
            ((0,2),(1,2),(2,2)),
            ((0,0),(1,1),(2,2)),
            ((2,0),(1,1),(0,2))]
        
        
        
        for possibility in possibilities {
            
            let (p1, p2, p3) = possibility
            
            let value1 = grid[p1.0][p1.1]
            let value2 = grid[p2.0][p2.1]
            let value3 = grid[p3.0][p3.1]
            
            if value1 == value2 && value2 == value3 {
                
                
                if value1 != 0 {
                    
                    
                    
                   print("Player\(value1) Wins")
                    
                    
                    
                    
                    
                    
                } else {
                    
                    print(" all zeros")
                    
                }
                
                
            } else {
                
                print( "does not match")
                
                
            }
        }
    }
}
class TTTButton: UIButton {
    
    var row = 0
    var col = 0
    
    var player = 0   {
        
        didSet {
            
            switch player {
                
            case 1 : backgroundColor = UIColor.magentaColor()
            case 2 : backgroundColor = UIColor.yellowColor()
            default : backgroundColor = UIColor.cyanColor()
                
                
                
                
                
            }
        }
    }
}
    
    


