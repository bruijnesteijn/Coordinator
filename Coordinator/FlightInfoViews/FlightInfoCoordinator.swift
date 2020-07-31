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
        
        .onOpenURL { url in
            coordinatorState.flow = url.flightInfoTab
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

extension URL {
    var flightInfoTab: String {
        guard pathComponents.count > 1 else {
            return ""
        }
        
        switch pathComponents[1] {
        case "byFlightNumber": return "ByFlightNumber"
        case "byRoute": return "ByRoute"
        case "byAirport": return "ByAirport"
        default: return "ByFlightNumber"
        }
    }
}

#if DEBUG
struct FlightInfoCoordinator_Previews: PreviewProvider {
    static var previews: some View {
        FlightInfoCoordinator().environmentObject(CoordinatorState(flow: "ByFlightNumber", page: "FISelectFlightNumber", back: ""))
    }
}
#endif
