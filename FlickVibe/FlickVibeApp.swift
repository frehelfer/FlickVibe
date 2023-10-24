//
//  FlickVibeApp.swift
//  FlickVibe
//
//  Created by Frédéric Helfer on 28/09/23.
//

import ComposableArchitecture
import MainTab
import SwiftUI

@main
struct FlickVibeApp: App {
    
    let store: StoreOf<MainTabFeature>
    
    init() {
        self.store = Store(
            initialState: MainTabFeature.State(),
            reducer: { MainTabFeature()._printChanges() }
        )
    }
    
    var body: some Scene {
        WindowGroup {
            MainTabView(store: store)
        }
    }
}
