//
//  PickerPopUpConfigurator.swift
//  GraduteThesis
//
//  Created by Иван Суслов on 06.06.2022.
//

import Foundation

class PickerPopUpConfigurator: PickerPopUpConfiguratorProtocol{
    
    func configure(with viewController: PickerPopUpViewController) {
        let presenter = PickerPopUpPresenter(view: viewController)
        let interactor = PickerPopUpInteractor(presenter: presenter)
        let router = PickerPopUpRouter(viewController: viewController)
        
        viewController.presenter = presenter
        presenter.interactor = interactor
        presenter.router = router
    }
}
