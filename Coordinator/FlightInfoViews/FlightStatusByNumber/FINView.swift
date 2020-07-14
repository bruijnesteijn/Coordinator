//
//  FINView.swift
//  CoordinatorPattern
//
//  Created by Bart Bruijnesteijn on 10/06/2020.
//  Copyright © 2020 Bart Bruijnesteijn. All rights reserved.
//

import SwiftUI

struct FINView: View {
    @EnvironmentObject var coordinatorState: CoordinatorState
    
    var body: some View {
        NavigationView {
            VStack {
                FlightInfoView(tab: "ByFlightNumber")
                
                Spacer()
                
                FINCoordinator()
                
                Spacer()
            }
                
            .navigationBarTitle("Flight Status")
            .navigationBarItems(
                leading:
                Button(action: {
                    self.coordinatorState.page = back(coordinatorState: self.coordinatorState)
                }) {
                    Image("back")
                        .foregroundColor(self.coordinatorState.page == "FINSelectFlightNumber" ? .white : .lightFontColor)
                    Text("Back")
                        .foregroundColor(self.coordinatorState.page == "FINSelectFlightNumber" ? .white : .lightFontColor)
            })
        }
    }
    
}

private func back(coordinatorState: CoordinatorState) -> String {
    switch coordinatorState.page {
    case "FIFlightStatus": return "FISelectFlightNumber"
    default: return "FISelectFlightNumber"
    }
}

#if DEBUG
struct FINView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            FINView().environmentObject(CoordinatorState(flow: "ByFlightNumber", page: "FINSelectFlightNumber", back: ""))
                .environment(\.colorScheme, .light)
            FINView().environmentObject(CoordinatorState(flow: "ByFlightNumber", page: "FINSelectFlightNumber", back: ""))
                .environment(\.colorScheme, .light)
                .previewLayout(.fixed(width: 568, height: 320))
            FINView().environmentObject(CoordinatorState(flow: "ByFlightNumber", page: "FINSelectFlightNumber", back: ""))
                .environment(\.colorScheme, .dark)
        }
    }
}
#endif
