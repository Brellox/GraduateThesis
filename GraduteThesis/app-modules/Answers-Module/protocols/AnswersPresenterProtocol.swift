//
//  AnswersPresenterProtocol.swift
//  GraduteThesis
//
//  Created by Иван Суслов on 06.06.2022.
//

import Foundation
protocol AnswersPresenterProtocol: AnyObject {
    var router: AnswersRouterProtocol! {set get}
    var fullExam: FullExam? {get set}
    var answers: [Answer] {set get}
    func configureView()
    func getFullExam(id: Int)
    func configureAnswers()
}
