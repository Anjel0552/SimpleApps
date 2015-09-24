//
//  ViewController.swift
//  StoryboardLess
//
//  Created by Anjel Villafranco on 9/24/15.
//  Copyright © 2015 Anjel Villafranco. All rights reserved.
//

import UIKit

// player turn
//scores (1,2,stalemate)
//reset scores
//reset board
// chosen space
//

class ViewController: UIViewController {
    
    var grid = [[0,0,0],[0,0,0],[0,0,0]]
    
//    grid[0][0] = grid[row][col]
    
    var isPlayer1Turn = true
    var player1Score = 0
    var player2Score = 0
    var stalemateScore = 0 

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        
        view.backgroundColor = UIColor.whiteColor()
        
//        grid[0]
        
        for (r,row) in grid.enumerate() {
            
            
        
            for (c,_) in row.enumerate() {
                
                let x = c * 110
                
                let y = r * 110
            
                
                
                
                let button = TTTButton(frame: CGRect(x: x, y: y, width: 100, height: 100))
                button.backgroundColor = UIColor.cyanColor()
                
                button.row = r
                button.col = c
                
                button.addTarget(self, action: "spacePressed:", forControlEvents: .TouchUpInside)
                view.addSubview(button)
            
            }
        
        }        
        
    
//        let button1 = TTTButton(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
//        button1.backgroundColor = UIColor.cyanColor()
//        
//        button1.tag = 0
//        
//        button1.addTarget(self, action: "spacePressed:", forControlEvents: .TouchUpInside)
//        view.addSubview(button1)
//        
//        let button2 = TTTButton(frame: CGRect(x: 0, y: 110, width: 100, height: 100))
//        button2.backgroundColor = UIColor.cyanColor()
//        
//        button2.tag = 0
//        
//        button2.addTarget(self, action: "spacePressed:", forControlEvents: .TouchUpInside)
//        view.addSubview(button2)
//        
//        let button3 = TTTButton(frame: CGRect(x: 0, y: 220, width: 100, height: 100))
//        button3.backgroundColor = UIColor.cyanColor()
//        
//        button3.tag = 0
//        
//        button3.addTarget(self, action: "spacePressed:", forControlEvents: .TouchUpInside)
//        view.addSubview(button3)
//        
//        let button4 = TTTButton(frame: CGRect(x: 110, y: 0, width: 100, height: 100))
//        button4.backgroundColor = UIColor.cyanColor()
//        
//        button4.tag = 0
//        
//        button4.addTarget(self, action: "spacePressed:", forControlEvents: .TouchUpInside)
//        view.addSubview(button4)
//        
//        let button5 = TTTButton(frame: CGRect(x: 110, y: 110, width: 100, height: 100))
//        button5.backgroundColor = UIColor.cyanColor()
//        
//        button5.tag = 0
//        
//        button5.addTarget(self, action: "spacePressed:", forControlEvents: .TouchUpInside)
//        view.addSubview(button5)
//        
//        let button6 = TTTButton(frame: CGRect(x: 110, y: 220, width: 100, height: 100))
//        button6.backgroundColor = UIColor.cyanColor()
//        
//        button6.tag = 0
//        
//        button6.addTarget(self, action: "spacePressed:", forControlEvents: .TouchUpInside)
//        view.addSubview(button6)
//        
//        let button7 = TTTButton(frame: CGRect(x: 220, y: 0, width: 100, height: 100))
//        button7.backgroundColor = UIColor.cyanColor()
//        
//        button7.tag = 0
//        
//        button7.addTarget(self, action: "spacePressed:", forControlEvents: .TouchUpInside)
//        view.addSubview(button7)
//        
//        let button8 = TTTButton(frame: CGRect(x: 220, y: 110, width: 100, height: 100))
//        button8.backgroundColor = UIColor.cyanColor()
//        
//        button8.tag = 0
//        
//        button8.addTarget(self, action: "spacePressed:", forControlEvents: .TouchUpInside)
//        view.addSubview(button8)
//        
//        let button9 = TTTButton(frame: CGRect(x: 220, y: 220, width: 100, height: 100))
//        button9.backgroundColor = UIColor.cyanColor()
//        
//        button9.tag = 0
//        
//        button9.addTarget(self, action: "spacePressed:", forControlEvents: .TouchUpInside)
//        view.addSubview(button9)
    }
    
    
    func spacePressed(button: TTTButton) {
        
        print("button works")
        
        if button.player == 0 {
            
            button.player = isPlayer1Turn ? 1 : 2
            
            grid[button.row][button.col] = isPlayer1Turn ? 1 : 2
            
            isPlayer1Turn = !isPlayer1Turn
            
            checkForWinner()
        
        
        }
    }
    
    func checkForWinner() {
        
//        r,c
        
//        row 1 0,0 0,1 0,2
//        row 2 1,0 1,1 1,2
//        row 3 2,0 2,1 2,2
//        col 1 0,0 1,0 2,0
//        col 2 0,1 1,1 2,1
//        col 3 0,2 1,2 2,2
//        dia 1 0,0 1,1 2,2
//        dia 2 2,0 1,1 0,2
        
        let possibilities = [
            
            ((0,0),(0,1),(0,2))
//            ((0,0),(0,1),(0,2)) is called a tuple
        ]
        
        for possibility in possibilities {
            
            let (p1,p2,p3) = possibility
            
            let value1 = grid[p1.0][p1.1]
            let value2 = grid[p2.0][p2.1]
            let value3 = grid[p3.0][p3.1]
            
            if value1 == value2 && value2 == value3 {
            
            
                if value1 != 0 {
                
                    // someone won
                    print("Player \(value1) Wins")
                
                }  else {
                    
                    print("all zeros")
                    
                }
            
            } else {
                
                print("does not match")
                
                
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








