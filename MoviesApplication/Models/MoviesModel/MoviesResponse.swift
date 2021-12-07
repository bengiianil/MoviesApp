//
//  MoviesResponse.swift
//  MoviesApplication
//
//  Created by Bengi on 23.10.2021.
//

import Foundation

struct NowPlayingMovies: Codable {
    let page: Int?
    let results: [ApiResult]

    init(page: Int?, results: [ApiResult]) {
        self.page = page
        self.results = results
    }
}

// MARK: - Dates
struct Dates: Codable {
    let maximum, minimum: String?
}

// MARK: - Result
struct ApiResult: Codable {
    let originalTitle, overview: String?

    enum CodingKeys: String, CodingKey {
        case originalTitle = "original_title"
        case overview
    }
}

/*
// MARK: - NowPlayingMovies
struct NowPlayingMovies: Codable {
    let dates: Dates?
    let page: Int?
    let results: [ApiResult]
    let totalPages, totalResults: Int?

    enum CodingKeys: String, CodingKey {
        case dates, page, results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}

// MARK: - Dates
struct Dates: Codable {
    let maximum, minimum: String?
}

// MARK: - Result
struct ApiResult: Codable {
    let adult: Bool?
    let backdropPath: String?
    let genreIDS: [Int]?
    let id: Int?
    let originalLanguage: OriginalLanguage?
    let originalTitle, overview: String?
    let popularity: Double?
    let posterPath, releaseDate, title: String?
    let video: Bool?
    let voteAverage: Double?
    let voteCount: Int?

    enum CodingKeys: String, CodingKey {
        case adult
        case backdropPath = "backdrop_path"
        case genreIDS = "genre_ids"
        case id
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case overview, popularity
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case title, video
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
}

enum OriginalLanguage: String, Codable {
    case en = "en"
    case ja = "ja"
    case tr = "tr"
}
*/
