//
//  OWBCoordinator.swift
//  CoordinatorPattern
//
//  Created by Bart Bruijnesteijn on 14/06/2020.
//  Copyright © 2020 Bart Bruijnesteijn. All rights reserved.
//

import SwiftUI

struct OWBCoordinator: View {
    @EnvironmentObject var coordinatorState: CoordinatorState
    
    var body: some View {
        VStack {
            page(coordinatorState: self.coordinatorState)
        }
    }
}

private func page(coordinatorState: CoordinatorState) -> AnyView {
    switch coordinatorState.page {
    case "OWBSelectOriginDestination": return AnyView(OWBSelectOriginDestinationView())
    case "OWBSelectTravelDate": return AnyView(OWBSelectTravelDateView())
    default: return AnyView(OWBSelectOriginDestinationView())
    }
}

struct OWBCoordinator_Previews: PreviewProvider {
    static var previews: some View {
        OWBCoordinator()
    }
}
