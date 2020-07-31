//
//  TripsCoordinator.swift
//  Router
//
//  Created by Bart Bruijnesteijn on 06/04/2020.
//  Copyright © 2020 Bart Bruijnesteijn. All rights reserved.
//

import SwiftUI

struct TripsCoordinator: View {
    @EnvironmentObject var coordinatorState: CoordinatorState
    
    var body: some View {
        VStack {
            flow(coordinatorState: self.coordinatorState)
        }
        
        .onOpenURL { url in
            coordinatorState.flow = url.tripsTab
        }
    }
}

private func flow(coordinatorState: CoordinatorState) -> AnyView {
    switch coordinatorState.flow {
        case "NextTrip": return AnyView(NextTripView())
        case "UpcomingTrips": return AnyView(UpcomingTripsView())
        case "PreviousTrips": return AnyView(PreviousTripsView())
        default: return AnyView(NextTripView())
    }
}

extension URL {
    var tripsTab: String {
        guard pathComponents.count > 1 else {
            return ""
        }
        
        switch pathComponents[1] {
        case "nextTrip": return "NextTrip"
        case "upcomingTrips": return "UpcomingTrips"
        case "previousTrips": return "PreviousTrips"
        default: return "NextTrip"
        }
    }
}

#if DEBUG
struct TripsCoordinator_Previews: PreviewProvider {
    static var previews: some View {
        TripsCoordinator().environmentObject(CoordinatorState(flow: "", page: "", back: ""))
    }
}
#endif
