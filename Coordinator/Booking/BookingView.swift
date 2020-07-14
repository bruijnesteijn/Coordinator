//
//  BookingView.swift
//  CoordinatorPattern
//
//  Created by Bart Bruijnesteijn on 10/06/2020.
//  Copyright © 2020 Bart Bruijnesteijn. All rights reserved.
//

import SwiftUI

struct BookingView: View {
    @EnvironmentObject var coordinatorState: CoordinatorState
    
    let tab: String
    
    var body: some View {
        HStack {
            Button(action: {
                self.coordinatorState.flow = "ReturnBooking"
                self.coordinatorState.page = "RBSelectOriginDestination"
                self.coordinatorState.back = ""
            }) {
                Text("Return")
            }
            .font(.headline)
            .foregroundColor(tab == "ReturnBooking" ? .darkFontColor : .lightFontColor)
            .padding()
            
            Button(action: {
                self.coordinatorState.flow = "OneWayBooking"
                self.coordinatorState.page = ""
                self.coordinatorState.back = ""
            }) {
                Text("One way")
            }
            .font(.headline)
            .foregroundColor(tab == "OneWayBooking" ? .darkFontColor : .lightFontColor)
            .padding()
            
            Button(action: {
                self.coordinatorState.flow = "MultiCityBooking"
                self.coordinatorState.page = ""
                self.coordinatorState.back = ""
            }) {
                Text("Multi city")
            }
            .font(.headline)
            .foregroundColor(tab == "MultiCityBooking" ? .darkFontColor : .lightFontColor)
            .padding()
        }
    }
}

struct BookingView_Previews: PreviewProvider {
    static var previews: some View {
        BookingView(tab: "ReturnBooking")
    }
}
