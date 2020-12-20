//
//  RootView.swift
//  SwiftUINavigation
//
//  Created by Zelinskaya Anna on 15.12.2020.
//

import SwiftUI

struct RootView: View {
	
	init() {
		UITableView.appearance().backgroundColor = UIColor.clear
		UITableViewCell.appearance().selectionStyle = .none
	}
	
	@ObservedObject var animalsViewModel = AnimalsViewModel()
	
	@State private var tabSelection = 0
	
	var body: some View {
		TabView(selection: $tabSelection) {
			SelectedAnimalScreenView(tabSelection: $tabSelection, listSelection: $animalsViewModel.listSelection).tabItem {
				Text("Select hare")
				Image(systemName: "hare")
			}.tag(0)
			
			AnimalListScreenView(animalsViewModel: animalsViewModel).tabItem {
				Text("Animals")
				Image(systemName: "list.bullet")
			}.tag(1)
			
			ShowModalScreenView().tabItem {
				Image(systemName: "arrow.up.doc.on.clipboard")
				Text("Modal View")
			}.tag(2)
		}
	}
}
