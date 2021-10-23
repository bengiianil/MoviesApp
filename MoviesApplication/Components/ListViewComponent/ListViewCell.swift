//
//  ListViewCell.swift
//  MoviesApplication
//
//  Created by Bengi on 23.10.2021.
//

import Foundation
import UIKit

class ListViewCell: BaseTableViewCell {
    
    private lazy var containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        view.backgroundColor = .white
        return view
    }()
    
    private lazy var mainStackView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [labelComponent, imageComponent])
        view.translatesAutoresizingMaskIntoConstraints = false
        view.alignment = .center
        view.distribution = .fill
        view.axis = .vertical
        view.spacing = 10
        return view
    }()
    
    private lazy var labelComponent: LabelPackComponent = {
        let view = LabelPackComponent(data: getLabelPackComponentData())
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    private lazy var imageComponent: CustomImageViewComponentContainer = {
        
        let view = CustomImageViewComponentContainer()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.heightAnchor.constraint(equalToConstant: 50).isActive = true
        view.widthAnchor.constraint(equalToConstant: 50).isActive = true
        view.layer.cornerRadius = 4
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOffset = CGSize(width: 0, height: 2)
        view.layer.shadowRadius = 4
        view.layer.shadowOpacity = 0.6
        return view
    }()
    

    override func addMajorViews() {
        super.addMajorViews()
        addInfoComponents()
    }
    
    private func addInfoComponents() {
        addSubview(containerView)
        containerView.addSubview(mainStackView)
        
        NSLayoutConstraint.activate([
        
            containerView.topAnchor.constraint(equalTo: topAnchor),
            containerView.bottomAnchor.constraint(equalTo: bottomAnchor),
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            mainStackView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 30),
            mainStackView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -30),
            mainStackView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 10),
            mainStackView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -10),

        ])
    }
    
    func setData(by value: GenericDataProtocol) {
        guard let data = value as? ListViewCellData else { return }
        labelComponent.setData(by: data.labelComponentData)
        imageComponent.setData(by: data.imageComponentData)
    }
    
    private func getLabelPackComponentData() -> LabelPackComponentData {
        return LabelPackComponentData()
            .setSubtitleLabelDistributionData(by: LabelPackDistributionData()
                                                .setContentMode(by: .left)
                                                .setTextAlignment(by: .left)
                                                .setNumberOfLines(by: 2)
                                                .setLineBreakMode(by: .byTruncatingTail))
            .setTitleLabelDistributionData(by: LabelPackDistributionData()
                                            .setContentMode(by: .left)
                                            .setTextAlignment(by: .left)
                                            .setNumberOfLines(by: 1)
                                            .setLineBreakMode(by: .byTruncatingTail))
            .setSpacing(by: 5)
            .setStackViewAlignment(by: .fill)
    }
}
