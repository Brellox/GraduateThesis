//
//  DatePickerPopUpRouter.swift
//  GraduteThesis
//
//  Created by Иван Суслов on 06.06.2022.
//

import Foundation

class DatePickerPopUpRouter: DatePickerPopUpRouterProtocol{
    
    weak var viewController: DatePickerPopUpViewController!
    
    init(viewController: DatePickerPopUpViewController) {
        self.viewController = viewController
    }
    
    func didTapDone(){
        self.viewController.dismiss(animated: true, completion: nil)
    }
}
