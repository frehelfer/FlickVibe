//
//  SearchFeature.swift
//  FlickVibe
//
//  Created by Frédéric Helfer on 18/10/23.
//

import ComposableArchitecture
import Foundation

public struct SearchFeature: Reducer {
    
    public struct State: Equatable {
        
        
        public init() {}
    }
    
    public enum Action: Equatable {
        
    }
    
    public init() {}
    
    public var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
                
            }
        }
    }
}
