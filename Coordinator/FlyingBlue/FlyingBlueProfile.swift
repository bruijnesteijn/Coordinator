//
//  FlyingBlueProfile.swift
//  Coordinator
//
//  Created by Bart Bruijnesteijn on 31/07/2020.
//

import SwiftUI

struct FlyingBlueProfile: View {
    @EnvironmentObject var coordinatorState: CoordinatorState
    
    var body: some View {
        NavigationView {
            VStack {
                FlyingBlueView()

                Spacer()
                
                Text("Overview Flying Blue membership, tier level, miles")
                    .frame(width: 300, height: 150)
                    .background(Color.rectangleAccentColor)
                    .multilineTextAlignment(.center)
                    .lineSpacing(10)
                    .font(.subheadline)
                    .foregroundColor(.labelFontColor)
                    .padding()

                Spacer()
            }
                
            .navigationBarTitle("Flying Blue")
        }
    }
}

#if DEBUG
struct FlyingBlueProfile_Previews: PreviewProvider {
    static var previews: some View {
        FlyingBlueProfile().environmentObject(CoordinatorState(flow: "", page: "", back: ""))
    }
}
#endif
