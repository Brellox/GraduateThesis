//
//  PickerPopUpPresenter.swift
//  GraduteThesis
//
//  Created by Иван Суслов on 06.06.2022.
//

import Foundation

class PickerPopUpPresenter: PickerPopUpPresenterProtocol{
    weak var view: PickerPopUpViewProtocol!
    var interactor: PickerPopUpInteractorProtocol!
    var router: PickerPopUpRouterProtocol!
    
    required init(view: PickerPopUpViewProtocol){
        self.view = view
    }
    
    func configureView() {
        
    }
    func didTapDone(){
        self.router.didTapDone()
    }
    
}
