//
//  MoviesListViewModel.swift
//  MoviesApplication
//
//  Created by Bengi on 23.10.2021.
//

import Foundation
import UIKit
import DefaultNetworkOperationPackage

typealias NowPlayingResponseBlock = (Result<NowPlayingMoviesResponse, ErrorResponse>) -> Void

class MoviesListViewModel {
        
    private var moviesApiData: [NowPlayingMovies]?
    
    private var state: MoviesListViewStateBlock?
    func subscribeState(completion: @escaping MoviesListViewStateBlock) {
        state = completion
    }
    
    func getMoviesList() {
        fireApiCall(with: apiCallHandler)
    }
    
    private func fireApiCall(with completion: @escaping NowPlayingResponseBlock) {
                   
        do {
            let urlRequest = try MoviesApiServiceProvider().returnUrlRequest()
            APIManager.shared.executeRequest(urlRequest: urlRequest, completion: completion)
        } catch let error {
            print("error : \(error)")
        }
    }
    
    private lazy var apiCallHandler: NowPlayingResponseBlock = { [weak self] result in
         switch result {
         case .failure(let error):
             print("error : \(error)")
         case .success(let response):
            print("success: \(response)")
             self?.moviesApiData = response
         }
        self?.state?(.done)
    }
}

extension MoviesListViewModel: CustomTableViewProtocol {
    
    func getNumberOfSection() -> Int {
        return 1
    }
    
    func getNumberOfItem(in section: Int) -> Int {
        guard let dataUnwrapped = moviesApiData else { return 0 }
        return dataUnwrapped.count
        
    }
    
    func getData(at index: Int) -> GenericDataProtocol? {
        return nil
        /*guard let dataUnwrapped = moviesApiData else { return 0 }
        return dataUnwrapped.
        */
    }
}
