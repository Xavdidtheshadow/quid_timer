//
//  Scoreboard.swift
//  QuidTimer
//
//  Created by David Brownman on 11/22/15.
//  Copyright © 2015 DB. All rights reserved.
//

enum CardColor: Int {
  case Blue
  case Yello
  case Red
}

class Card {
  var name: String
  var timestamp: Float
  var color: CardColor
  
  init(name: String, timestamp: Float , color: CardColor) {
    self.name = name
    // I believe this is a float? haven't done the timer yet
    self.timestamp = timestamp
    self.color = color
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
  
  init(teamAName: String, teamBName: String) {
    teamA = Scorecard(name: teamAName)
    teamB = Scorecard(name: teamBName)
  }
}
