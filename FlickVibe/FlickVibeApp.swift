//
//  FlickVibeApp.swift
//  FlickVibe
//
//  Created by Frédéric Helfer on 28/09/23.
//

import ComposableArchitecture
import SwiftUI

@main
struct FlickVibeApp: App {
    
    let store: StoreOf<HomeFeature>
    
    init() {
        self.store = Store(
            initialState: HomeFeature.State(),
            reducer: { HomeFeature() }
        )
    }
    
    var body: some Scene {
        WindowGroup {
            HomeView(store: store)
        }
    }
}
