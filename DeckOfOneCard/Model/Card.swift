//
//  Card.swift
//  DeckOfOneCard
//
//  Created by James Hager on 4/5/22.
//

import Foundation

struct Card: Decodable {
    let faceValuealue: String
    var suit: String
    let imageURL: URL
    
    enum CodingKeys: String, CodingKey {
        case faceValuealue = "value"
        case suit
        case imageURL = "image"
    }
}

struct CardsObject: Decodable {
    let cards: [Card]
}
