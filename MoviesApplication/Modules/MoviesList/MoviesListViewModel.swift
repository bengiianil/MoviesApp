//
//  MoviesListViewModel.swift
//  MoviesApplication
//
//  Created by Bengi on 23.10.2021.
//

import Foundation
import UIKit
import DefaultNetworkOperationPackage
import SwiftUI

typealias NowPlayingResponseBlock = (Result<NowPlayingMovies, ErrorResponse>) -> Void

class MoviesListViewModel {
        
    private var data: NowPlayingMovies?
    private var requestData: MoviesRequest?
    private var moviesState: MoviesListViewStateBlock?
    private let moviesFormatter: MoviesListDataFormatterProtocol
    
    init(moviesFormatter: MoviesListDataFormatterProtocol) {
        self.moviesFormatter = moviesFormatter
    }
    
    func subscribeState(completion: @escaping MoviesListViewStateBlock) {
        moviesState = completion
    }
    
    func getMoviesList() {
        moviesState?(.loading)
        do {
            guard let urlRequest = try? MoviesApiServiceProvider(request: getMoviesRequest()).returnUrlRequest() else { return }
            fireApiCall(with: urlRequest, with: dataListener)
        }
    }
    
    private func getMoviesRequest() -> MoviesRequest {
        return MoviesRequest(api_key: requestData?.api_key ?? "f17764a3c10f08fadfab105b3a18f9e9",
                             language: requestData?.language,
                             page: requestData?.page ?? 1)
    }
    
    private func fireApiCall(with request: URLRequest, with completion: @escaping NowPlayingResponseBlock) {
        APIManager.shared.executeRequest(urlRequest: request, completion: completion)
    }
    
    // MARK: - CallBack Listener -
    private func apiCallHandler(from response: NowPlayingMovies) {
        moviesFormatter.setData(with: response)
        moviesState?(.done)
    }

    private lazy var dataListener: (Result<NowPlayingMovies, ErrorResponse>) -> Void = { [weak self] result in
        switch result {
        case .failure(let error):
            print("error : \(error)")
        case .success(let response):
            self?.apiCallHandler(from: response)
        }
    }
    
}

extension MoviesListViewModel: ItemProviderProtocol {
    
    func getNumberOfSection() -> Int {
        return moviesFormatter.getNumberOfSection()
    }
    
    func getNumberOfItem(in section: Int) -> Int {
        return moviesFormatter.getNumberOfItem(in: section)
    }
    
    func getData(at index: Int) -> GenericDataProtocol? {
        return moviesFormatter.getItem(at: index)
    }
}
