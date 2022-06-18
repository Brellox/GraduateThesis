//
//  PickerPopUpRouter.swift
//  GraduteThesis
//
//  Created by Иван Суслов on 06.06.2022.
//

import Foundation

class PickerPopUpRouter: PickerPopUpRouterProtocol{
    
    weak var viewController: PickerPopUpViewController!
    
    init(viewController: PickerPopUpViewController) {
        self.viewController = viewController
    }
    
    func didTapDone(){
        self.viewController.dismiss(animated: true, completion: nil)
    }
}
