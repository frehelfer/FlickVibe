//
//  ApiClientLive.swift
//  FlickVibe
//
//  Created by Frédéric Helfer on 18/10/23.
//

import ComposableArchitecture
import DesignSystem
import Foundation
import Models

extension ApiClient: DependencyKey {
    public static let liveValue = ApiClient(
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
