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
    
    let store: StoreOf<AppFeature>
    
    init() {
        self.store = Store(
            initialState: AppFeature.State(),
            reducer: { AppFeature() }
        )
    }
    
    var body: some Scene {
        WindowGroup {
            AppView(store: store)
        }
    }
}
