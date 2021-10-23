//
//  MoviesListDataFormatter.swift
//  MoviesApplication
//
//  Created by Bengi on 23.10.2021.
//

import Foundation
import UIKit

class MoviesListDataFormatter: MoviesListDataFormatterProtocol {
    
    func getItem(from data: NowPlayingMovies) -> ListViewCellData {
        return ListViewCellData(labelComponentData: LabelPackComponentData(title: data.results[data.page].originalTitle, subtitle: ""), imageComponentData: CustomImageViewComponentData(imageUrl: data.results[data.page].posterPath))
    }
}


