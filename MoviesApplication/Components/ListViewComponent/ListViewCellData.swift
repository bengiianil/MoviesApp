//
//  ListViewCellData.swift
//  MoviesApplication
//
//  Created by Bengi on 23.10.2021.
//

import Foundation
import UIKit

class ListViewCellData: GenericListViewProtocol {
    
    private(set) var labelComponentData: LabelPackComponentData
    private(set) var imageComponentData: CustomImageViewComponentData

    init(labelComponentData: LabelPackComponentData, imageComponentData: CustomImageViewComponentData) {
        self.labelComponentData = labelComponentData
        self.imageComponentData = imageComponentData
    }
}
