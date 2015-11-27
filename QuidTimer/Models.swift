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

class Card: NSObject {
  //  jersey number
  var playerNumber = ""
  var timestamp: Double = 0
  var color: CardColor?
  
  override init() {
    super.init()
  }
  
  init(playerNumber: String, timestamp: Double , color: CardColor) {
    self.playerNumber = playerNumber
    // I believe this is a float? haven't done the timer yet
    self.timestamp = timestamp
    self.color = color
    super.init()
  }
}

class Scorecard {
  var name: String
  var score = 0
  var cards = [Card]()
  
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
  var teamA: Scorecard
  var teamB: Scorecard
  var duration = 0.0
  
  init(teamAName: String, teamBName: String) {
    teamA = Scorecard(name: teamAName)
    teamB = Scorecard(name: teamBName)
  }
}
