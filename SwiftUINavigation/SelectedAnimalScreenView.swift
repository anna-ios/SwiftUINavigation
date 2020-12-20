//
//  SelectedAnimalScreenView.swift
//  SwiftUINavigation
//
//  Created by Zelinskaya Anna on 17.12.2020.
//

import SwiftUI

struct SelectedAnimalScreenView: View {
	
	@Binding var tabSelection: Int
	
	@Binding var listSelection: Int?
			
	var body: some View {
		Button(action: {
			listSelection = 4
			tabSelection = 1
		}, label: {
			Text("Select hare")
		})
	}
}
