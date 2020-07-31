//
//  UpcomingTripsView.swift
//  Coordinator
//
//  Created by Bart Bruijnesteijn on 14/07/2020.
//

import SwiftUI

struct UpcomingTripsView: View {
    @EnvironmentObject var coordinatorState: CoordinatorState
    
    var body: some View {
        NavigationView {
            VStack {
                TripsView(tab: "UpcomingTrips")
                
                Spacer()
                
                Text("Overview upcoming trips")
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
struct UpcomingTripsView_Previews: PreviewProvider {
    static var previews: some View {
        UpcomingTripsView().environmentObject(CoordinatorState(flow: "UpcomingTrips", page: "", back: ""))
    }
}
#endif
