//
//  ItemProviderProtocol.swift
//  Week_3
//
//  Created by Erkut Bas on 2.10.2021.
//

import Foundation

// MARK: - Item Functions' Protocol -
protocol ItemProviderProtocol: AnyObject {
    
    func getNumberOfSection() -> Int
    func getNumberOfItem(in section: Int) -> Int
    func getData(at index: Int) -> GenericDataProtocol?

    func isLoadingCell(for index: Int) -> Bool
    func getMoreData()
    func selectedItem(by data: ApiResult?)
    func getDetailData(at index: Int) -> ApiResult?
    func getChangingTerm(with term: String)
    func getSegmentedControlData(with entity: String)

}

extension ItemProviderProtocol {
    func isLoadingCell(for index: Int) -> Bool { return false }
    func getMoreData() { }
    func selectedItem(by data: ApiResult?) { }
    func getDetailData(at index: Int) -> ApiResult? { return nil }
    func getChangingTerm(with term: String) { }
    func getSegmentedControlData(with entity: String) { }

}

