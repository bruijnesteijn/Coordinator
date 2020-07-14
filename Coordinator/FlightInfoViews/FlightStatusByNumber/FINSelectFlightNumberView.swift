//
//  FINSelectFlightNumberView.swift
//  CoordinatorPattern
//
//  Created by Bart Bruijnesteijn on 11/06/2020.
//  Copyright © 2020 Bart Bruijnesteijn. All rights reserved.
//

import SwiftUI

struct FINSelectFlightNumberView: View {
    @EnvironmentObject var coordinatorState: CoordinatorState
    
    var body: some View {
        VStack {
            Text("Select flight number")
                .frame(width: 300, height: 300)
                .background(Color.rectangleAccentColor)
                .multilineTextAlignment(.center)
                .lineSpacing(10)
                .font(.subheadline)
                .foregroundColor(.labelFontColor)
                .padding()
            
            Button(action: {
                self.coordinatorState.page = "FINFlightStatus"
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

struct FINSelectFlightNumberView_Previews: PreviewProvider {
    static var previews: some View {
        FINSelectFlightNumberView()
    }
}
