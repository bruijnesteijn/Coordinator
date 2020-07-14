//
//  TabBarView.swift
//  TabBarView
//
//  Created by Bart Bruijnesteijn on 06/04/2020.
//  Copyright © 2020 Bart Bruijnesteijn. All rights reserved.
//

import SwiftUI

struct TabBarView: View {
    @EnvironmentObject var coordinatorState: CoordinatorState
    
    @State var selectedTab: Tab
    
    var body: some View {
        TabView(selection: $selectedTab) {
            BookingCoordinator()
                .tabItem {
                    Image("search").renderingMode(.template)
                    Text("Book")
            }
            .tag(Tab.Book)
            
            FlightInfoCoordinator()
                 .tabItem {
                    Image("clock").renderingMode(.template)
                    Text("Flight info")
            }
            .tag(Tab.FlighInfo)
        }.accentColor(Color.tabBarAccentColor)
    }
}

extension TabBarView {
    enum Tab: Hashable {
        case Book
        case FlighInfo
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView(selectedTab: .Book)
    }
}
