//
//  NextTripView.swift
//  Coordinator
//
//  Created by Bart Bruijnesteijn on 14/07/2020.
//

import SwiftUI

struct NextTripView: View {
    @EnvironmentObject var coordinatorState: CoordinatorState
    
    var body: some View {
        NavigationView {
            VStack {
                TripsView(tab: "NextTrip")
                
                Spacer()
                
                Text("Overview next trips")
                    .frame(width: 300, height: 150)
                    .background(Color.rectangleAccentColor)
                    .multilineTextAlignment(.center)
                    .lineSpacing(10)
                    .font(.subheadline)
                    .foregroundColor(.labelFontColor)
                    .padding()

                Spacer()            }
                
            .navigationBarTitle("My Trip")
        }
    }
}

#if DEBUG
struct NextTripView_Previews: PreviewProvider {
    static var previews: some View {
        NextTripView().environmentObject(CoordinatorState(flow: "NextTrip", page: "", back: ""))
    }
}
#endif
