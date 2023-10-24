//
//  MainTabView.swift
//  FlickVibe
//
//  Created by Frédéric Helfer on 18/10/23.
//

import ComposableArchitecture
import SwiftUI
import Home
import Search

public struct MainTabView: View {
    let store: StoreOf<MainTabFeature>
    
    public init(store: StoreOf<MainTabFeature>) {
        self.store = store
    }
    
    struct ViewState: Equatable {
        @BindingViewState var selectedTab: MainTabFeature.State.Tab
        
        init(bindingViewStore: BindingViewStore<MainTabFeature.State>) {
            self._selectedTab = bindingViewStore.$selectedTab
        }
    }
    
    public var body: some View {
        WithViewStore(self.store, observe: ViewState.init) { viewStore in
            TabView(selection: viewStore.$selectedTab) {
                Group {
                    HomeView(
                        store: self.store.scope(
                            state: \.homeState,
                            action: MainTabFeature.Action.homeAction
                        )
                    )
                    .tabItem {
                        Label("Home", systemImage: "house")
                    }
                    .tag(MainTabFeature.State.Tab.home)
                    
                    SearchView(
                        store: self.store.scope(
                            state: \.searchState,
                            action: MainTabFeature.Action.searchAction
                        )
                    )
                    .tabItem {
                        Label("Search", systemImage: "magnifyingglass")
                    }
                    .tag(MainTabFeature.State.Tab.search)
                }
                .toolbarBackground(.black, for: .tabBar)
                .toolbarBackground(.visible, for: .tabBar)
            }
        }
    }
}

#Preview {
    MainTabView(
        store: Store(
            initialState: MainTabFeature.State(),
            reducer: { MainTabFeature()._printChanges() }
        )
    )
}
