//
//  ExamListInteractorProtocol.swift
//  DiplomaTeacherApp
//
//  Created by Иван Суслов on 23.03.2022.
//

import Foundation

protocol ExamListInteractorProtocol:AnyObject {
    var apiManager: ExamApiModule? {get set}
    func getExams()
    func deleteExam(id: Int)
    func setExamTime(id: Int, time: Int)
    func startExam(id: Int)
    func postFBToken()
}
