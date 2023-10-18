//
//  ApiClientMock.swift
//  FlickVibe
//
//  Created by Frédéric Helfer on 18/10/23.
//

import ComposableArchitecture
import Foundation

// MARK: - Mock
extension ApiClient: TestDependencyKey {
    static let previewValue: ApiClient = .init(
        getTrendingMovies: { Movie.mockList },
        getTrendingTVShows: { Movie.mockList }
    )
    
    static let testValue: ApiClient = .init(
        getTrendingMovies: { Movie.mockList },
        getTrendingTVShows: { Movie.mockList }
    )
}
