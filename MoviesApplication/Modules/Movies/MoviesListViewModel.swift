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

typealias AllMoviesResponseBlock = (Result<AllMovies, ErrorResponse>) -> Void

class MoviesListViewModel {
        
    private var data: AllMovies?
    private var requestData: MoviesRequest?
    private var moviesState: MoviesListViewStateBlock?
    private let moviesFormatter: MoviesListDataFormatterProtocol
    
    init(moviesFormatter: MoviesListDataFormatterProtocol) {
        self.moviesFormatter = moviesFormatter
    }
    
    func subscribeState(completion: @escaping MoviesListViewStateBlock) {
        moviesState = completion
    }
    
    func getNowPlayingMoviesList() {
        moviesState?(.loading)
        do {
            guard let urlRequest = try? NowPlayingApiServiceProvider(request: getMoviesRequest()).returnUrlRequest() else { return }
            fireApiCall(with: urlRequest, with: dataListener)
        }
    }
    
    func getPopularMoviesList() {
        moviesState?(.loading)
        do {
            guard let urlRequest = try? PopularApiServiceProvider(request: getMoviesRequest()).returnUrlRequest() else { return }
            fireApiCall(with: urlRequest, with: dataListener)
        }
    }
    
    private func getMoviesRequest() -> MoviesRequest {
        return MoviesRequest(api_key: requestData?.api_key ?? "f17764a3c10f08fadfab105b3a18f9e9",
                             language: requestData?.language,
                             page: requestData?.page ?? 1)
    }
    
    private func fireApiCall(with request: URLRequest, with completion: @escaping AllMoviesResponseBlock) {
        APIManager.shared.executeRequest(urlRequest: request, completion: completion)
    }
    
    // MARK: - CallBack Listener -
    private func apiCallHandler(from response: AllMovies) {
        moviesFormatter.setData(with: response)
        moviesState?(.done)
    }

    private lazy var dataListener: (Result<AllMovies, ErrorResponse>) -> Void = { [weak self] result in
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
