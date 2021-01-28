//
//  AnimalListScreenView.swift
//  SwiftUINavigation
//
//  Created by Zelinskaya Anna on 17.12.2020.
//

import SwiftUI

struct AnimalListScreenView:View {
	
	@ObservedObject var animalsViewModel: AnimalsViewModel
	
	@State var listSelection: Int?
	
	var body: some View {
		
		NavigationView {
			List() {
				ForEach(Array(animalsViewModel.animals.enumerated()), id: \.offset) { index, animal in
					NavigationLink(destination: AnimalDetailScreenView(animalName: animal.name),
								   tag:index,
								   selection:$animalsViewModel.listSelection) {
						cell(animal: animal)
					}
					.listRowBackground(animalsViewModel.listSelection == index ? Color.gray : Color.clear)
				}
			}
			.listStyle(GroupedListStyle())
		}
	}
	
	func cell(animal: Animal) -> some View {
		Text(animal.name)
	}
}
