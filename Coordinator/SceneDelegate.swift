//
//  SceneDelegate.swift
//  Router
//
//  Created by Bart Bruijnesteijn on 06/04/2020.
//  Copyright © 2020 Bart Bruijnesteijn. All rights reserved.
//

import UIKit
import SwiftUI
import Combine

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        
        // Create the SwiftUI view that provides the window contents.
        let view = TabBarView(selectedTab: .Book)
        
        // Use a UIHostingController as window root view controller.
        if let windowScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)
            window.rootViewController = UIHostingController(rootView: view.environmentObject(CoordinatorState(flow: "ReturnBooking", page: "RBSelectOriginDestination", back: "")))
            self.window = window
            window.makeKeyAndVisible()
        }
    }
    
    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not neccessarily discarded (see `application:didDiscardSceneSessions` instead).
    }
    
    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }
    
    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }
    
    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }
    
    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }
    
    func scene(_ scene: UIScene, continue userActivity: NSUserActivity) {
//        guard userActivity.activityType == NSUser NSUserActivityTypeBrowsingWeb,
        let urlToOpen = userActivity.webpageURL ?? URL(fileURLWithPath: "klmios://")
 //             let urlToOpen = userActivity.webpageURL //else {
//            return
        //}
        
        handleURL(scene, urlToOpen)
    }
    
    func scene(_ scene: UIScene, openURLContexts URLContexts: Set<UIOpenURLContext>) {
        let urlToOpen = URLContexts.first?.url ?? URL(fileURLWithPath: "klmios://")
        
        self.handleURL(scene, urlToOpen)
    }
    
    func handleURL(_ scene: UIScene, _ url: URL) {
        let urlComponents = NSURLComponents.init(url: url, resolvingAgainstBaseURL: false)
        
        var tab = ""
        var flow = ""
        var page = ""
        
        if  urlComponents != nil {
            if let urlQueryParameters = urlComponents?.queryItems {
                if(url.scheme == "klmios") {
                    for parameter in urlQueryParameters {
                        switch parameter.name {
                        case "tab":
                            tab = parameter.value!
                        case "flow":
                            flow = parameter.value!
                        case "page":
                            page = parameter.value!
                        default:
                            print("no match")
                        }
                    }
                }
            }
        }
        
        var view = TabBarView(selectedTab: .FlighInfo)
        
        switch tab {
        case "Book": view = TabBarView(selectedTab: .Book)
        case "FlightInfo": view = TabBarView(selectedTab: .FlighInfo)
        default: view = TabBarView(selectedTab: .Book)
        }
        
        // Use a UIHostingController as window root view controller.
        if let windowScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)
            window.rootViewController = UIHostingController(rootView: view.environmentObject(CoordinatorState(flow: flow, page: page, back: "")))
            self.window = window
            window.makeKeyAndVisible()
        }
    }
}
