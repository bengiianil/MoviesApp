//
//  MoviesRequest.swift
//  MoviesApplication
//
//  Created by Bengi on 24.11.2021.
//

import Foundation

// MARK: - API Request Properties -
class MoviesRequest: Codable {
    
    private(set) public var api_key: String = "f17764a3c10f08fadfab105b3a18f9e9"
    private(set) public var language: String?
    private(set) public var page: Int = 1

    public init(api_key: String,
                language: String? = "en-US",
                page: Int = 1) {
        
        self.api_key = api_key
        self.language = language
        self.page = page
    }
}
