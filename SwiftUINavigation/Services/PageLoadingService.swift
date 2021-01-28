//
//  PageLoadingService.swift
//  SwiftUINavigation
//
//  Created by Zelinskaya Anna on 25.01.2021.
//

import Foundation
import Networking

class PageLoadingService {
    
    @Published private(set) var page: Int = 0
    @Published private(set) var isBreedsLoading: Bool = false
    @Published private(set) var isFactsLoading: Bool = false
    
    func getCatBreeds(completion: @escaping (_ breeds: [CatBreed]?) -> Void) {
        isBreedsLoading = true
        
        CatBreedsAPI.getCatBreedList(attachBreed: 0, page: page, limit: 10) { response, error in
            guard let resp = response else {
                completion(nil)
                return
            }
            
            self.page += 1
            self.isBreedsLoading = false
            completion(resp)
        }
    }
    
    func getCatFacts(completion: @escaping (_ facts: [CatFact]?) -> Void) {
        isFactsLoading = false
        
        CatFactsAPI.getCatFacts(animalType: "cat", amount: 10) { response, error in
            guard let resp = response else {
                completion(nil)
                return
            }
            
            self.isFactsLoading = false
            completion(resp)
        }
    }
    
    func reload() {
        page = 0
    }
    
}
