//
//  FlyingBlueCoordinator.swift
//  Router
//
//  Created by Bart Bruijnesteijn on 06/04/2020.
//  Copyright © 2020 Bart Bruijnesteijn. All rights reserved.
//

import SwiftUI

struct FlyingBlueCoordinator: View {
    @EnvironmentObject var coordinatorState: CoordinatorState
    
    var body: some View {
        VStack {
            FlyingBlueProfile()
        }
    }
}

#if DEBUG
struct FlyingBlueCoordinator_Previews: PreviewProvider {
    static var previews: some View {
        FlyingBlueCoordinator().environmentObject(CoordinatorState(flow: "", page: "", back: ""))
    }
}
#endif
