//
//  NavigationViewController.swift
//  SwiftUINavigation
//
//  Created by Анна  Зелинская on 04.01.2021.
//

import Foundation
import SwiftUI

public struct NavigationViewController<Content>: View where Content: View {
    
    @ObservedObject var viewModel = NavigationViewModel()
    
    private let content: Content
    private let transitions: (push: AnyTransition, pop: AnyTransition)
    
    public init(transition: NavigationTransition,
                @ViewBuilder content: @escaping () -> Content) {
        
        self.content = content()
        
        switch transition {
        case .custom(let pushTrans, let popTrans ):
            transitions = (pushTrans, popTrans)
        case .none:
            transitions = (.identity, .identity)
        }
    }
    
    public var body: some View {
        return ZStack {
            if viewModel.isRoot() {
                content
                    .transition(viewModel.navigationType == .push ? transitions.push : transitions.pop)
                    .environmentObject(viewModel)
            } else {
                viewModel.nextScreen()
                    .transition(viewModel.navigationType == .push ? transitions.push : transitions.pop)
                    .environmentObject(viewModel)
            }
        }
        .onAppear() {
            viewModel.reload()
        }
    }
    
}

public struct NavigationPushButton<Label, Destination>: View where Label: View, Destination: View {
    
    @EnvironmentObject var viewModel: NavigationViewModel
    
    private let destination: Destination
    private let label: () -> Label
    
    public init(destination: Destination, @ViewBuilder label: @escaping () -> Label) {
        self.destination = destination
        self.label = label
    }
    
    public var body: some View {
        label().onTapGesture {
            push()
        }
    }
    
    private func push() {
        viewModel.push(destination)
    }
}

public struct NavigationPopButton<Label>: View where Label: View {
    
    @EnvironmentObject var viewModel: NavigationViewModel
    
    private let destination: PopDestination
    private let label: () -> Label
    
    public init(destination: PopDestination, @ViewBuilder label: @escaping () -> Label) {
        self.destination = destination
        self.label = label
    }
    
    public var body: some View {
        label().onTapGesture {
            push()
        }
    }
    
    private func push() {
        viewModel.pop(to: destination)
    }
}

