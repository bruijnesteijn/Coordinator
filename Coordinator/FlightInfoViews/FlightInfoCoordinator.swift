//
//  FlightInfoCoordinator.swift
//  Router
//
//  Created by Bart Bruijnesteijn on 06/04/2020.
//  Copyright © 2020 Bart Bruijnesteijn. All rights reserved.
//

import SwiftUI

struct FlightInfoCoordinator: View {
    @EnvironmentObject var coordinatorState: CoordinatorState
    
    var body: some View {
        VStack {
            flow(coordinatorState: self.coordinatorState)
        }
    }
}

private func flow(coordinatorState: CoordinatorState) -> AnyView {
    switch coordinatorState.flow {
        case "ByFlightNumber": return AnyView(FINView())
        case "ByRoute": return AnyView(FIRView())
        case "ByAirport": return AnyView(FIAView())
        default: return AnyView(FINView())
    }
}

#if DEBUG
struct FlightInfoCoordinator_Previews: PreviewProvider {
    static var previews: some View {
        FlightInfoCoordinator().environmentObject(CoordinatorState(flow: "ByFlightNumber", page: "FISelectFlightNumber", back: ""))
    }
}
#endif
