//
//  MoviesListViewController.swift
//  MoviesApplication
//
//  Created by Bengi on 23.10.2021.
//

import UIKit
import GameController

class MoviesListViewController: BaseViewController<MoviesListViewModel> {
    
    private var itemCollectionView: ItemCollectionView!

    override func prepareViewControllerConfigurations() {
        super.prepareViewControllerConfigurations()
        view.backgroundColor = .systemPink
        addItemCollectionView()
        subscribeViewModelListeners()
        viewModel.getMoviesList()
    }
    
    func addItemCollectionView() {
        itemCollectionView = ItemCollectionView()
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
