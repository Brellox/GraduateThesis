//
//  AnswersRouter.swift
//  GraduteThesis
//
//  Created by Иван Суслов on 06.06.2022.
//

import Foundation

class AnswersRouter: AnswersRouterProtocol{
    
    weak var viewController: AnswersViewController!
    
    init(viewController: AnswersViewController) {
        self.viewController = viewController
    }
}
