//
//  CatInfoScreenView.swift
//  SwiftUINavigation
//
//  Created by Анна  Зелинская on 10.01.2021.
//

import CustomNavigation
import Foundation
import Networking
import SwiftUI

struct CatInfoScreenView: View {
    
    let breed: CatBreed
    
    var body: some View {
        VStack {
            HStack(alignment: .top) {
                NavigationPopButton(destination: .previous) {
                    Image(systemName: "chevron.left")
                        .font(.largeTitle)
                }
                .frame(width: 44, height: 44)
                Spacer()
            }
            VStack(alignment: .center) {
                Text(breed.name)
                    .font(.headline)
                    .foregroundColor(.primary)
                Text(breed.temperament.asStringOrEmpty)
                    .font(.callout)
                    .foregroundColor(.secondary)
                Text(breed.origin.asStringOrEmpty)
                    .font(.callout)
                    .foregroundColor(.secondary)
                Text(breed.lifeSpan.asStringOrEmpty)
                    .font(.callout)
                    .foregroundColor(.secondary)
                Text(breed.description.asStringOrEmpty)
                    .font(.callout)
                    .foregroundColor(.secondary)
                
                if let imageUrl = URL(string: breed.image?.url ?? "") {
                    NavigationPushButton(destination: CatImageScreenView(url: imageUrl)) {
                        Text("Show Image")
                            .underline()
                    }
                }
            }
            .frame(maxWidth: 400)
            Spacer()
        }
        .frame(maxHeight: .infinity)
    }
}

