//
//  FIAView.swift
//  CoordinatorPattern
//
//  Created by Bart Bruijnesteijn on 11/06/2020.
//  Copyright © 2020 Bart Bruijnesteijn. All rights reserved.
//

import SwiftUI

struct FIAView: View {
    @EnvironmentObject var coordinatorState: CoordinatorState
    
    var body: some View {
        NavigationView {
            VStack {
                FlightInfoView(tab: "ByAirport")

                Spacer()
                
                FIACoordinator()
                
                Spacer()
            }
                
            .navigationBarTitle("Flight Status")
            .navigationBarItems(
                leading:
                Button(action: {
                    self.coordinatorState.page = back(coordinatorState: self.coordinatorState)
                }) {
                    Image("back")
                        .foregroundColor(self.coordinatorState.page == "FIASelectFlightNumber" ? .white : .lightFontColor)
                    Text("Back")
                        .foregroundColor(self.coordinatorState.page == "FIASelectFlightNumber" ? .white : .lightFontColor)
            })
        }
    }
}

private func back(coordinatorState: CoordinatorState) -> String {
    switch coordinatorState.page {
    case "FIAFlightStatus": return "FIASelectFlightNumber"
    default: return "FIASelectFlightNumber"
    }
}

#if DEBUG
struct FIAView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            FINView().environmentObject(CoordinatorState(flow: "ByAirport", page: "FIASelectFlightNumber", back: ""))
                .environment(\.colorScheme, .light)
            FINView().environmentObject(CoordinatorState(flow: "ByAirport", page: "FIASelectFlightNumber", back: ""))
                .environment(\.colorScheme, .light)
                .previewLayout(.fixed(width: 568, height: 320))
            FINView().environmentObject(CoordinatorState(flow: "ByAirport", page: "FIASelectFlightNumber", back: ""))
                .environment(\.colorScheme, .dark)
        }
    }
}
#endif
