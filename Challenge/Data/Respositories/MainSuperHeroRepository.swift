//
//  MainSuperHeroRepository.swift
//  Challenge
//
//  Created by Everis on 26/08/21.
//

import Foundation

final class MainSuperHeroRepository: SuperHeroRepository {
    
    func fetchSuperHeroList(completion: @escaping (Result<[SuperHero], Error>) -> Void) {
        APIEndpoints.getSuperHeroes(completion: { result in
            if let listSuperHero = result {
                completion(.success(listSuperHero))
            }
        })
    }
    
}
