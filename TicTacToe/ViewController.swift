//
//  ViewController.swift
//  TicTacToe
//
//  Created by David Kooistra on 5/17/17.
//  Copyright © 2017 David. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var activeGame = true
    
    
    var board: [[Int]] = [[0, 0, 0],
                          [0, 0, 0],
                          [0, 0, 0]]
    
    var turn = 1
    
    @IBOutlet weak var winnerLabel: UILabel!
    @IBOutlet weak var playAgainLabel: UIButton!
    
    
    @IBAction func playAgainButton(_ sender: Any) {
        activeGame = true
        
        
        board = [[0, 0, 0],
                [0, 0, 0],
                [0, 0, 0]]
        
        turn = 1
        
        winnerLabel.isHidden = true
        playAgainLabel.isHidden = true
        
        winnerLabel.center = CGPoint(x: winnerLabel.center.x - 500, y: winnerLabel.center.y)
        playAgainLabel.center = CGPoint(x: playAgainLabel.center.x - 500, y: playAgainLabel.center.y)
        
        for i in 1..<10 {
            
            if let button = view.viewWithTag(i) as? UIButton {
                button.setImage(nil, for: [])
                button.isEnabled = true
            }
        }
    }
    
    
    
    
    func check_board(board:[[Int]]) -> Int{
        //check rows
        for i in 0...2 {
            if board[i][0] == board[i][1] && board[i][1] == board[i][2] {
                if board[i][0] != 0 {
                    return board[i][0]
                }
            }
        }
        
        //check cols
        for i in 0...2 {
            if board[0][i] == board[1][i] && board[1][i] == board[2][i] {
                if board[0][i] != 0 {
                    return board[0][i]
                }
            }
        }
        
        //check diagnols
        
        if board[0][0] == board[1][1] && board[1][1] == board[2][2] {
            if board[0][0] != 0 {
                return board[0][0]
            }
        }
        
        
        if board[2][0] == board[1][1] && board[1][1] == board[0][2] {
            if board[2][0] != 0 {
                return board[2][0]
            }
        }
        
        //check for full board
        var isFull = true
        for i in 0...2 {
            for j in 0...2 {
                if board[i][j] == 0 {
                    isFull = false
                }
            }
        }
        if isFull {
            return 3
        }
        
        return 0
    }


    
    
    @IBAction func button(_ sender: Any) {
        if activeGame {
        print((sender as AnyObject).tag)
        switch (sender as AnyObject).tag {
        case 1:
            board[0][0] = turn
            break
        case 2:
            board[0][1] = turn
            break
        case 3:
            board[0][2] = turn
            break
        case 4:
            board[1][0] = turn
            break
        case 5:
            board[1][1] = turn
            break
        case 6:
            board[1][2] = turn
            break
        case 7:
            board[2][0] = turn
            break
        case 8:
            board[2][1] = turn
            break
        case 9:
            board[2][2] = turn
            break
        default:
            print("This is impossible")
            break
        }
        
        let tmpButton = self.view.viewWithTag((sender as AnyObject).tag) as? UIButton
        
        //tmpButton?.setTitle(String(turn), for: [])
        
        tmpButton?.adjustsImageWhenDisabled = false
        tmpButton?.isEnabled = false
        
        
        
        //change turns
        if turn == 1 {
            (sender as AnyObject).setImage(UIImage(named: "nought.png"), for:[])
            turn = 2
        }
        else{
            (sender as AnyObject).setImage(UIImage(named: "cross.png"), for:[])
            turn = 1
        }
            
        
        for i in 0...2 {
            print(board[i])
        }
        
        let checkBoard = check_board(board: board)
        
        if checkBoard == 1 {
            activeGame = false
            winnerLabel.text = "Noughts have won"
        }
        else if (checkBoard == 2){
            activeGame = false
            winnerLabel.text = "Crosses have won"
        }
        else if (checkBoard == 3) {
            //Tie game
            activeGame = false
            winnerLabel.text = "Tie game"
        }
        if !activeGame {
            winnerLabel.isHidden = false
            playAgainLabel.isHidden = false
            UIView.animate(withDuration: 1, animations: {
                self.winnerLabel.center = CGPoint(x: self.winnerLabel.center.x + 500, y: self.winnerLabel.center.y)
                self.playAgainLabel.center = CGPoint(x: self.playAgainLabel.center.x + 500, y: self.playAgainLabel.center.y)
            })
                
        }
            
            
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        winnerLabel.isHidden = true
        playAgainLabel.isHidden = true
        
        winnerLabel.center = CGPoint(x: winnerLabel.center.x - 500, y: winnerLabel.center.y)
        playAgainLabel.center = CGPoint(x: playAgainLabel.center.x - 500, y: playAgainLabel.center.y)
        
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

