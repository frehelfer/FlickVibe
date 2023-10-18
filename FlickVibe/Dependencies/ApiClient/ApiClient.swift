//
//  MovieClient.swift
//  FlickVibe
//
//  Created by Frédéric Helfer on 18/10/23.
//

import ComposableArchitecture
import Foundation

// MARK: - Interface
struct ApiClient {
    var getTrendingMovies: @Sendable () async throws -> [Movie]
    var getTrendingTVShows: @Sendable () async throws -> [Movie]
}

// MARK: - Dependency implementation
extension DependencyValues {
    var apiClient: ApiClient {
        get { self[ApiClient.self] }
        set { self[ApiClient.self] = newValue }
    }
}
