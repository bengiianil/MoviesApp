//
//  MoviesListViewBuilder.swift
//  MoviesApplication
//
//  Created by Bengi on 23.10.2021.
//

import Foundation
import UIKit

class MoviesListViewBuilder {
    
    class func build() -> UIViewController {
        let viewModel = MoviesListViewModel()
        let viewController = MoviesListViewController(viewModel: viewModel)
        viewController.title = "MOVIES"
        viewController.tabBarItem.image = TabBarImages.movies.value
        viewController.tabBarItem.selectedImage = TabBarImages.moviesSelected.value
        return viewController
    }
}
