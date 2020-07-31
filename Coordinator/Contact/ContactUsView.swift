//
//  ContactUsView.swift
//  Coordinator
//
//  Created by Bart Bruijnesteijn on 31/07/2020.
//

import SwiftUI

struct ContactUsView: View {
    @EnvironmentObject var coordinatorState: CoordinatorState
    
    var body: some View {
        NavigationView {
            VStack {
                ContactView()

                Spacer()
                
                Text("Overview of options to contact us")
                    .frame(width: 300, height: 150)
                    .background(Color.rectangleAccentColor)
                    .multilineTextAlignment(.center)
                    .lineSpacing(10)
                    .font(.subheadline)
                    .foregroundColor(.labelFontColor)
                    .padding()

                Spacer()
            }
                
            .navigationBarTitle("Contact us")
        }
    }
}

#if DEBUG
struct ContactUsView_Previews: PreviewProvider {
    static var previews: some View {
        ContactUsView().environmentObject(CoordinatorState(flow: "", page: "", back: ""))
    }
}
#endif
