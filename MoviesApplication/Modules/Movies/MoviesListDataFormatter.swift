//
//  MoviesListDataFormatter.swift
//  MoviesApplication
//
//  Created by Bengi on 23.10.2021.
//

import Foundation
import UIKit
import SwiftUI

class MoviesListDataFormatter: MoviesListDataFormatterProtocol {
    
    private var data: AllMovies?
    private var list: [ApiResult] = [ApiResult]()

    func getNumberOfSection() -> Int {
        return 1
    }
    
    func getNumberOfItem(in section: Int) -> Int {
        return list.count
    }
    
    func getItem(at index: Int) -> GenericDataProtocol? {
        return MoviesListData(labelComponentData: LabelPackComponentData(title: list[index].originalTitle ?? "not found", subtitle: ""),
                              imageComponentData: CustomImageViewComponentData(imageUrl: list[index].backdropURL))
    }
    
    func setData(with response: AllMovies) {
        self.data = response
        self.list.append(contentsOf: response.results)
    }
}

