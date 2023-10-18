//
//  AppFeature.swift
//  FlickVibe
//
//  Created by Frédéric Helfer on 18/10/23.
//

import ComposableArchitecture
import Foundation

struct AppFeature: Reducer {
    
    struct State: Equatable {
        var homeState = HomeFeature.State()
        var searchState = HomeFeature.State()
        
        var selectedTab: Tab = .home
        enum Tab {
            case home, search
        }
    }
    
    enum Action: Equatable {
        case homeAction(HomeFeature.Action)
        case search
        case selectedTab
    }
    
    var body: some ReducerOf<Self> {
        
        Reduce { state, action in
            switch action {
            case .homeAction:
                return .none
            case .search:
                return .none
            case .selectedTab:
                return .none
            }
        }
    }
}
