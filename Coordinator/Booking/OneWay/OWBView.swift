//
//  OWBView.swift
//  Router
//
//  Created by Bart Bruijnesteijn on 06/04/2020.
//  Copyright © 2020 Bart Bruijnesteijn. All rights reserved.
//

import SwiftUI

struct OWBView: View {
    @EnvironmentObject var coordinatorState: CoordinatorState
    
    var body: some View {
        NavigationView {
            VStack {
                BookingView(tab: "OneWayBooking")

                Spacer()
                
                OWBCoordinator()
                
                Spacer()
            }
                
            .navigationBarTitle("Book a trip")
            .navigationBarItems(
                leading:
                Button(action: {
                    self.coordinatorState.page = back(coordinatorState: self.coordinatorState)
                }) {
                    Image("back")
                        .foregroundColor((self.coordinatorState.page == "OWBSelectOriginDestination" || self.coordinatorState.page == "") ? .accentColor : .white)
                    Text("Back")
                        .foregroundColor((self.coordinatorState.page == "OWBSelectOriginDestination" || self.coordinatorState.page == "") ? .accentColor : .white)
            })
        }
    }
}

private func back(coordinatorState: CoordinatorState) -> String {
    switch coordinatorState.page {
    case "OWBSelectTravelDate": return "OWBSelectOriginDestination"
    default: return "OWBSelectOriginDestination"
    }
}

#if DEBUG
struct OWBView_Previews: PreviewProvider {
    static var previews: some View {
        OWBView().environmentObject(CoordinatorState(flow: "OneWayBooking", page: "", back: ""))
    }
}
#endif
