//
//  MoviesListDataFormatterProtocol.swift
//  MoviesApplication
//
//  Created by Bengi on 23.10.2021.
//

import Foundation

protocol MoviesListDataFormatterProtocol {
    
    func getItem(from data: NowPlayingMovies) -> ListViewCellData
}
