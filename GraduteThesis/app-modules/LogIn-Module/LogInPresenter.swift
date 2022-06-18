//
//  LogInPresenter.swift
//  DiplomaTeacherApp
//
//  Created by Иван Суслов on 22.03.2022.
//

import Foundation

class LogInPresenter: LogInPresenterProtocol {
    
    weak var view: LogInViewProtocol!
    var interactor: LogInInteractorProtocol!
    var router: LogInRouterProtocol!
    
    required init(view: LogInViewProtocol){
        self.view = view
    }
    
    func configureView() {
        
    }

    func logUser(login: String, pass: String){
       self.interactor.logUser(login: login, pass: pass)
    }
    
    func goToApp(){
        self.router.goToApp()
    }
}

