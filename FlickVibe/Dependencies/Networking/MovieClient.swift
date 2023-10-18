//
//  MovieClient.swift
//  FlickVibe
//
//  Created by Frédéric Helfer on 18/10/23.
//

import ComposableArchitecture
import Foundation

// MARK: - Interface
struct MovieClient {
    var getTrendingMovies: @Sendable () async throws -> [Movie]
    var getTrendingTVShows: @Sendable () async throws -> [Movie]
}

// MARK: - Dependency implementation
extension DependencyValues {
    var movieClient: MovieClient {
        get { self[MovieClient.self] }
        set { self[MovieClient.self] = newValue }
    }
}

// MARK: - Mock
extension MovieClient: TestDependencyKey {
    static let previewValue: MovieClient = .init(
        getTrendingMovies: { Movie.mockList },
        getTrendingTVShows: { Movie.mockList }
    )
    
    static let testValue: MovieClient = .init(
        getTrendingMovies: { Movie.mockList },
        getTrendingTVShows: { Movie.mockList }
    )
}

// MARK: - Live
extension MovieClient: DependencyKey {
    static let liveValue = MovieClient(
        getTrendingMovies: {
            
            let url = URL(string: "https://api.themoviedb.org/3/trending/movie/day")!
            
            let headers = [
              "accept": "application/json",
              "Authorization": "Bearer \(Constants.accessTokenAuth)"
            ]
            
            var request = URLRequest(url: url)
            request.httpMethod = "GET"
            request.allHTTPHeaderFields = headers
            
            let (data, _) = try await URLSession.shared.data(for: request)
            let decoded = try JSONDecoder().decode(TrendingMovie.self, from: data)
            return decoded.results
        },
        getTrendingTVShows: {
            
            let url = URL(string: "https://api.themoviedb.org/3/trending/tv/day")!
            
            let headers = [
              "accept": "application/json",
              "Authorization": "Bearer \(Constants.accessTokenAuth)"
            ]
            
            var request = URLRequest(url: url)
            request.httpMethod = "GET"
            request.allHTTPHeaderFields = headers
            
            let (data, _) = try await URLSession.shared.data(for: request)
            let decoded = try JSONDecoder().decode(TrendingMovie.self, from: data)
            return decoded.results
        }
    )
}
