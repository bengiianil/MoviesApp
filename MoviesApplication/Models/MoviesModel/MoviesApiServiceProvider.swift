//
//  MoviesApiServiceProvider.swift
//  MoviesApplication
//
//  Created by Bengi on 23.10.2021.
//

import Foundation
import DefaultNetworkOperationPackage

class MoviesApiServiceProvider: ApiServiceProvider<BaseRequest> {
    
    static let url = "https://api.themoviedb.org/3/movie/upcoming?api_key=f17764a3c10f08fadfab105b3a18f9e9"
    
    init() {
        super.init(method: .get, baseUrl: Self.url)
    }
    
}
