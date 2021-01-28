//
//  SwiftUINavigationApp.swift
//  SwiftUINavigation
//
//  Created by Zelinskaya Anna on 15.12.2020.
//

import SwiftUI

@main
struct SwiftUINavigationApp: App {
    
    init() {
        ServiceLocator.shared.addService(service: (PageLoadingService() as PageLoadingService))
    }
    
    var body: some Scene {
        WindowGroup {
            RootView()
                .environmentObject(CatBreedsViewModel())
                .environmentObject(CatFactsViewModel())
        }
    }
    
}
