//
//  Appearance.swift
//  Challenge
//
//  Created by Everis on 26/08/21.
//

import Foundation

// MARK: - Appearance
struct Appearance: Codable {
    let gender: Gender
    let race: String?
    let height:[String]
    let weight: [String]
    let eyeColor, hairColor: String
}

enum Gender: String, Codable {
    case female = "Female"
    case male = "Male"
}
