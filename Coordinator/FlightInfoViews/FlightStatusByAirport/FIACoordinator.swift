//
//  FIACoordinator.swift
//  CoordinatorPattern
//
//  Created by Bart Bruijnesteijn on 11/06/2020.
//  Copyright © 2020 Bart Bruijnesteijn. All rights reserved.
//

import SwiftUI

struct FIACoordinator: View {
    @EnvironmentObject var coordinatorState: CoordinatorState
    
    var body: some View {
        VStack {
            page(coordinatorState: self.coordinatorState)
        }
        .onAppear() {
            self.coordinatorState.page = "FIASelectAirport"
        }
    }
}

private func page(coordinatorState: CoordinatorState) -> AnyView {
    switch coordinatorState.page {
        case "FIASelectAirport": return AnyView(FIASelectAirportView())
        case "FIAFlightStatus": return AnyView(FIAFlightStatusView())
        default: return AnyView(FIASelectAirportView())
    }
}

#if DEBUG
struct FIACoordinator_Previews: PreviewProvider {
    static var previews: some View {
        FIACoordinator().environmentObject(CoordinatorState(flow: "FlightNumber", page: "FIASelectAirport", back: ""))
    }
}
#endif
