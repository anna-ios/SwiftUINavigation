//
//  AnimalsViewModel.swift
//  SwiftUINavigation
//
//  Created by Zelinskaya Anna on 17.12.2020.
//

import Foundation

final class AnimalsViewModel: ObservableObject {
	
	@Published var listSelection: Int?
	
	@Published private(set) var animals = [Animal(name: "🐶"),
										   Animal(name: "🐱"),
										   Animal(name: "🐭"),
										   Animal(name: "🐹"),
										   Animal(name: "🐰"),
										   Animal(name: "🦊"),
										   Animal(name: "🐻"),
										   Animal(name: "🐼"),
										   Animal(name: "🐻‍❄️"),
										   Animal(name: "🐨"),
										   Animal(name: "🐯"),
										   Animal(name: "🦁")]
}
