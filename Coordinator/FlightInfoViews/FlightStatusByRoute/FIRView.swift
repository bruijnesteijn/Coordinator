//
//  FIRView.swift
//  CoordinatorPattern
//
//  Created by Bart Bruijnesteijn on 11/06/2020.
//  Copyright © 2020 Bart Bruijnesteijn. All rights reserved.
//

import SwiftUI

struct FIRView: View {
    @EnvironmentObject var coordinatorState: CoordinatorState
    
    var body: some View {
        NavigationView {
            VStack {
                FlightInfoView(tab: "ByRoute")

                Spacer()
                
                FIRCoordinator()
                
                Spacer()
            }
                
            .navigationBarTitle("Flight Status")
            .navigationBarItems(
                leading:
                Button(action: {
                    self.coordinatorState.page = back(coordinatorState: self.coordinatorState)
                }) {
                    Image("back")
                        .foregroundColor(self.coordinatorState.page == "FIRSelectFlightNumber" ? .white : .lightFontColor)
                    Text("Back")
                        .foregroundColor(self.coordinatorState.page == "FIRSelectFlightNumber" ? .white : .lightFontColor)
            })
        }
    }
}

private func back(coordinatorState: CoordinatorState) -> String {
    switch coordinatorState.page {
    case "FIRFlightStatus": return "FIRSelectFlightNumber"
    default: return "FIRSelectFlightNumber"
    }
}

#if DEBUG
struct FIRView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            FINView().environmentObject(CoordinatorState(flow: "ByRoute", page: "FIRSelectFlightNumber", back: ""))
                .environment(\.colorScheme, .light)
            FINView().environmentObject(CoordinatorState(flow: "ByRoute", page: "FIRSelectFlightNumber", back: ""))
                .environment(\.colorScheme, .light)
                .previewLayout(.fixed(width: 568, height: 320))
            FINView().environmentObject(CoordinatorState(flow: "FIByNumber", page: "FISelectFlightNumber", back: ""))
                .environment(\.colorScheme, .dark)
        }
    }
}
#endif
