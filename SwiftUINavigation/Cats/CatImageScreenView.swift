//
//  CatsImageScreenView.swift
//  SwiftUINavigation
//
//  Created by Анна  Зелинская on 10.01.2021.
//

import CustomNavigation
import Foundation
import SwiftUI
import UIComponents

struct CatImageScreenView: View {
    
    let url: URL
    
    var body: some View {
        VStack() {
            HStack {
                Spacer()
                NavigationPopButton(destination: .previous) {
                    Image(systemName: "xmark")
                        .font(.largeTitle)
                }
                .frame(width: 44, height: 44)
            }
            AsyncImage(url: url,
                       placeholder: { Text("Loading ...") },
                       image: { Image(uiImage: $0).resizable() })
                .aspectRatio(contentMode: .fit)
            Spacer()
        }
    }
}
