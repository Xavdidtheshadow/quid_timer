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
  
  // this could be an optional if we reset the game somehow
  //  var game = Scoreboard(teamAName: "A", teamBName: "B")
  var dataModel: DataModel!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  }
  
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    let navigationController = segue.destinationViewController as! UINavigationController
    let controller = navigationController.topViewController as! CardDetailViewController
    controller.delegate = self
    
    if segue.identifier == "EditCard" {
      controller.teams = [teamAName.text!, teamBName.text!]
    }
  }

  // all team A stuff is odd tagged, all team B even
  @IBAction func changeScore(sender: UIButton) {
    let up = sender.titleLabel!.text == "+"
    let team = sender.tag % 2
    dataModel.game.teams[team].adjustScore(up)
    updateLabels()
  }
  
  func updateLabels() {
    teamAScore.text = String(dataModel.game.teams[0].score)
    teamBScore.text = String(dataModel.game.teams[1].score)
  }
}

extension ViewController: CardDetailViewControllerDelegate {
  func canceled(controller: CardDetailViewController) {
    dismissViewControllerAnimated(true, completion: nil)
  }
  
  func cardDetailViewController(controller: CardDetailViewController, didFinishCreatingItem card: Card) {
    dataModel.game.teams[card.team].cards.append(card)
  }
  
  func cardDetailViewController(controller: CardDetailViewController, didFinishEditingItem card: Card) {
    let index = dataModel.game.teams[card.team].cards.indexOf({$0.id == card.id})
    dataModel.game.teams[card.team].cards[index!] = card
  }
}


