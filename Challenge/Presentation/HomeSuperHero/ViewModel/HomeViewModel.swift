//
//  SuperHeroViewModel.swift
//  Challenge
//
//  Created by Everis on 23/08/21.
//

import Foundation
import Alamofire

class HomeViewModel {
    
    // CONNECT VIEW WITH VIEWMODEL
    
    var updateData = { () -> () in }
    
    var superHeroList: [SuperHero] = [] {
        didSet {
            updateData()
        }
    }
    
    func fetchSuperHeroData() {
     
        let useCase = SuperHeroesUseCase(superHeroRepository: MainSuperHeroRepository())
        
        useCase.getAllSuperHeroes(completion: { result in
            if let list = result {
                self.superHeroList = list
            } else {
                print("Error to retrieve data")
            }
        })
        
    }
}
