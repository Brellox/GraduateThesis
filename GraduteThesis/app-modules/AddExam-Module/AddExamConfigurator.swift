//
//  AddExamConfigurator.swift
//  GraduteThesis
//
//  Created by Иван Суслов on 05.06.2022.
//

import Foundation

class AddExamConfigurator: AddExamConfiguratorProtocol{
    
    func configure(with viewController: AddExamViewController) {
        let presenter = AddExamPresenter(view: viewController)
        let interactor = AddExamInteractor(presenter: presenter)
        let router = AddExamRouter(viewController: viewController)
        
        viewController.presenter = presenter
        presenter.interactor = interactor
        presenter.router = router
        interactor.apiManager = AddExamApiModule(_delegate: viewController)
    }
}
