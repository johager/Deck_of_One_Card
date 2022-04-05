//
//  String+.swift
//  DeckOfOneCard
//
//  Created by James Hager on 4/5/22.
//
//  Based on https://www.hackingwithswift.com/example-code/strings/how-to-capitalize-the-first-letter-of-a-string
//

import Foundation

extension String {
    
    func capitalizingFirstLetter() -> String {
        let lowercasedString = self.lowercased()
        return lowercasedString.prefix(1).capitalized + lowercasedString.dropFirst()
    }
}
