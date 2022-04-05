//
//  CardController.swift
//  DeckOfOneCard
//
//  Created by James Hager on 4/5/22.
//

import UIKit

enum CardController {
    
    static let url = URL(string: "https://deckofcardsapi.com/api/deck/new/draw/?count=1")!
    
    static func fetchCard(completion: @escaping (Result<Card, CardError>) -> Void) {
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                print("fetchCard dataTask error: \(error), \(error.localizedDescription)")
                return completion(.failure(.stdError(error)))
            }
            
            guard let data = data else { return completion(.failure(.noData))}
            
            do {
                let cardsObject = try JSONDecoder().decode(CardsObject.self, from: data)
                guard let card = cardsObject.cards.first else { return completion(.failure(.noCard))}
                return completion(.success(card))
            } catch {
                print("fetchCard decode error: \(error), \(error.localizedDescription)")
                return completion(.failure(.stdError(error)))
            }
        }.resume()
    }
    
    static func fetchImage(for card: Card, completion: @escaping (Result<UIImage, CardError>) -> Void) {
        
        URLSession.shared.dataTask(with: card.imageURL) { data, _, error in
            if let error = error {
                print("fetchImage dataTask error: \(error), \(error.localizedDescription)")
                return completion(.failure(.stdError(error)))
            }
            
            guard let data = data else { return completion(.failure(.noData))}
            
            guard let image = UIImage(data: data) else { return completion(.failure(.badImageData))}
            
            return completion(.success(image))
        }.resume()
    }
}
