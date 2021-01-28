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
    let service: PageLoadingService?
    
    init() {
        self.service = ServiceLocator.shared.getService()
    }
    
    func loadPage() {
        
        guard service?.isFactsLoading == false else {
            return
        }
        
        service?.getCatFacts(completion: { catFacts in
            if let facts = catFacts {
                self.items.append(contentsOf: facts)
            }
        })
    }
    
    func reload() {
        self.items.removeAll()
    }
    
}

