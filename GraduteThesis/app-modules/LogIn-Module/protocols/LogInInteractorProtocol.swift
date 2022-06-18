//
//  LogInInteractorProtocol.swift
//  DiplomaTeacherApp
//
//  Created by Иван Суслов on 22.03.2022.
//

import Foundation

protocol LogInInteractorProtocol:AnyObject {
    var apiManager: AuthApiModule? {get set}
    func logUser(login: String, pass: String)
}

