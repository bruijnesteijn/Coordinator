//
//  FIRCoordinator.swift
//  CoordinatorPattern
//
//  Created by Bart Bruijnesteijn on 11/06/2020.
//  Copyright © 2020 Bart Bruijnesteijn. All rights reserved.
//

import SwiftUI

struct FIRCoordinator: View {
    @EnvironmentObject var coordinatorState: CoordinatorState
    
    var body: some View {
        VStack {
            page(coordinatorState: self.coordinatorState)
        }
        .onAppear() {
            self.coordinatorState.page = "FIRSelectRoute"
        }
    }
}

private func page(coordinatorState: CoordinatorState) -> AnyView {
    switch coordinatorState.page {
        case "FIRSelectRoute": return AnyView(FIRSelectRouteView())
        case "FIRFlightStatus": return AnyView(FIRFlightStatusView())
        default: return AnyView(FIRSelectRouteView())
    }
}

#if DEBUG
struct FIRCoordinator_Previews: PreviewProvider {
    static var previews: some View {
        FIRCoordinator().environmentObject(CoordinatorState(flow: "FlightNumber", page: "FIRSelectRoute", back: ""))
    }
}
#endif
