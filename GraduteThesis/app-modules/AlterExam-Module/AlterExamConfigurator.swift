//
//  AlterExamConfigurator.swift
//  GraduteThesis
//
//  Created by Иван Суслов on 05.06.2022.
//

import Foundation

class AlterExamConfigurator: AlterExamConfiguratorProtocol{
    
    func configure(with viewController: AlterExamViewController) {
        let presenter = AlterExamPresenter(view: viewController)
        let interactor = AlterExamInteractor(presenter: presenter)
        let router = AlterExamRouter(viewController: viewController)
        
        viewController.presenter = presenter
        presenter.interactor = interactor
        presenter.router = router
        interactor.apiManager = AddExamApiModule(_delegate: viewController)
    }
}
