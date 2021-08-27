//
//  SuperHeroRepository.swift
//  Challenge
//
//  Created by Everis on 26/08/21.
//

import Foundation

protocol SuperHeroRepository {
    
    func fetchSuperHeroList(completion: @escaping (Result<[SuperHero], Error>) -> Void)
    
}
