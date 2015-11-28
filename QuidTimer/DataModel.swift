//
//  DataModel.swift
//  QuidTimer
//
//  Created by David Brownman on 11/28/15.
//  Copyright © 2015 DB. All rights reserved.
//

import Foundation

class DataModel {
  var game = Scoreboard()
  
  init() {
    loadChecklists()
    registerDefaults()
  }
  
  func registerDefaults() {
    let dictionary = [ "cardId": 0 ]
    
    NSUserDefaults.standardUserDefaults().registerDefaults(dictionary)
  }
  
  func documentsDirectory() -> String {
    let paths = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)
    return paths[0]
  }
  
  func dataFilePath() -> String {
    return (documentsDirectory() as NSString).stringByAppendingPathComponent("Scoreboard.plist")
  }
  
  func saveChecklists() {
    let data = NSMutableData()
    let archiver = NSKeyedArchiver(forWritingWithMutableData: data)
    archiver.encodeObject(game, forKey: "Scoreboard")
    archiver.finishEncoding()
    data.writeToFile(dataFilePath(), atomically: true)
  }
  
  func loadChecklists() {
    let path = dataFilePath()
    if NSFileManager.defaultManager().fileExistsAtPath(path) {
      if let data = NSData(contentsOfFile: path) {
        let unarchiver = NSKeyedUnarchiver(forReadingWithData: data)
        game = unarchiver.decodeObjectForKey("Scoreboard") as! Scoreboard
        unarchiver.finishDecoding()
      }
    }
  }
  
  func newGame() {
    game = Scoreboard()
  }
  
  class func nextItemId() -> Int {
    let userDefaults = NSUserDefaults.standardUserDefaults()
    let itemID = userDefaults.integerForKey("ScoreboardID")
    userDefaults.setInteger(itemID + 1, forKey: "ScoreboardID")
    userDefaults.synchronize()
    return itemID
  }
}