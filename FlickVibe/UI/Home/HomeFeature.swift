//
//  HomeFeature.swift
//  FlickVibe
//
//  Created by Frédéric Helfer on 28/09/23.
//

import ComposableArchitecture
import Foundation

struct HomeFeature: Reducer {
    
    struct State: Equatable {
        var movies: [Movie] = []
    }
    
    enum Action {
        case onAppear
        case movieRequestResult(TrendingMovie)
    }
    
    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
                
            case .onAppear:
                guard state.movies.isEmpty else {
                    return .none
                }
                
                return .run { send in
                    
                    
                    let url = URL(string: "https://api.themoviedb.org/3/trending/movie/day")!
                    var request = URLRequest(url: url)
                    request.httpMethod = "GET"
//                    request.allHTTPHeaderFields = headers
                    
                    let (data, _) = try await URLSession.shared.data(for: request)
                    let decoded = try JSONDecoder().decode(TrendingMovie.self, from: data)
                    
                    await send(.movieRequestResult(decoded))
                }
                
            case .movieRequestResult(let result):
                state.movies = result.results
                return .none
            }
        }
    }
}
