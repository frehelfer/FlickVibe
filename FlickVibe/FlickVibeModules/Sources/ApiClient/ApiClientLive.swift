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
            let request = makeUrlRequest(endpoint: .trendingMovies)
            let decoded = try await performAPIRequest(request: request, responseType: TrendingMovie.self)
            return decoded.results
        },
        getTrendingTVShows: {
            let request = makeUrlRequest(endpoint: .trendingTVShows)
            let decoded = try await performAPIRequest(request: request, responseType: TrendingMovie.self)
            return decoded.results
        }
    )
    
    // MARK: - Methods
    private static func performAPIRequest<T: Decodable>(request: URLRequest, responseType: T.Type) async throws -> T {
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard
            let httpResponse = response as? HTTPURLResponse,
            (200...299).contains(httpResponse.statusCode) 
        else {
            throw URLError(.badServerResponse)
        }
        
        return try JSONDecoder().decode(responseType.self, from: data)
    }
    
    private static func makeUrlRequest(endpoint: Endpoint) -> URLRequest {
        let url = endpoint.url
        
        let headers = [
          "accept": "application/json",
          "Authorization": "Bearer \(Constants.accessTokenAuth)"
        ]
        
        var request = URLRequest(url: url)
        request.httpMethod = HTTPMethod.get.rawValue
        request.allHTTPHeaderFields = headers
        
        return request
    }
    
    private enum HTTPMethod: String {
        case get = "GET"
        case post = "POST"
    }
    
    private enum Endpoint {
        case trendingMovies
        case trendingTVShows
        
        var url: URL {
            let baseURL = "https://api.themoviedb.org/3"
            let path: String
            
            switch self {
            case .trendingMovies:
                path = "/trending/movie/day"
            case .trendingTVShows:
                path = "/trending/tv/day"
            }
            
            return URL(string: baseURL + path)!
        }
    }
}
