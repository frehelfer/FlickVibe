//
//  Movie.swift
//  FlickVibe
//
//  Created by Frédéric Helfer on 28/09/23.
//

import Foundation

struct Movie: Codable, Equatable, Identifiable {
    let adult: Bool
    let backdropPath: String?
    let id: Int
    let title: String
    let originalLanguage: String
    let originalTitle: String
    let overview: String
    let posterPath: String?
    let mediaType: String
    let genreIds: [Int]
    let popularity: Double
    let releaseDate: String
    let video: Bool
    let voteAverage: Double
    let voteCount: Int
    
    enum CodingKeys: String, CodingKey {
        case adult
        case backdropPath = "backdrop_path"
        case id
        case title
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case overview
        case posterPath = "poster_path"
        case mediaType = "media_type"
        case genreIds = "genre_ids"
        case popularity
        case releaseDate = "release_date"
        case video
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
}

// MARK: - Mocks
extension Movie {
    
    static let mock = Movie(
        adult: false,
        backdropPath: "/xFYpUmB01nswPgbzi8EOCT1ZYFu.jpg",
        id: 980489,
        title: "Gran Turismo",
        originalLanguage: "en",
        originalTitle: "Gran Turismo",
        overview: "The ultimate wish-fulfillment tale of a teenage Gran Turismo player whose gaming skills won him a series of Nissan competitions to become an actual professional racecar driver.",
        posterPath: "/51tqzRtKMMZEYUpSYkrUE7v9ehm.jpg",
        mediaType: "movie",
        genreIds: [28, 18, 12],
        popularity: 697.78,
        releaseDate: "2023-08-09",
        video: false,
        voteAverage: 7.771,
        voteCount: 460
    )
    
    static let mock2 = Movie(
        adult: false,
        backdropPath: "/dS4JR8gmj8UnamjuLEyAkEFoppy.jpg",
        id: 923939,
        title: "The Wonderful Story of Henry Sugar",
        originalLanguage: "en",
        originalTitle: "The Wonderful Story of Henry Sugar",
        overview: "A rich man learns about a guru who can see without using his eyes. He sets out to master the skill in order to cheat at gambling.",
        posterPath: "/A4LTXT8MMZIr4aIwhE4qbGFivBo.jpg",
        mediaType: "movie",
        genreIds: [35, 12, 14],
        popularity: 49.2,
        releaseDate: "2023-09-20",
        video: false,
        voteAverage: 7.638,
        voteCount: 58
    )
    
    static let mock3 = Movie(
        adult: false,
        backdropPath: "/efro4duB7agkA2Xl5LmkD3HeCim.jpg",
        id: 818511,
        title: "Overhaul",
        originalLanguage: "pt",
        originalTitle: "Carga Máxima",
        overview: "When truck racer Roger loses everything, he receives a tempting but dangerous offer: to work as the getaway driver for a gang of thieves.",
        posterPath: "/uTKYiQeniYWvFnAc0q1Pb4Gr2DK.jpg",
        mediaType: "movie",
        genreIds: [28, 53, 18],
        popularity: 38.3,
        releaseDate: "2023-09-27",
        video: false,
        voteAverage: 7.375,
        voteCount: 8
    )
    
    static let mockList = [
        Movie.mock,
        Movie.mock2,
        Movie.mock3
    ]
    
}
