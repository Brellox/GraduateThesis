//
//  DatePickerPopUpPresenter.swift
//  GraduteThesis
//
//  Created by Иван Суслов on 06.06.2022.
//

import Foundation

class DatePickerPopUpPresenter: DatePickerPopUpPresenterProtocol{
    weak var view: DatePickerPopUpViewProtocol!
    var interactor: DatePickerPopUpInteractorProtocol!
    var router: DatePickerPopUpRouterProtocol!
    
    required init(view: DatePickerPopUpViewProtocol){
        self.view = view
    }
    
    func configureView() {
        
    }
    func didTapDone(){
        self.router.didTapDone()
    }
    
}
