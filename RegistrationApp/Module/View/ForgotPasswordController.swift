//
//  ForgotPasswordController.swift
//  RegistrationApp
//
//  Created by rau4o on 5/11/20.
//  Copyright © 2020 rau4o. All rights reserved.
//

import UIKit

class ForgotPasswordController: UIViewController {
    
    // MARK: - Properties
    
    static let shared = ForgotPasswordController()
    
    var forgotPassView = ForgotPassView()
    
    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        layoutUI()
        title = "Password reset"
        
        forgotPassView.moveToLogin = { [weak self] in
            guard let self = self else {return}
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        navigationController?.navigationBar.isHidden = false
    }
    
    // MARK: - Helper function

    private func layoutUI() {
        view.addSubview(forgotPassView)
        
        forgotPassView.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0)
    }
}
