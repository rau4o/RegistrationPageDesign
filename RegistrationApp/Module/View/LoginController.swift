//
//  LoginController.swift
//  RegistrationApp
//
//  Created by rau4o on 5/11/20.
//  Copyright © 2020 rau4o. All rights reserved.
//

import UIKit

class LoginController: UIViewController {
    
    // MARK: - Properties
    
    var loginView = LoginView()
    let registrationController = RegistrationController()
    
    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavbar()
        layoutUI()
        
        loginView.moveToRegistrationPage = { [weak self] in
            guard let self = self else { return }
            self.navigationController?.pushViewController(self.registrationController, animated: true)
        }
        
        loginView.moveToForgotPass = { [weak self] in
            guard let self = self else { return }
            self.navigationController?.pushViewController(ForgotPasswordController.shared, animated: true)
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureNavbar()
    }
    
    // MARK: - Helper function
    
    func configureNavbar() {
        navigationController?.navigationBar.isHidden = true
    }

    func layoutUI() {
        view.addSubview(loginView)
        
        loginView.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0)
    }
}
