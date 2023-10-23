//
//  ApiClientMock.swift
//  FlickVibe
//
//  Created by Frédéric Helfer on 18/10/23.
//

import ComposableArchitecture
import Foundation
import Models

// MARK: - Mock
extension ApiClient: TestDependencyKey {
    public static let previewValue: ApiClient = .init(
        getTrendingMovies: { Movie.mockList },
        getTrendingTVShows: { Movie.mockList }
    )
    
    public static let testValue: ApiClient = .init(
        getTrendingMovies: { Movie.mockList },
        getTrendingTVShows: { Movie.mockList }
    )
}
