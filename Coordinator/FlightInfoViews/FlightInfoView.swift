//
//  FlightInfoView.swift
//  CoordinatorPattern
//
//  Created by Bart Bruijnesteijn on 11/06/2020.
//  Copyright © 2020 Bart Bruijnesteijn. All rights reserved.
//

import SwiftUI

struct FlightInfoView: View {
    @EnvironmentObject var coordinatorState: CoordinatorState
    
    let tab: String
    
    var body: some View {
        HStack {
            Button(action: {
                self.coordinatorState.flow = "ByFlightNumber"
                self.coordinatorState.page = "FINSelectFlightNumber"
                self.coordinatorState.back = ""
            }) {
                Text("Flight number")
            }
            .font(.headline)
            .foregroundColor(tab == "ByFlightNumber" ? .darkFontColor : .lightFontColor)
            .padding()
            
            Button(action: {
                self.coordinatorState.flow = "ByRoute"
                self.coordinatorState.page = "FIRSelectRoute"
                self.coordinatorState.back = ""
            }) {
                Text("Route")
            }
            .font(.headline)
            .foregroundColor(tab == "ByRoute" ? .darkFontColor : .lightFontColor)
            .padding()
            
            Button(action: {
                self.coordinatorState.flow = "ByAirport"
                self.coordinatorState.page = "FIASelectAirport"
                self.coordinatorState.back = ""
            }) {
                Text("Airport")
            }
            .font(.headline)
            .foregroundColor(tab == "ByAirport" ? .darkFontColor : .lightFontColor)
            .padding()
        }
    }
}

struct FlightInfoView_Previews: PreviewProvider {
    static var previews: some View {
        BookingView(tab: "FlightNumber")
    }
}
