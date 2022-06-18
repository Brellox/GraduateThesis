//
//  AnswersConfigurator.swift
//  GraduteThesis
//
//  Created by Иван Суслов on 06.06.2022.
//

import Foundation

class AnswersConfigurator: AnswersConfiguratorProtocol{
    
    func configure(with viewController: AnswersViewController) {
        let presenter = AnswersPresenter(view: viewController)
        let interactor = AnswersInteractor(presenter: presenter)
        let router = AnswersRouter(viewController: viewController)
        
        viewController.presenter = presenter
        presenter.interactor = interactor
        presenter.router = router
        interactor.apiManager = AnswerApiModule(_delegate: viewController)
    }
}

