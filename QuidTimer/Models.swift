//
//  Scoreboard.swift
//  QuidTimer
//
//  Created by David Brownman on 11/22/15.
//  Copyright © 2015 DB. All rights reserved.
//

import UIKit

enum CardColor: Int {
  case Blue, Yellow, Red
  
  // enums correspond to UIColors
  func color() -> UIColor {
    switch(self) {
      case .Blue:
        return .blueColor()
      case .Yellow:
        // this is hard to make look good
        // current hex: #FFB900
        return UIColor(red:1.00, green:0.73, blue:0.00, alpha:1.0)
      case .Red:
        return .redColor()
    }
  }
}

class Card {
  //  jersey number
  var playerNumber = ""
  var timestamp: Double = 0
  var color: CardColor?
  // this should eventually only go in the non aCoder init
  var id = DataModel.nextItemId()
  var team = 0
  
  init(){}
  
  init(playerNumber: String, timestamp: Double , color: CardColor, team: Int) {
    self.playerNumber = playerNumber
    // I believe this is a float? haven't done the timer yet
    self.timestamp = timestamp
    self.color = color
    self.team = team
  }
}

class Scorecard {
  var name = ""
  var score = 0
  var cards = [Card]()
  
  init(){}
  
  init(name: String) {
    self.name = name
  }
  
  func adjustScore(up: Bool = true) {
    if up {
      score += 10
    } else if score > 0 {
      score -= 10
    }
  }
}

// MARK: Main Data Model
class Scoreboard {
  var teams = [Scorecard]()
  var duration = 0.0
  
  init() {
    
  }
  
  init(teamAName: String, teamBName: String) {
    teams.append(Scorecard(name: teamAName))
    teams.append(Scorecard(name: teamBName))
  }
}
