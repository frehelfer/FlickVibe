//
//  MovieClient.swift
//  FlickVibe
//
//  Created by Frédéric Helfer on 18/10/23.
//

import ComposableArchitecture
import Foundation
import Models

// MARK: - Interface
public struct ApiClient {
    public var getTrendingMovies: @Sendable () async throws -> [Movie]
    public var getTrendingTVShows: @Sendable () async throws -> [Movie]
}

// MARK: - Dependency implementation
extension DependencyValues {
    public var apiClient: ApiClient {
        get { self[ApiClient.self] }
        set { self[ApiClient.self] = newValue }
    }
}
