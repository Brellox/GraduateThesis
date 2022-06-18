//
//  ExamListConfigurator.swift
//  DiplomaTeacherApp
//
//  Created by Иван Суслов on 23.03.2022.
//

import Foundation

class ExamListConfigurator: ExamListConfiguratorProtocol {
    
    func configure(with viewController: ExamListViewController) {
        let presenter = ExamListPresenter(view: viewController)
        let interactor = ExamListInteractor(presenter: presenter)
        let router = ExamListRouter(viewController: viewController)
        
        viewController.presenter = presenter
        presenter.interactor = interactor
        presenter.router = router
        interactor.apiManager = ExamApiModule(_delegate: viewController)
    }
}
