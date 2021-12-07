//
//  MoviesApiServiceProvider.swift
//  MoviesApplication
//
//  Created by Bengi on 23.10.2021.
//

import Foundation
import DefaultNetworkOperationPackage

class MoviesApiServiceProvider: ApiServiceProvider<MoviesRequest> {
        
    init(request: MoviesRequest) {
        super.init(method: .get,
                   baseUrl: BaseUrl.baseUrl.rawValue,
                   path: Paths.nowPlaying.value,
                   data: request)
    }
}
