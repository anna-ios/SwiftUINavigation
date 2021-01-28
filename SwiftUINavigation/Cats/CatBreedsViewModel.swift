//
//  CatBreedsViewModel.swift
//  SwiftUINavigation
//
//  Created by Анна  Зелинская on 04.01.2021.
//

import Foundation
import Networking

extension CatBreed: Identifiable {
}

final class CatBreedsViewModel: ObservableObject {
    
    @Published private(set) var items: [CatBreed] = [CatBreed]()
    let service: PageLoadingService?
    
    init() {
        self.service = ServiceLocator.shared.getService()
    }
    
    func loadPage() {
        guard let service = self.service,
              service.isBreedsLoading == false else {
            return
        }
        
        service.getCatBreeds { catBreeds in
            if let breeds = catBreeds {
                self.items.append(contentsOf: breeds)
            }
        }
    }
    
    func reload() {
        self.items.removeAll()
        service?.reload()
    }
    
}

