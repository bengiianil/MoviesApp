//
//  CustomTableViewCellData.swift
//  GameOfThronesCharacters
//
//  Created by Bengi on 14.10.2021.
//

import Foundation
import UIKit

class CustomTableViewCellData: GenericDataProtocol {
    
    private(set) var labelInfo: LabelPackComponentData
    private(set) var iconInfo: UIImage

    init(labelInfo: LabelPackComponentData, iconInfo: UIImage) {
        self.labelInfo = labelInfo
        self.iconInfo = iconInfo
    }
}
