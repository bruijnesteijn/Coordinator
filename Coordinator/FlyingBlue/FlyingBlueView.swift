//
//  FlyingBlueView.swift
//  Coordinator
//
//  Created by Bart Bruijnesteijn on 31/07/2020.
//

import SwiftUI

struct FlyingBlueView: View {
    @EnvironmentObject var coordinatorState: CoordinatorState
    
    let tab: String = ""
    
    var body: some View {
        HStack {
            Text("Flying Blue profile overview")
                .font(.headline)
                .foregroundColor(.lightFontColor)
                .padding()
        }
    }
}

struct FlyingBlueView_Previews: PreviewProvider {
    static var previews: some View {
        FlyingBlueView()
    }
}
