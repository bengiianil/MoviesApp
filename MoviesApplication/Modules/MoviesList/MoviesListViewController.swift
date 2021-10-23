//
//  MoviesListViewController.swift
//  MoviesApplication
//
//  Created by Bengi on 23.10.2021.
//

import UIKit

class MoviesListViewController: BaseViewController<MoviesListViewModel> {
    
    private var mainComponent: CustomTableView!
    
    override func prepareViewControllerConfigurations() {
        super.prepareViewControllerConfigurations()
        view.backgroundColor = .systemPink
        addMainComponent()
        subscribeViewModelListeners()
        viewModel.getMoviesList()
    }
    
    private func addMainComponent() {
        mainComponent = CustomTableView()
        mainComponent.translatesAutoresizingMaskIntoConstraints = false
        mainComponent.delegate = viewModel
        view.addSubview(mainComponent)
        
        NSLayoutConstraint.activate([
            mainComponent.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mainComponent.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            mainComponent.topAnchor.constraint(equalTo: view.topAnchor),
            mainComponent.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
    
    private func subscribeViewModelListeners() {
        viewModel.subscribeState { [weak self] state in
            switch state {
            case .done:
                print("Data is ready.")
                self?.mainComponent.reloadTableView()
            case .loading:
                print("Data is getting.")
            case .failure:
                print("Error")
            }
        }
    }
}
