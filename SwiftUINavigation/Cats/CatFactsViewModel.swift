//
//  CatFactsViewModel.swift
//  SwiftUINavigation
//
//  Created by Анна  Зелинская on 04.01.2021.
//

import Foundation
import Networking

extension CatFact: Identifiable {
}

final class CatFactsViewModel: ObservableObject {
    
    @Published private(set) var items: [CatFact] = [CatFact]()
    @Published private(set) var isPageLoading: Bool = false
    
    init() {}
    
    func loadPage() {
        
        guard isPageLoading == false else {
            return
        }
        isPageLoading = true
                
        CatFactsAPI.getCatFacts(animalType: "cat", amount: 10) { response, error in
            if let resp = response {
                self.items.append(contentsOf: resp)
            }
            self.isPageLoading = false
        }
    }
    
    func reload() {
        self.items.removeAll()
    }
}

