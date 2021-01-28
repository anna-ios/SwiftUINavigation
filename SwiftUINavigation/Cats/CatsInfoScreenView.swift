//
//  CatsInfoScreenView.swift
//  SwiftUINavigation
//
//  Created by Анна  Зелинская on 04.01.2021.
//

import Combine
import CustomNavigation
import Foundation
import Networking
import SwiftUI

struct CatsInfoScreenView: View {
    
    @State private var selection = 0
    @State private var segments = ["Cat Breeds","Random Cat Facts"]
    
    var body: some View {
        VStack {
            Picker("Cats Info", selection: $selection) {
                ForEach(0 ..< segments.count) { index in
                    Text(self.segments[index]).tag(index)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            
            if selection == 0 {
                NavigationViewController(transition: .custom(.moveLeft, .moveRight)) {
                    CatBreedsView()
                }
            } else {
                CatFactsView()
            }
        }
    }
}

struct CatBreedsView: View {
    
    @EnvironmentObject var catBreedsViewModel: CatBreedsViewModel
    
    var body: some View {
        List {
            ForEach(catBreedsViewModel.items) { catBreed in
                NavigationPushButton(destination: CatBreedScreenView(breed: catBreed)) {
                    CatBreedCell(item: catBreed)
                        .onAppear() {
                            if catBreedsViewModel.items.isLast(catBreed) {
                                catBreedsViewModel.loadPage()
                            }
                        }
                }
            }
        }
        .onAppear() {
            catBreedsViewModel.reload()
            catBreedsViewModel.loadPage()
        }
    }
}

struct CatBreedCell: View {
    
    @EnvironmentObject var catBreedsViewModel: CatBreedsViewModel
    
    let item: CatBreed
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(item.name)
                .font(.headline)
                .foregroundColor(.primary)
            Text(item.description.asStringOrEmpty)
                .font(.callout)
                .foregroundColor(.secondary)
            
            if let service = catBreedsViewModel.service,
               service.isBreedsLoading && catBreedsViewModel.items.isLast(item) {
                Divider()
                VStack (alignment: .center) {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle())
                }
                .frame(maxWidth: .infinity)
            }
        }
    }
}

struct CatFactsView: View {
    
    @EnvironmentObject var catFactsViewModel: CatFactsViewModel
    
    var body: some View {
        List {
            ForEach(catFactsViewModel.items) { catFact in
                CatFactCell(item: catFact)
                    .onAppear() {
                        if catFactsViewModel.items.isLast(catFact) {
                            catFactsViewModel.loadPage()
                        }
                    }
            }
        }
        .onAppear() {
            catFactsViewModel.reload()
            catFactsViewModel.loadPage()
        }
    }
}

struct CatFactCell: View {
    
    @EnvironmentObject var catFactsViewModel: CatFactsViewModel
    
    let item: CatFact
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(item.text)
                .font(.callout)
                .foregroundColor(.secondary)
            if let service = catFactsViewModel.service,
               service.isFactsLoading && catFactsViewModel.items.isLast(item) {
                Divider()
                VStack (alignment: .center) {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle())
                }
                .frame(maxWidth: .infinity)
            }
        }
    }
}

struct CatsInfoScreenView_Previews: PreviewProvider {
    static var previews: some View {
        CatsInfoScreenView()
    }
}
