//
//  AnswersInteractor.swift
//  GraduteThesis
//
//  Created by Иван Суслов on 06.06.2022.
//

import Foundation

class AnswersInteractor: AnswersInteractorProtocol {
    weak var presenter: AnswersPresenterProtocol!
    var apiManager: AnswerApiModule?
    
    required init(presenter: AnswersPresenterProtocol) {
        self.presenter = presenter
    }
    
    func getFullExam(id: Int){
        self.apiManager?.getInfo(id: id)
    }
}
