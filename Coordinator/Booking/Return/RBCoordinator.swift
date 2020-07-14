//
//  RBCoordinator.swift
//  CoordinatorPattern
//
//  Created by Bart Bruijnesteijn on 10/06/2020.
//  Copyright © 2020 Bart Bruijnesteijn. All rights reserved.
//

import SwiftUI

struct RBCoordinator: View {
    @EnvironmentObject var coordinatorState: CoordinatorState
    
    var body: some View {
        VStack {
            page(coordinatorState: self.coordinatorState)
        }
    }
}

private func page(coordinatorState: CoordinatorState) -> AnyView {
    switch coordinatorState.page {
       case "RBSelectOriginDestination": return AnyView(RBSelectOriginDestinationView())
        case "RBSelectTravelDates": return AnyView(RBSelectTravelDatesView())
        case "RBChooseOutboundFlight": return AnyView(RBSelectOutboundFlightView())
        case "RBChooseInboundFlight": return AnyView(RBSelectInboundFlightView())
        case "RBChooseExtraOptions": return AnyView(RBSelectExtraOptionsView())
        case "RBPassengerDetails": return AnyView(RBPassengerDetailsView())
        default: return AnyView(RBSelectOriginDestinationView())
    }
}

#if DEBUG
struct RBCoordinator_Previews: PreviewProvider {
    static var previews: some View {
        RBCoordinator().environmentObject(CoordinatorState(flow: "ReturnBooking", page: "RBSelectOriginDestination", back: ""))
    }
}
#endif
