//
//  MoviesListData.swift
//  MoviesApplication
//
//  Created by Bengi on 24.11.2021.
//

import Foundation

class MoviesListData: GenericDataProtocol {
    
    private(set) var labelComponentData: LabelPackComponentData
   // private(set) var imageComponentData: CustomImageViewComponentData

    init(labelComponentData: LabelPackComponentData) {
        self.labelComponentData = labelComponentData
       // self.imageComponentData = imageComponentData
    }
}
