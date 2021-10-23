//
//  LoginViewModel.swift
//  MasterApplication
//
//  Created by Bengi on 19.10.2021.
//

import Foundation

class LoginViewModel {
    
    private var authenticationManager: AuthenticationManagerProtocol
    init(authenticationManager: AuthenticationManagerProtocol) {
        self.authenticationManager = authenticationManager
    }
    
    func getLoginViewData() -> LoginAuthenticationViewData {
        return LoginAuthenticationViewData(imageComponentData: PageViewImages.trendyolBackground.value, emailLoginViewData: EmailLoginViewData(emailData: TextFieldViewData(placeHolder: "E-mail"), passwordData: TextFieldViewData(placeHolder: "Password")), loginButtonData: ActionButtonData(buttonText: "Sign In", buttonType:.filled(ActionButtonTheme.commerceOrange)).setActionButtonListener(by: signInActionButtonListener))
    }
    
    private func fireSignIn() {
        authenticationManager.signIn(with: AuthenticationRequest(email: "bengiianil@hotmail.com", password: "123123"))
    }
    
    private lazy var signInActionButtonListener: VoidCompletionBlock = { [weak self] in
        print("SignIn button tapped")
        self?.fireSignIn()
    }
}
