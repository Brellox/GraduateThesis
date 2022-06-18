//
//  PopUpInteractor.swift
//  GraduteThesis
//
//  Created by Иван Суслов on 06.06.2022.
//

import Foundation

class PickerPopUpInteractor: PickerPopUpInteractorProtocol {
    weak var presenter: PickerPopUpPresenterProtocol!
    
    required init(presenter: PickerPopUpPresenterProtocol) {
        self.presenter = presenter
    }
}
