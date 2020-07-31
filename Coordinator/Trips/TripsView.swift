//
//  TripsView.swift
//  CoordinatorPattern
//
//  Created by Bart Bruijnesteijn on 10/06/2020.
//  Copyright © 2020 Bart Bruijnesteijn. All rights reserved.
//

import SwiftUI

struct TripsView: View {
    @EnvironmentObject var coordinatorState: CoordinatorState
    
    let tab: String
    
    var body: some View {
        HStack {
            Button(action: {
                self.coordinatorState.flow = "NextTrip"
                self.coordinatorState.page = ""
                self.coordinatorState.back = ""
            }) {
                Text("Next trip")
            }
            .font(.headline)
            .foregroundColor(tab == "NextTrip" ? .darkFontColor : .lightFontColor)
            .padding()
            
            Button(action: {
                self.coordinatorState.flow = "UpcomingTrips"
                self.coordinatorState.page = ""
                self.coordinatorState.back = ""
            }) {
                Text("Upcoming")
            }
            .font(.headline)
            .foregroundColor(tab == "UpcomingTrips" ? .darkFontColor : .lightFontColor)
            .padding()
            
            Button(action: {
                self.coordinatorState.flow = "PreviousTrips"
                self.coordinatorState.page = ""
                self.coordinatorState.back = ""
            }) {
                Text("Previous")
            }
            .font(.headline)
            .foregroundColor(tab == "PreviousTrips" ? .darkFontColor : .lightFontColor)
            .padding()
        }
    }
}

struct TripsView_Previews: PreviewProvider {
    static var previews: some View {
        TripsView(tab: "NextTrip")
    }
}
