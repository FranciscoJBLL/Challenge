//
//  SuperHero.swift
//  Challenge
//
//  Created by Everis on 25/08/21.
//

import Foundation

struct SuperHero: Codable {
    let id: Int
    let name, slug: String
    let powerstats: Powerstats
    let appearance: Appearance
    let biography: Biography
    let work: Work
    let connections: Connections
    let images: Images
}
