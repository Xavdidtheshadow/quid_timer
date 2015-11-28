//
//  CardDetailViewController.swift
//  QuidTimer
//
//  Created by David Brownman on 11/26/15.
//  Copyright © 2015 DB. All rights reserved.
//

import UIKit

protocol CardDetailViewControllerDelegate: class {
  func canceled(controller: CardDetailViewController)
  func cardDetailViewController(controller: CardDetailViewController, didFinishCreatingItem card: Card)
  func cardDetailViewController(controller: CardDetailViewController, didFinishEditingItem card: Card)
}

class CardDetailViewController: UIViewController {
  
  @IBOutlet weak var playerNumber: UITextField!
  @IBOutlet weak var severitySelector: UISegmentedControl!
  @IBOutlet weak var teamSelector: UISegmentedControl!
  
  var cardToEdit: Card?

  // this shouldn't be blank, but isn't initialized with a time
  var timestamp: Double?
  weak var delegate: CardDetailViewControllerDelegate?
  var teams = [String]()
  
  @IBAction func done() {
    // validate first!
    
    if let card = cardToEdit {
      delegate?.cardDetailViewController(self, didFinishEditingItem: configureCard(card))
    } else {
      delegate?.cardDetailViewController(self, didFinishCreatingItem: configureCard(Card()))
    }
  }
  
  func configureCard(card: Card) -> Card {
    card.playerNumber = playerNumber.text!
    card.timestamp = timestamp!
    card.color = colorForSeverity()
    card.team = teamSelector.selectedSegmentIndex
    return card
  }
  
  @IBAction func cancel() {
    dismissKeyboard()
    delegate?.canceled(self)
  }
  
  override func viewWillAppear(animated: Bool) {
    setColors()
  }
  
  func setColors() {
    // .subviews returns backwards
    let views = severitySelector.subviews
    for (index, view) in views.enumerate() {
      view.tintColor = CardColor(rawValue: 2 - index)?.color()
    }
  }
  
  func colorForSeverity() -> CardColor {
    return CardColor(rawValue: severitySelector.selectedSegmentIndex)!
  }
  
  func dismissKeyboard() {
    // Causes the view (or one of its embedded text fields) to resign the first responder status.
    view.endEditing(true)
  }
}