//
//  AnswersInteractorProtocol.swift
//  GraduteThesis
//
//  Created by Иван Суслов on 06.06.2022.
//

import Foundation
protocol AnswersInteractorProtocol: AnyObject {
    var apiManager: AnswerApiModule?{set get}
    func getFullExam(id: Int)
}
