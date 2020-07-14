//
//  CoordinatorState.swift
//  CoordinatorState
//
//  Created by Bart Bruijnesteijn on 06/04/2020.
//  Copyright © 2020 Bart Bruijnesteijn. All rights reserved.
//

import SwiftUI
import Combine
import Foundation

class CoordinatorState: ObservableObject {
    let objectWillChange = PassthroughSubject<CoordinatorState, Never>()
    
    init() {
    }
    
    init(flow: String, page: String, back: String) {
        self.flow = flow
        self.page = page
        self.back = back
    }
    
    var flow: String = "ReturnBooking" {
        didSet {
            withAnimation() {
                objectWillChange.send(self)
            }
        }
    }

    var page: String = "RBSelectOriginDestination" {
        didSet {
            withAnimation() {
                objectWillChange.send(self)
            }
        }
    }
    
    var back: String = "" {
        didSet {
            withAnimation() {
                objectWillChange.send(self)
            }
        }
    }
}

