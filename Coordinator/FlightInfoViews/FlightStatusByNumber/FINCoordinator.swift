//
//  FINCoordinator.swift
//  CoordinatorPattern
//
//  Created by Bart Bruijnesteijn on 11/06/2020.
//  Copyright © 2020 Bart Bruijnesteijn. All rights reserved.
//

import SwiftUI

struct FINCoordinator: View {
    @EnvironmentObject var coordinatorState: CoordinatorState
    
    var body: some View {
        VStack {
            page(coordinatorState: self.coordinatorState)
        }
        .onAppear() {
            self.coordinatorState.page = "FINSelectFlightNumber"
        }
    }
}

private func page(coordinatorState: CoordinatorState) -> AnyView {
    switch coordinatorState.page {
        case "FINSelectFlightNumber": return AnyView(FINSelectFlightNumberView())
        case "FINFlightStatus": return AnyView(FINFlightStatusView())
        default: return AnyView(FINSelectFlightNumberView())
    }
}

#if DEBUG
struct FINCoordinator_Previews: PreviewProvider {
    static var previews: some View {
        FINCoordinator().environmentObject(CoordinatorState(flow: "FlightNumber", page: "FINSelectFlightNumber", back: ""))
    }
}
#endif
