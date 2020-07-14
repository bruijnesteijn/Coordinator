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
            }
                
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
