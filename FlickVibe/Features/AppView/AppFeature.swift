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
        var searchState = SearchFeature.State()
        
        var selectedTab: Tab = .home
        enum Tab {
            case home, search
        }
    }
    
    enum Action: Equatable {
        case homeAction(HomeFeature.Action)
        case searchAction(SearchFeature.Action)
        case selectedTab
    }
    
    var body: some ReducerOf<Self> {
        
        Scope(state: \.homeState, action: /Action.homeAction, child: HomeFeature.init)
        Scope(state: \.searchState, action: /Action.searchAction, child: SearchFeature.init)
        
        Reduce { state, action in
            switch action {
                
            case .homeAction(_):
                return .none
                
            case .searchAction(_):
                return .none
                
            case .selectedTab:
                return .none
            }
        }
    }
}
