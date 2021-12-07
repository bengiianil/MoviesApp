//
//  MoviesListDataFormatter.swift
//  MoviesApplication
//
//  Created by Bengi on 23.10.2021.
//

import Foundation
import UIKit

class MoviesListDataFormatter: MoviesListDataFormatterProtocol {
    
    private var data: NowPlayingMovies?
    private var list: [ApiResult] = [ApiResult]()

    func getNumberOfSection() -> Int {
        return 1
    }
    
    func getNumberOfItem(in section: Int) -> Int {
        return list.count
    }
    
    func getItem(at index: Int) -> GenericDataProtocol? {
        return CustomTableViewCellData(labelInfo: LabelPackComponentData(title: list[index].originalTitle ?? "not found", subtitle: list[index].overview ?? "not found"), iconInfo: SFSymbolsHelper.gearShape.value!)
    }
    
    func setData(with response: NowPlayingMovies) {
        self.data = response
        self.list.append(contentsOf: response.results)
    }
}


