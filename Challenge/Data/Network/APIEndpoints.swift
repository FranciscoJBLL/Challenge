//
//  APIEndpoints.swift
//  Challenge
//
//  Created by Everis on 26/08/21.
//

import Foundation
import Alamofire

struct AppConfiguration {
    var apiBaseURL: String = "https://dev.consultr.net/"
}

struct APIEndpoints {
    
    static func getSuperHeroes(completion: @escaping ([SuperHero]?) -> Void) {
        
        let appConfiguration = AppConfiguration()
        let url = appConfiguration.apiBaseURL + "superhero.json"
        
        AF.request(url).response { response in
            guard let data = response.data else { return }
            do {
                let decoder = JSONDecoder()
                let superHeroList = try decoder.decode([SuperHero].self, from: data)
                completion(superHeroList)
            } catch let error {
                print(error)
                completion(nil)
            }
        }
    }
    
}
