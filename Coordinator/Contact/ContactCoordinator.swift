//
//  ContactCoordinator.swift
//  Coordinator
//
//  Created by Bart Bruijnesteijn on 31/07/2020.
//

import SwiftUI

struct ContactCoordinator: View {
    @EnvironmentObject var coordinatorState: CoordinatorState
    
    var body: some View {
        VStack {
            ContactUsView()
        }
    }
}

struct ContactCoordinator_Previews: PreviewProvider {
    static var previews: some View {
        ContactCoordinator()
    }
}
