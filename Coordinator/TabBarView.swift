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
                    Image(systemName: "magnifyingglass").renderingMode(.template)
                    Text("Book")
            }
            .tag(Tab.Book)
            
            FlightInfoCoordinator()
                 .tabItem {
                    Image(systemName: "clock").renderingMode(.template)
                    Text("Flight info")
            }
            .tag(Tab.FlighInfo)
            
            TripsCoordinator()
                 .tabItem {
                    Image(systemName: "airplane").renderingMode(.template)
                    Text("My Trips")
            }
            .tag(Tab.Trips)
            
            TripsCoordinator()
                 .tabItem {
                    Image(systemName: "rosette").renderingMode(.template)
                    Text("My Trips")
            }
            .tag(Tab.Trips)
            
            TripsCoordinator()
                 .tabItem {
                    Image(systemName: "message").renderingMode(.template)
                    Text("My Trips")
            }
            .tag(Tab.Trips)
        }.accentColor(Color.tabBarAccentColor)
    }
}

extension TabBarView {
    enum Tab: Hashable {
        case Book
        case FlighInfo
        case Trips
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView(selectedTab: .Book)
    }
}
