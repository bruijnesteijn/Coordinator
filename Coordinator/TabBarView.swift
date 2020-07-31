//
//  VerkeerslesApp.swift
//  TabBarView
//
//  Created by Bart Bruijnesteijn on 06/04/2020.
//  Copyright © 2020 Bart Bruijnesteijn. All rights reserved.
//

import SwiftUI

@main
struct VerkeerslesApp: App {
    @EnvironmentObject var coordinatorState: CoordinatorState
    
    @State private var selectedTab = TabIdentifier.book
    
    var body: some Scene {
        WindowGroup {
            TabView(selection: $selectedTab) {
                BookingCoordinator().environmentObject(CoordinatorState(flow: "", page: "", back: ""))
                    .tabItem {
                        Image(systemName: "magnifyingglass").renderingMode(.template)
                        Text("Book")
                    }
                    .tag(TabIdentifier.book)
                
                FlightInfoCoordinator().environmentObject(CoordinatorState(flow: "", page: "", back: ""))
                    .tabItem {
                        Image(systemName: "clock").renderingMode(.template)
                        Text("Flight info")
                    }
                    .tag(TabIdentifier.flightInfo)
                
                TripsCoordinator().environmentObject(CoordinatorState(flow: "", page: "", back: ""))
                    .tabItem {
                        Image(systemName: "airplane").renderingMode(.template)
                        Text("My Trips")
                    }
                    .tag(TabIdentifier.myTrips)
                
                FlyingBlueCoordinator().environmentObject(CoordinatorState(flow: "", page: "", back: ""))
                    .tabItem {
                        Image(systemName: "rosette").renderingMode(.template)
                        Text("Flying Blue")
                    }
                    .tag(TabIdentifier.flyingBlue)
                
                ContactCoordinator().environmentObject(CoordinatorState(flow: "", page: "", back: ""))
                    .tabItem {
                        Image(systemName: "message").renderingMode(.template)
                        Text("Contact")
                    }
                    .tag(TabIdentifier.contact)
            }
            .accentColor(Color.tabBarAccentColor)
            
            .onOpenURL { url in
                guard let tabIdentifier = url.tabIdentifier else {
                  return
                }

                selectedTab = tabIdentifier
            }
            
            .onAppear {
                let appearance = UINavigationBarAppearance()
                appearance.configureWithOpaqueBackground()
                appearance.backgroundColor = UIColor(.accentColor)
                
                appearance.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
                appearance.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
                
                UINavigationBar.appearance().standardAppearance = appearance
                UINavigationBar.appearance().compactAppearance = appearance
                UINavigationBar.appearance().scrollEdgeAppearance = appearance
            }
        }
    }
}

enum TabIdentifier: Hashable {
    case book, flightInfo, myTrips, flyingBlue, contact
}

extension URL {
    var isDeeplink: Bool {
        return scheme == "coordinator"
    }
    
    var tabIdentifier: TabIdentifier? {
        guard isDeeplink else { return nil }
        
        switch host {
        case "book": return .book
        case "flightInfo": return .flightInfo
        case "myTrips": return .myTrips
        case "flyingBlue": return .flyingBlue
        case "contact": return .contact
        default: return .book
        }
    }
}
