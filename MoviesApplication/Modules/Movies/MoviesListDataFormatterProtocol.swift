//
//  MoviesListDataFormatterProtocol.swift
//  MoviesApplication
//
//  Created by Bengi on 23.10.2021.
//

import Foundation

protocol MoviesListDataFormatterProtocol {
    
    func getNumberOfSection() -> Int
    func getNumberOfItem(in section: Int) -> Int
    func getItem(at index: Int) -> GenericDataProtocol?
    func setData(with response: AllMovies)

}
