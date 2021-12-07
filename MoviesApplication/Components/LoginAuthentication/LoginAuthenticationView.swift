//
//  LoginAuthenticationView.swift
//  MasterApplication
//
//  Created by Bengi on 21.10.2021.
//

import UIKit

fileprivate extension Selector {
    static var buttonTapped = #selector(MainViewController.buttonAction)
}

class LoginAuthenticationView: GenericBaseView<LoginAuthenticationViewData> {
    
    private var containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 6
        view.backgroundColor = .white
        return view
    }()
    
    private lazy var mainStackView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [imageComponent, emailLoginView, labelInfo, loginButton, horizantalStackView])
        view.translatesAutoresizingMaskIntoConstraints = false
        view.alignment = .fill
        view.distribution = .fill
        view.axis = .vertical
        view.spacing = 20
        return view
    }()
    
    private lazy var horizantalStackView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [subscribeInfo, signupButton])
        view.translatesAutoresizingMaskIntoConstraints = false

        view.axis = .horizontal
        return view
    }()
    
    private lazy var imageComponent: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.heightAnchor.constraint(equalToConstant: 200).isActive = true
        view.widthAnchor.constraint(equalToConstant: 240).isActive = true
        return view
    }()
    
    private lazy var emailLoginView: EmailLoginView = {
        let view = EmailLoginView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var labelInfo: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.font = MainFont.regular(14).value
        view.text = "Please provide your e-mail and password to start shopping successfully."
        view.numberOfLines = 0
        view.lineBreakMode = .byWordWrapping
        view.contentMode = .center
        view.textAlignment = .left
        return view
    }()
    
    private lazy var loginButton: ActionButton = {
        let view = ActionButton()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.heightAnchor.constraint(equalToConstant: 55).isActive = true
        view.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 60).isActive = true
        return view
    }()
    
    private lazy var subscribeInfo: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.font = MainFont.mediumItalic(13).value
        view.text = "Not a member?"
        view.numberOfLines = 0
        view.lineBreakMode = .byWordWrapping
        view.contentMode = .center
        view.textAlignment = .center
        return view
    }()
    
    private lazy var signupButton: UIButton = {
        let view = UIButton()
        view.setTitle("Sign Up", for: .normal)
        view.setTitleColor(ColorHelper.commerceOrange.value, for: .normal)
        view.addTarget(self, action: .buttonTapped, for: .touchUpInside)
        return view
    }()
    
    override func addMajorViewComponents() {
        super.addMajorViewComponents()
        addEmailLoginComponents()
    }
    
    func addEmailLoginComponents() {
        addSubview(containerView)
        containerView.addSubview(mainStackView)
        containerView.addSubview(horizantalStackView)
        
        NSLayoutConstraint.activate([
        
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            containerView.topAnchor.constraint(equalTo: topAnchor),
            containerView.bottomAnchor.constraint(equalTo: bottomAnchor),
                        
            mainStackView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 30),
            mainStackView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -30),
            mainStackView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 30),
            mainStackView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -100),
            
            horizantalStackView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 120),
            horizantalStackView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -120),
            horizantalStackView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -50),

        ])
    }
    
    override func loadDataView() {
        super.loadDataView()
        guard let data = returnData() else { return }
        imageComponent.image = data.imageComponentData
        emailLoginView.setData(by: data.emailLoginViewData)
        loginButton.setData(by: data.loginButtonData)
                
    }
    
    @objc func buttonAction(_ sender: UIButton) {
        print("Signup button tapped.")
    }
}
