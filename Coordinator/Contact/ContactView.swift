//
//  ContactView.swift
//  Coordinator
//
//  Created by Bart Bruijnesteijn on 31/07/2020.
//

import SwiftUI

struct ContactView: View {
    @EnvironmentObject var coordinatorState: CoordinatorState
    
    let tab: String = ""
    
    var body: some View {
        HStack {
            Text("Contact us options")
                .font(.headline)
                .foregroundColor(.lightFontColor)
                .padding()
        }
    }
}

struct ContactView_Previews: PreviewProvider {
    static var previews: some View {
        ContactView()
    }
}
