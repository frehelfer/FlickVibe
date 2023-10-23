//
//  HomeFeature.swift
//  FlickVibe
//
//  Created by Frédéric Helfer on 28/09/23.
//

import ComposableArchitecture
import Foundation
import Models

public struct HomeFeature: Reducer {
    @Dependency(\.apiClient) var apiClient
    
    public struct State: Equatable {
        public var movies: IdentifiedArrayOf<Movie> = []
        
        public init() {}
    }
    
    public enum Action: Equatable {
        case onAppear
        case movieRequestResult(TaskResult<[Movie]>)
    }
    
    public init() {}
    
    public var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
                
            case .onAppear:
                guard state.movies.isEmpty else {
                    return .none
                }
                return .run { send in
                    await send(.movieRequestResult(TaskResult { try await apiClient.getTrendingMovies() }))
                }
                
            case let .movieRequestResult(.success(response)):
                state.movies = IdentifiedArray(uniqueElements: response)
                return .none
                
            case let .movieRequestResult(.failure(error)):
                print(error)
                return .none
            }
        }
    }
}
