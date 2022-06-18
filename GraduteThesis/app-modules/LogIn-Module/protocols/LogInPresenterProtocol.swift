//
//  LogInPresenterProtocol.swift
//  DiplomaTeacherApp
//
//  Created by Иван Суслов on 22.03.2022.
//

import Foundation

protocol LogInPresenterProtocol:AnyObject {
    var router: LogInRouterProtocol! {set get}
    func configureView()
    func logUser(login: String, pass: String)
    func goToApp()
}
