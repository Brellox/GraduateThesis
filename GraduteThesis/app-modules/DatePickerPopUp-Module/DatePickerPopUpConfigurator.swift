//
//  DatePickerPopUpConfigurator.swift
//  GraduteThesis
//
//  Created by Иван Суслов on 06.06.2022.
//

import Foundation

class DatePickerPopUpConfigurator: DatePickerPopUpConfiguratorProtocol{
    
    func configure(with viewController: DatePickerPopUpViewController) {
        let presenter = DatePickerPopUpPresenter(view: viewController)
        let interactor = DatePickerPopUpInteractor(presenter: presenter)
        let router = DatePickerPopUpRouter(viewController: viewController)
        
        viewController.presenter = presenter
        presenter.interactor = interactor
        presenter.router = router
    }
}
