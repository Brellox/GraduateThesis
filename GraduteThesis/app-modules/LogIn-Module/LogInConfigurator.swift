//
//  LogInConfigurator.swift
//  DiplomaTeacherApp
//
//  Created by Иван Суслов on 22.03.2022.
//

import Foundation

class LogInConfigurator: LogInConfiguratorProtocol {
    
    func configure(with viewController: LogInViewController) {
        let presenter = LogInPresenter(view: viewController)
        let interactor = LogInInteractor(presenter: presenter)
        let router = LogInRouter(viewController: viewController)
        
        viewController.presenter = presenter
        presenter.interactor = interactor
        presenter.router = router
        interactor.apiManager = AuthApiModule(_delegate: viewController)
    }
}

