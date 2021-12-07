//
//  LoginAuthenticationViewData.swift
//  MasterApplication
//
//  Created by Bengi on 21.10.2021.
//

import Foundation
import UIKit

class LoginAuthenticationViewData {

    private(set) var imageComponentData: UIImage
    private(set) var emailLoginViewData: EmailLoginViewData
    private(set) var loginButtonData: ActionButtonData

    init(imageComponentData: UIImage, emailLoginViewData: EmailLoginViewData, loginButtonData: ActionButtonData) {
        self.imageComponentData = imageComponentData
        self.emailLoginViewData = emailLoginViewData
        self.loginButtonData = loginButtonData
    }
}
