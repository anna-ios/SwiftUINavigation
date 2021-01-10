//
//  Transition.swift
//  SwiftUINavigation
//
//  Created by Анна  Зелинская on 04.01.2021.
//

import Foundation
import SwiftUI

extension AnyTransition {
    
    static var moveLeft: AnyTransition {
        let insertion = AnyTransition.move(edge: .trailing)
        let removal = AnyTransition.move(edge: .leading)
        return .asymmetric(insertion: insertion, removal: removal)
    }
    
    static var moveRight: AnyTransition {
        let insertion = AnyTransition.move(edge: .leading)
        let removal = AnyTransition.move(edge: .trailing)
        return .asymmetric(insertion: insertion, removal: removal)
    }
}
