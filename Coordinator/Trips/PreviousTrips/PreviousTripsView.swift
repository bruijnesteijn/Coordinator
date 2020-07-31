//
//  PreviousTripsView.swift
//  Coordinator
//
//  Created by Bart Bruijnesteijn on 14/07/2020.
//

import SwiftUI

struct PreviousTripsView: View {
    @EnvironmentObject var coordinatorState: CoordinatorState
    
    var body: some View {
        NavigationView {
            VStack {
                TripsView(tab: "PreviousTrips")
                
                Spacer()
                
                Text("Overview previous trips")
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
struct PreviousTripsView_Previews: PreviewProvider {
    static var previews: some View {
        PreviousTripsView().environmentObject(CoordinatorState(flow: "PreviousTrips", page: "", back: ""))
    }
}
#endif
