//
//  FIRSelectRouteView.swift
//  CoordinatorPattern
//
//  Created by Bart Bruijnesteijn on 11/06/2020.
//  Copyright © 2020 Bart Bruijnesteijn. All rights reserved.
//

import SwiftUI

struct FIRSelectRouteView: View {
    @EnvironmentObject var coordinatorState: CoordinatorState
    
    var body: some View {
        VStack {
            Text("Select origin & destination airport")
                .frame(width: 300, height: 150)
                .background(Color.rectangleAccentColor)
                .multilineTextAlignment(.center)
                .lineSpacing(10)
                .font(.subheadline)
                .foregroundColor(.labelFontColor)
                .padding()
            
            Button(action: {
                self.coordinatorState.page = "FIRFlightStatus"
            }) {
                Text("Search")
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

struct FIRSelectRouteView_Previews: PreviewProvider {
    static var previews: some View {
        FIRSelectRouteView()
    }
}
