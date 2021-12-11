//
//  MoviesListViewController.swift
//  MoviesApplication
//
//  Created by Bengi on 23.10.2021.
//

import UIKit

class MoviesListViewController: BaseViewController<MoviesListViewModel> {
    
    private var itemCollectionView: CollectionViews!

    override func prepareViewControllerConfigurations() {
        super.prepareViewControllerConfigurations()
        view.backgroundColor = .systemPink
        addItemCollectionView()
        subscribeViewModelListeners()
        viewModel.getNowPlayingMoviesList()
        viewModel.getPopularMoviesList()
    }
    
    func addItemCollectionView() {
        itemCollectionView = CollectionViews()
        itemCollectionView.translatesAutoresizingMaskIntoConstraints = false
        itemCollectionView.delegate = viewModel
        view.addSubview(itemCollectionView)
        
        NSLayoutConstraint.activate([
            itemCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            itemCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            itemCollectionView.topAnchor.constraint(equalTo: view.topAnchor),
            itemCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
    
    private func subscribeViewModelListeners() {
        viewModel.subscribeState { [weak self] state in
            switch state {
            case .done:
                DispatchQueue.main.async {
                    self?.itemCollectionView.reloadCollectionView()
                }
            case .loading:
                print("Data is getting.")
            case .failure:
                print("Error")
            }
        }
    }
}
