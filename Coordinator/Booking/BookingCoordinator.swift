//
//  BookingCoordinator.swift
//  Router
//
//  Created by Bart Bruijnesteijn on 06/04/2020.
//  Copyright © 2020 Bart Bruijnesteijn. All rights reserved.
//

import SwiftUI

struct BookingCoordinator: View {
    @EnvironmentObject var coordinatorState: CoordinatorState
    
    var body: some View {
        VStack {
            flow(coordinatorState: self.coordinatorState)
        }
        
        .onOpenURL { url in
            coordinatorState.flow = url.bookTab
        }
    }
}

private func flow(coordinatorState: CoordinatorState) -> AnyView {
    switch coordinatorState.flow {
    case "ReturnBooking": return AnyView(RBView())
    case "OneWayBooking": return AnyView(OWBView())
    case "MultiCityBooking": return AnyView(MCBView())
    default: return AnyView(RBView())
    }
}

extension URL {
    var bookTab: String {
        guard pathComponents.count > 1 else {
            return ""
        }
        
        switch pathComponents[1] {
        case "returnBooking": return "ReturnBooking"
        case "oneWayBooking": return "OneWayBooking"
        case "multiCityBooking": return "MultiCityBooking"
        default: return "ReturnBooking"
        }
    }
}

#if DEBUG
struct BookCoordinator_Previews: PreviewProvider {
    static var previews: some View {
        BookingCoordinator().environmentObject(CoordinatorState(flow: "ReturnBooking", page: "RBSelectOriginDestination", back: ""))
    }
}
#endif
