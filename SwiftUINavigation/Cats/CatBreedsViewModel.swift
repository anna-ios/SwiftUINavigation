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
    @Published private(set) var page: Int = 0
    @Published private(set) var isPageLoading: Bool = false
    
    
    init() {}
    
    func loadPage() {
        guard isPageLoading == false else {
            return
        }
        isPageLoading = true
        CatBreedsAPI.getCatBreedList(attachBreed: 0, page: page, limit: 10) { response, error in
            if let resp = response {
                self.items.append(contentsOf: resp)
            }
            self.isPageLoading = false
        }
        page += 1
    }
    
    func reload() {
        page = 0
        self.items.removeAll()
    }
}

