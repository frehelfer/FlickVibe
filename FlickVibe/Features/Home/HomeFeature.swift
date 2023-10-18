//
//  HomeFeature.swift
//  FlickVibe
//
//  Created by Frédéric Helfer on 28/09/23.
//

import ComposableArchitecture
import Foundation

struct HomeFeature: Reducer {
    @Dependency(\.apiClient) var apiClient
    
    struct State: Equatable {
        var movies: IdentifiedArrayOf<Movie> = []
    }
    
    enum Action: Equatable {
        case onAppear
        case movieRequestResult(TaskResult<[Movie]>)
    }
    
    var body: some ReducerOf<Self> {
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
