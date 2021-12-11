//
//  PopularApiServiceProvider.swift
//  MoviesApplication
//
//  Created by Bengi Anıl on 11.12.2021.
//

import Foundation
import DefaultNetworkOperationPackage

class PopularApiServiceProvider: ApiServiceProvider<MoviesRequest> {
        
    init(request: MoviesRequest) {
        super.init(method: .get,
                   baseUrl: BaseUrl.baseUrl.rawValue,
                   path: Paths.popular.value,
                   data: request)
    }
}
