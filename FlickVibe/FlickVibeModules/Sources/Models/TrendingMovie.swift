//
//  TrendingMovie.swift
//  FlickVibe
//
//  Created by Frédéric Helfer on 28/09/23.
//

import Foundation

public struct TrendingMovie: Codable {
    public let page: Int
    public let results: [Movie]
    public let totalPages: Int
    public let totalResults: Int

    enum CodingKeys: String, CodingKey {
        case page
        case results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}
