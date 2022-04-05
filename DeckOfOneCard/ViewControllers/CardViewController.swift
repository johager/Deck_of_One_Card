//
//  CardViewController.swift
//  DeckOfOneCard
//
//  Created by James Hager on 4/5/22.
//

import UIKit

class CardViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak var cardInfoLabel: UILabel!
    @IBOutlet weak var cardImageView: UIImageView!
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cardInfoLabel.text = ""
    }
    
    // MARK: - View Methods
    
    func fetchImageAndUpdateViews(for card: Card) {
        CardController.fetchImage(for: card) { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let image):
                    self?.cardInfoLabel.text = "\(card.faceValuealue) of \(card.suit.capitalizingFirstLetter())"
                    self?.cardImageView.image = image
                case .failure(let error):
                    self?.presentAlert(for: error)
                }
            }
        }
    }

    // MARK: - Actions
    
    @IBAction func drawCardButtonTapped(_ sender: UIButton) {
        CardController.fetchCard { [weak self] result in
            switch result {
            case .success(let card):
                self?.fetchImageAndUpdateViews(for: card)
            case .failure(let error):
                DispatchQueue.main.async {
                    self?.presentAlert(for: error)
                }
            }
        }
    }
}
