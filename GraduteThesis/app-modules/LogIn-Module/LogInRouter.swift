//
//  LogInRouter.swift
//  DiplomaTeacherApp
//
//  Created by Иван Суслов on 22.03.2022.
//

import Foundation

class LogInRouter: LogInRouterProtocol {
    
    weak var viewController: LogInViewController!
    
    init(viewController: LogInViewController) {
        self.viewController = viewController
    }
    
    func goToApp(){
        DispatchQueue.main.async {
            self.viewController.navigationController?.dismiss(animated: true)
        }
        
    }
    
}
