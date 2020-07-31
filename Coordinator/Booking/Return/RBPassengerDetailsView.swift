//
//  RBPassengerDetailsView.swift
//  CoordinatorPattern
//
//  Created by Bart Bruijnesteijn on 10/06/2020.
//  Copyright © 2020 Bart Bruijnesteijn. All rights reserved.
//

import SwiftUI

struct RBPassengerDetailsView: View {
    @EnvironmentObject var coordinatorState: CoordinatorState
    
    var body: some View {
        VStack {
            Text("Passenger details")
                .frame(width: 300, height: 150)
                .background(Color.rectangleAccentColor)
                .multilineTextAlignment(.center)
                .lineSpacing(10)
                .font(.subheadline)
                .foregroundColor(.labelFontColor)
                .padding()
            
            Button(action: {
                //                self.coordinatorState.page = "SelectTravelDates"
            }) {
                Text("Continue to payment")
                    .frame(width: 250, height: 10, alignment: .center)
                    .padding()
                    .font(.headline)
                    .foregroundColor(.buttonFontColor)
                    .background(Color.buttonBackgroundColor)
                    .cornerRadius(30)
            }
        }
    }
}

struct RBPassengerDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        RBSelectOriginDestinationView()
    }
}
