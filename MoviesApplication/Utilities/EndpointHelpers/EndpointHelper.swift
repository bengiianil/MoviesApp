//
//  EndpointHelper.swift
//  MoviesApplication
//
//  Created by Bengi on 24.11.2021.
//

import Foundation

// MARK: - API Endpoints -
typealias BaseUrl = EndpointHelper.BaseUrl
typealias Paths = EndpointHelper.Path

enum EndpointHelper {
                    
    ///https://api.themoviedb.org/3/movie/now_playing?api_key=f17764a3c10f08fadfab105b3a18f9e9

    enum BaseUrl: String {
        case baseUrl = "https://api.themoviedb.org/3/movie"
    }

    enum Path: GenericValueProtocol {
        typealias Value = String
        var value: String {
            switch self {
            case .nowPlaying:
                return "now_playing"
            case .popular:
                return "popular"
            case .topRated:
                return "top_rated"
            case .upcoming:
                return "upcoming"
            }
        }
        case nowPlaying
        case popular
        case topRated
        case upcoming
    }
}
                
