//
//  RBView.swift
//  Router
//
//  Created by Bart Bruijnesteijn on 06/04/2020.
//  Copyright © 2020 Bart Bruijnesteijn. All rights reserved.
//

import SwiftUI

struct RBView: View {
    @EnvironmentObject var coordinatorState: CoordinatorState
    
    var body: some View {
        NavigationView {
            VStack {
                BookingView(tab: "ReturnBooking")
                
                Spacer()
                
                RBCoordinator()
                
                Spacer()
            }
                
            .navigationBarTitle("Book a trip")
            .navigationBarItems(
                leading:
                Button(action: {
                    self.coordinatorState.page = back(coordinatorState: self.coordinatorState)
                }) {
                    Image("back")
                        .foregroundColor((self.coordinatorState.page == "RBSelectOriginDestination" || self.coordinatorState.page == "") ? .white : .lightFontColor)
                    Text("Back")
                        .foregroundColor((self.coordinatorState.page == "RBSelectOriginDestination" || self.coordinatorState.page == "") ? .white : .lightFontColor)
            })
        }
    }
}

private func back(coordinatorState: CoordinatorState) -> String {
    switch coordinatorState.page {
    case "RBSelectTravelDates": return "RBSelectOriginDestination"
    case "RBChooseOutboundFlight": return "RBSelectTravelDates"
    case "RBChooseInboundFlight": return "RBChooseOutboundFlight"
    case "RBChooseExtraOptions": return "RBChooseInboundFlight"
    case "RBPassengerDetails": return "RBChooseExtraOptions"
    default: return "RBSelectOriginDestination"
    }
}

#if DEBUG
struct RBView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            RBView().environmentObject(CoordinatorState(flow: "ReturnBooking", page: "RBSelectOriginDestination", back: ""))
                .environment(\.colorScheme, .light)
            RBView().environmentObject(CoordinatorState(flow: "ReturnBooking", page: "RBSelectOriginDestination", back: ""))
                .environment(\.colorScheme, .light)
                .previewLayout(.fixed(width: 568, height: 320))
            RBView().environmentObject(CoordinatorState(flow: "ReturnBooking", page: "RBSelectOriginDestination", back: ""))
                .environment(\.colorScheme, .dark)
        }
    }
}
#endif
