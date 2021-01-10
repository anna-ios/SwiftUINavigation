//
//  NavigationViewModel.swift
//  SwiftUINavigation
//
//  Created by Анна  Зелинская on 10.01.2021.
//

import Foundation
import SwiftUI

enum NavigationType {
    case push
    case pop
}

public enum PopDestination {
    case previous
    case root
}

public enum NavigationTransition {
    case none
    case custom(AnyTransition, AnyTransition)
}

final class NavigationViewModel: ObservableObject {
    
    @Published private var currentScreen: Screen?
    
    private var navigationStack = NavigationStack() {
        didSet {
            currentScreen = navigationStack.top()
        }
    }
    
    var navigationType: NavigationType = .push
    
    func push<S: View>(_ screenView: S) {
        withAnimation(.default) {
            navigationType = .push
            let screen = Screen(id: UUID().uuidString, nextScreen: AnyView(screenView))
            navigationStack.push(screen)
        }
    }
    
    func pop(to: PopDestination = .previous) {
        withAnimation(.default) {
            navigationType = .pop
            switch to {
            case .root:
                navigationStack.popToRoot()
            case .previous:
                navigationStack.popToPrevious()
            }
        }
    }
    
    func isRoot() -> Bool {
        return self.currentScreen == nil
    }
    
    func nextScreen() -> AnyView {
        return self.currentScreen!.nextScreen
    }
    
    func reload() {
        navigationStack.popToRoot()
    }
}

private struct NavigationStack {
    
    private var screenStack = [Screen]()
    
    func top() -> Screen? {
        screenStack.last
    }
    
    mutating func push(_ screen: Screen) {
        screenStack.append(screen)
    }
    
    mutating func popToPrevious() {
        if screenStack.count == 0 {
            return
        }
        _ = screenStack.popLast()
    }
    
    mutating func popToRoot() {
        screenStack.removeAll()
    }
}

private struct Screen: Identifiable, Equatable {
    
    let id: String
    let nextScreen: AnyView
    
    static func == (lhs: Screen, rhs: Screen) -> Bool {
        lhs.id == rhs.id
    }
}
