//
//  ShowModalScreenView.swift
//  SwiftUINavigation
//
//  Created by Zelinskaya Anna on 17.12.2020.
//

import SwiftUI

struct ShowModalScreenView:View {
	
	@State var showModal: Bool = false
	
	var body: some View {
		Button(action: {
			showModal = true
		}) {
			Text("Show Modal View")
		}.sheet(isPresented: $showModal) {
			Text("Modal View")
		}
	}
}
