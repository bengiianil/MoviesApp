//
//  MoviesResponse.swift
//  MoviesApplication
//
//  Created by Bengi on 23.10.2021.
//

import Foundation

struct AllMovies: Codable {
    let page: Int?
    let results: [ApiResult]

    init(page: Int?, results: [ApiResult]) {
        self.page = page
        self.results = results
    }
}

// MARK: - Result
struct ApiResult: Codable {
    let backdropPath, originalTitle, overview: String?
    var backdropURL: String {
        return "https://image.tmdb.org/t/p/w500\(backdropPath ?? "")"
    }
    
    enum CodingKeys: String, CodingKey {
        case backdropPath = "backdrop_path"
        case originalTitle = "original_title"
        case overview
    }
}
