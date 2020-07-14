//
//  FINFlightStatusView.swift
//  Router
//
//  Created by Bart Bruijnesteijn on 06/04/2020.
//  Copyright © 2020 Bart Bruijnesteijn. All rights reserved.
//

import SwiftUI

struct FINFlightStatusView: View {
    @EnvironmentObject var coordinatorState: CoordinatorState
    
    var body: some View {
        VStack {
            Text("Flight status information found")
                .frame(width: 300, height: 300)
                .background(Color.rectangleAccentColor)
.multilineTextAlignment(.center)
                .lineSpacing(10)
                .font(.subheadline)
                .foregroundColor(.labelFontColor)
                .padding()
        }
    }
}

#if DEBUG
struct FINFlightStatusView_Previews: PreviewProvider {
    static var previews: some View {
        FINFlightStatusView()
    }
}
#endif
