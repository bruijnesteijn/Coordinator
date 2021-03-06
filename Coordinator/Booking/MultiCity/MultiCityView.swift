//
//  MCBView.swift
//  Router
//
//  Created by Bart Bruijnesteijn on 06/04/2020.
//  Copyright © 2020 Bart Bruijnesteijn. All rights reserved.
//

import SwiftUI

struct MCBView: View {
    @EnvironmentObject var coordinatorState: CoordinatorState
    
    var body: some View {
        NavigationView {
            VStack {
                BookingView(tab: "MultiCityBooking")

                Spacer()
                Spacer()
                
                Text("Create multi-city booking")
                    .frame(width: 300, height: 150)
                    .background(Color.rectangleAccentColor)
                    .multilineTextAlignment(.center)
                    .lineSpacing(10)
                    .font(.subheadline)
                    .foregroundColor(.labelFontColor)
                    .padding()

                Spacer()            }
                
            .navigationBarTitle("Book a trip")
        }
    }
}

#if DEBUG
struct MCBView_Previews: PreviewProvider {
    static var previews: some View {
        MCBView().environmentObject(CoordinatorState(flow: "MultiCityBooking", page: "", back: ""))
    }
}
#endif
