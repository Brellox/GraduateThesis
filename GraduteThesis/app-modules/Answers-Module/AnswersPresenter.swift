//
//  AnswersPresenter.swift
//  GraduteThesis
//
//  Created by Иван Суслов on 06.06.2022.
//

import Foundation

class AnswersPresenter: AnswersPresenterProtocol{
    weak var view: AnswersViewProtocol!
    var interactor: AnswersInteractorProtocol!
    var router: AnswersRouterProtocol!
    
    var fullExam: FullExam?
    var answers: [Answer] = []
    
    required init(view: AnswersViewProtocol){
        self.view = view
    }
    
    func configureView() {
        
    }
    func getFullExam(id: Int){
        self.interactor.getFullExam(id: id)
    }
    
    func configureAnswers(){
        self.answers = []
        for ticket in fullExam!.tickets{
            let stud = "\(ticket.student.student.account.name) \(ticket.student.student.account.surname)"
            for fullAnswer in ticket.answers{
                let answer = Answer(
                    id: fullAnswer.answer.id,
                    student: stud,
                    taskType: fullAnswer.task.task.taskType,
                    answerState: fullAnswer.answer.state)
                self.answers.append(answer)
            }
        }
    }
    
}
