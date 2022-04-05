//
//  CardError.swift
//  DeckOfOneCard
//
//  Created by James Hager on 4/5/22.
//

import Foundation

enum CardError: LocalizedError {
    case stdError(Error)
    case noData
    case noCard
    case badImageData
    
    var errorDescription: String? {
        switch self {
        case .stdError(let error):
            return error.localizedDescription
        case .noData:
            return "The server did not return data."
        case .noCard:
            return "The server did not return a card."
        case .badImageData:
            return "The server did not return an image."
        }
    }
}
