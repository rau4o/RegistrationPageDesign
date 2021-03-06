//
//  RegistrationView.swift
//  RegistrationApp
//
//  Created by rau4o on 5/11/20.
//  Copyright © 2020 rau4o. All rights reserved.
//

import UIKit

class RegistrationView: UIView {
    
    // MARK: - Properties
    
    var moveToLoginPage: (() ->())?
    
    private let iconImage: UIImageView = {
        let image = UIImageView()
        image.image = #imageLiteral(resourceName: "apple").withRenderingMode(.alwaysOriginal)
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "Create account"
        label.font = UIFont.systemFont(ofSize: 34, weight: .bold)
        return label
    }()
    
    private let descLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = 0
        label.textColor = UIColor(red: 60/255, green: 60/255, blue: 67/255, alpha: 0.6)
        label.text = "Nec nihil affert partiendo ne, quo no iisque etiam tacimates sed conceptam."
        label.font = UIFont.systemFont(ofSize: 17, weight: .medium)
        return label
    }()
    
    lazy private var nameContainerView: UIView = {
        let view = UIView().inputContrainerView(textField: nameTextField)
        view.heightAnchor.constraint(equalToConstant: 60).isActive = true
        return view
    }()
    
    lazy private var emailContainerView: UIView = {
        let view = UIView().inputContrainerView(textField: emailTextField)
        view.heightAnchor.constraint(equalToConstant: 60).isActive = true
        return view
    }()
    
    lazy private var passwordContainerView: UIView = {
        let view = UIView().inputContrainerView(textField: passwordTextField)
        view.heightAnchor.constraint(equalToConstant: 60).isActive = true
        return view
    }()
    
    private let nameTextField: UITextField = {
        return UITextField().textField(withPlaceholder: "Name", isSecureTextEntry: false)
    }()
    
    private let emailTextField: UITextField = {
        return UITextField().textField(withPlaceholder: "Email", isSecureTextEntry: false)
        
    }()
    
    private let passwordTextField: UITextField = {
        return UITextField().textField(withPlaceholder: "Password", isSecureTextEntry: true)
    }()
    
    lazy private var stackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [nameContainerView,emailContainerView,passwordContainerView])
        stack.distribution = .fillEqually
        stack.axis = .vertical
        stack.alignment = .fill
        stack.spacing = 5
        return stack
    }()
    
    lazy private var checkBoxButton: CheckBox = {
        let view = CheckBox()
        view.style = .tick
        view.borderStyle = .roundedSquare(radius: 0)
        return view
    }()
    
    private let termButton: UIButton = {
        let button = UIButton(type: .system)
        let attributedTitle = NSMutableAttributedString(string: "I agree with our? ", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 13),NSAttributedString.Key.foregroundColor: UIColor.lightGray])
        attributedTitle.append(NSAttributedString(string: "Terms ", attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 13),NSAttributedString.Key.foregroundColor: Constants.mainBlue]))
        attributedTitle.append(NSAttributedString(string: "and ", attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 13),NSAttributedString.Key.foregroundColor: UIColor.lightGray]))
        attributedTitle.append(NSAttributedString(string: "Conditions", attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 13),NSAttributedString.Key.foregroundColor: Constants.mainBlue]))
        button.setAttributedTitle(attributedTitle, for: .normal)
        return button
    }()
    
    private let registrButton: AuthButton = {
        let button = AuthButton(type: .system)
        button.setTitle("Create account", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        return button
    }()
    
    let alreadyHaveAcoountButton: UIButton = {
        let button = UIButton(type: .system)
        let attributedTitle = NSMutableAttributedString(string: "Already have an account?  ", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16),NSAttributedString.Key.foregroundColor: UIColor.lightGray])
        attributedTitle.append(NSAttributedString(string: "Sign In", attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 16),NSAttributedString.Key.foregroundColor: Constants.mainBlue]))
        button.setAttributedTitle(attributedTitle, for: .normal)
        button.addTarget(self, action: #selector(handleAlreadyHaveAccount), for: .touchUpInside)
        return button
    }()
    
    lazy private var st: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [checkBoxButton,termButton])
        stack.axis = .horizontal
        stack.distribution = .fill
        stack.spacing = 0
        checkBoxButton.setDimension(height: 18, width: 18)
        return stack
    }()
    
    // MARK: - Init

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        layoutUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Helper function
    
    private func layoutUI() {
        addSubview(iconImage)
        addSubview(titleLabel)
        addSubview(descLabel)
        addSubview(st)
//        addSubview(checkBoxButton)
//        addSubview(termButton)
        addSubview(stackView)
        addSubview(alreadyHaveAcoountButton)
        addSubview(registrButton)
        
        iconImage.centerX(inView: self)
        iconImage.anchor(top: safeAreaLayoutGuide.topAnchor, paddingTop: 92, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 37, height: 44)
        
        titleLabel.centerX(inView: self)
        titleLabel.anchor(top: iconImage.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor,paddingTop: 35, paddingLeft: 16, paddingBottom: 0, paddingRight: 16, height: 41)
        
        descLabel.anchor(top: titleLabel.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 16, paddingLeft: 16, paddingBottom: 0, paddingRight: 16, height: 44)
        
        stackView.anchor(top: descLabel.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 40, paddingLeft: 10, paddingBottom: 0, paddingRight: 10)
        
//        checkBoxButton.anchor(top: stackView.bottomAnchor, left: leftAnchor, bottom: nil, right: nil, paddingTop: 36, paddingLeft: 26, paddingBottom: 0, paddingRight: 8, width: 16, height: 16)
//
//        termButton.anchor(top: stackView.bottomAnchor, left: checkBoxButton.rightAnchor, bottom: nil, right: rightAnchor, paddingTop: 36, paddingLeft: 8, paddingBottom: 0, paddingRight: 16, width: 0, height: 18)
        st.anchor(top: stackView.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 36, paddingLeft: 16, paddingBottom: 0, paddingRight: 16, width: nil, height: 20)
        
        alreadyHaveAcoountButton.anchor(top: nil, left: leftAnchor, bottom: safeAreaLayoutGuide.bottomAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 16, paddingBottom: 55, paddingRight: 16, height: 20)
        
        registrButton.anchor(top: nil, left: leftAnchor, bottom: alreadyHaveAcoountButton.topAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 16, paddingBottom: 32, paddingRight: 16, height: 56)
    }
    
    @objc private func handleAlreadyHaveAccount() {
        moveToLoginPage?()
    }
}
