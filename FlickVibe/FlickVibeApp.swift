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
    var body: some Scene {
        WindowGroup {
            HomeView(store: Store(initialState: HomeFeature.State()) {
                HomeFeature()
                    ._printChanges()
            })
        }
    }
}
