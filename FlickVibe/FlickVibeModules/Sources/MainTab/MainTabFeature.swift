//
//  MainTabFeature.swift
//  FlickVibe
//
//  Created by Frédéric Helfer on 18/10/23.
//

import ComposableArchitecture
import Foundation
import Home
import Search

public struct MainTabFeature: Reducer {
    
    public struct State: Equatable {
        var homeState = HomeFeature.State()
        var searchState = SearchFeature.State()
        
        @BindingState var selectedTab: Tab = .home
        public enum Tab {
            case home, search
        }
        
        public init() {}
    }
    
    public enum Action: Equatable, BindableAction {
        case binding(BindingAction<State>)
        
        case homeAction(HomeFeature.Action)
        case searchAction(SearchFeature.Action)
    }
    
    public init() {}
    
    public var body: some ReducerOf<Self> {
        
        BindingReducer()
        
        Scope(state: \.homeState, action: /Action.homeAction, child: HomeFeature.init)
        Scope(state: \.searchState, action: /Action.searchAction, child: SearchFeature.init)
        
        Reduce { state, action in
            switch action {
            case .binding:
                return .none
                
            case .homeAction(_):
                return .none
                
            case .searchAction(_):
                return .none
            }
        }
    }
}
