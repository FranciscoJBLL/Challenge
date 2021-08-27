//
//  FetchSuperHeroUseCases.swift
//  Challenge
//
//  Created by Everis on 23/08/21.
//

import Foundation

protocol SuperHeroesUseCaseDelegate {
    func getAllSuperHeroes(completion: @escaping ([SuperHero]?) -> Void)
}

class SuperHeroesUseCase: SuperHeroesUseCaseDelegate {
    
    private let superHeroRepository: MainSuperHeroRepository
    
    init(superHeroRepository: MainSuperHeroRepository) {
        self.superHeroRepository = superHeroRepository
    }

    func getAllSuperHeroes(completion: @escaping ([SuperHero]?) -> Void) {
        self.superHeroRepository.fetchSuperHeroList(completion: { result in
            switch result {
            case .success(let items):
                completion(items)
            case .failure: break
            }
        })
    }
    
}
