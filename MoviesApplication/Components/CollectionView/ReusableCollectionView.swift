//
//  ReusableCollectionView.swift
//  MoviesApplication
//
//  Created by Bengi Anıl on 11.12.2021.
//

import Foundation
import UIKit

class ReusableCollectionView: UICollectionReusableView {
    
    static let identifier = "footer"

    private let label: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "Footer"
        view.textAlignment = .left
        view.textColor = .black
        return view
    }()

    public func addCollectionView() {
        backgroundColor = .systemBlue
        addSubview(label)
        
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: topAnchor),
            label.bottomAnchor.constraint(equalTo: bottomAnchor),
            label.leadingAnchor.constraint(equalTo: leadingAnchor),
            label.trailingAnchor.constraint(equalTo: trailingAnchor),
            ])
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        label.frame = bounds
    }
    
}
