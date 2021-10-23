//
//  MoviesListState.swift
//  MoviesApplication
//
//  Created by Bengi on 23.10.2021.
//

import Foundation

typealias MoviesListViewStateBlock = (MoviesListViewState) -> Void

enum MoviesListViewState {
    
    case loading
    case done
    case failure
}
