//
//  DatePickerPopUpInteractor.swift
//  GraduteThesis
//
//  Created by Иван Суслов on 06.06.2022.
//

import Foundation

class DatePickerPopUpInteractor: DatePickerPopUpInteractorProtocol {
    weak var presenter: DatePickerPopUpPresenterProtocol!
    
    required init(presenter: DatePickerPopUpPresenterProtocol) {
        self.presenter = presenter
    }
}
