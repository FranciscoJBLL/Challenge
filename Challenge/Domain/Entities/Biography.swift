//
//  Biography.swift
//  Challenge
//
//  Created by Everis on 26/08/21.
//

import Foundation

// MARK: - Biography
struct Biography: Codable {
    let fullName, alterEgos: String
    let aliases: [String]
    let placeOfBirth, firstAppearance, publisher: String
    let alignment: Alignment
}

enum Alignment: String, Codable {
    case bad = "bad"
    case empty = "-"
    case good = "good"
}
