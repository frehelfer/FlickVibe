//
//  AppView.swift
//  FlickVibe
//
//  Created by Frédéric Helfer on 18/10/23.
//

import ComposableArchitecture
import SwiftUI

struct AppView: View {
    let store: StoreOf<AppFeature>
    
    // to observe just the tab selected
    struct ViewState: Equatable {
        let selectedTab: AppFeature.State.Tab
        init(state: AppFeature.State) {
            self.selectedTab = state.selectedTab
        }
    }
    
    var body: some View {
        WithViewStore(self.store, observe: ViewState.init) { viewStore in
            TabView(
                selection: viewStore.binding(
                    get: \.selectedTab,
                    send: AppFeature.Action.selectedTab
                )
            ) {
                
                Group {
                    HomeView(
                        store: self.store.scope(
                            state: \.homeState,
                            action: AppFeature.Action.homeAction
                        )
                    )
                    .tabItem {
                        Label("Home", systemImage: "house")
                    }
                    .tag(AppFeature.State.Tab.home)
                    
                    SearchView(
                        store: self.store.scope(
                            state: \.searchState,
                            action: AppFeature.Action.searchAction
                        )
                    )
                    .tabItem {
                        Label("Search", systemImage: "magnifyingglass")
                    }
                    .tag(AppFeature.State.Tab.search)
                }
                .toolbarBackground(.black, for: .tabBar)
                .toolbarBackground(.visible, for: .tabBar)
            }
        }
    }
}

#Preview {
    AppView(
        store: Store(
            initialState: AppFeature.State(),
            reducer: { AppFeature() },
            withDependencies: { $0.apiClient = .liveValue }
        )
    )
}
