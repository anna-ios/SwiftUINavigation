//
//  AnimalDetailScreenView.swift
//  SwiftUINavigation
//
//  Created by Zelinskaya Anna on 17.12.2020.
//

import SwiftUI

struct AnimalDetailScreenView: View {
	
	let animalName: String
	
	var body: some View {
		Text(animalName)
			.font(Font.system(size: 200))
	}
}
