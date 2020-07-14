//
//  OWBSelectOriginDestinationView.swift
//  CoordinatorPattern
//
//  Created by Bart Bruijnesteijn on 14/06/2020.
//  Copyright © 2020 Bart Bruijnesteijn. All rights reserved.
//

import SwiftUI

struct OWBSelectOriginDestinationView: View {
    @EnvironmentObject var coordinatorState: CoordinatorState
    
    var body: some View {
        VStack {
            Text("Select origin, destination & number of passengers")
                .frame(width: 300, height: 300)
                .background(Color.rectangleAccentColor)
                .multilineTextAlignment(.center)
                .lineSpacing(10)
                .font(.subheadline)
                .foregroundColor(.labelFontColor)
                .padding()
            
            Button(action: {
                self.coordinatorState.page = "OWBSelectTravelDate"
            }) {
                Text("Select travel dates")
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

struct OWBSelectOriginDestinationView_Previews: PreviewProvider {
    static var previews: some View {
        OWBSelectOriginDestinationView()
    }
}
