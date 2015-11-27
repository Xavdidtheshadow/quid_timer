//
//  ViewController.swift
//  QuidTimer
//
//  Created by David Brownman on 11/22/15.
//  Copyright © 2015 DB. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  @IBOutlet weak var teamAScore: UILabel!
  @IBOutlet weak var teamBScore: UILabel!

  @IBOutlet weak var teamAName: UILabel!
  @IBOutlet weak var teamBName: UILabel!
  
  @IBOutlet weak var timerLabel: UILabel!
  
  var timer = NSTimer()
  
//  var game: Scoreboard?
  var game = Scoreboard(teamAName: "A", teamBName: "B")
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  }

  // all team A stuff is odd tagged, all team B even
  @IBAction func changeScore(sender: UIButton) {
    let up = sender.titleLabel!.text == "+"
    
    if sender.tag % 2 == 1 {
      game.teamA.adjustScore(up)
    } else {
      game.teamB.adjustScore(up)
    }
    updateLabels()
  }
  
  func updateLabels() {
    teamAScore.text = String(game.teamA.score)
    teamBScore.text = String(game.teamB.score)
  }
  
  func resetGame() {
    teamAScore.text = "0"
    teamBScore.text = "0"
  }
  
}

