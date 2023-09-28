//
//  HomeFeature.swift
//  FlickVibe
//
//  Created by Frédéric Helfer on 28/09/23.
//

import ComposableArchitecture
import Foundation

struct HomeFeature: Reducer {
    
    struct State {
        
    }
    
    enum Action {
        case onAppear
    }
    
    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
                
            case .onAppear:
                return .none
                
            }
        }
    }
}
