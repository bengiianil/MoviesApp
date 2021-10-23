//
//  ColorHelper.swift
//  E-commerce
//
//  Created by Bengi on 22.10.2021.
//

import UIKit

enum ColorHelper: GenericValueProtocol{
    
    typealias Value = UIColor
    var value: UIColor {
        switch self {
        case .commerceGray:
            return #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        case .commerceOrange:
            return #colorLiteral(red: 1, green: 0.4800234437, blue: 0.1197332218, alpha: 1)
        }
    }
    
    case commerceGray
    case commerceOrange
}
