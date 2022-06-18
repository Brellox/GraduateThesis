//
//  AnswerApiDelegate.swift
//  GraduteThesis
//
//  Created by Иван Суслов on 11.06.2022.
//

import Foundation

protocol AnswerApiDelegate: AnyObject {
    func fullExamResult(exam: FullExam)
}

extension AnswerApiDelegate {
    func fullExamResult(exam: FullExam){}
}
