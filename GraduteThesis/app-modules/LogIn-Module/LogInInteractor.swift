//
//  LogInInteractor.swift
//  DiplomaTeacherApp
//
//  Created by Иван Суслов on 22.03.2022.
//

import Foundation

class LogInInteractor: LogInInteractorProtocol {
    var apiManager: AuthApiModule?
    weak var presenter: LogInPresenterProtocol!
    
    required init(presenter: LogInPresenterProtocol) {
        self.presenter = presenter
    }
    
    func logUser(login: String, pass: String) {
        self.apiManager?.loginByUserName(email: login, password: pass)
    }
}
