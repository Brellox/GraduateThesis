//
//  ExamListPresenterProtocol.swift
//  DiplomaTeacherApp
//
//  Created by Иван Суслов on 23.03.2022.
//

import Foundation
protocol ExamListPresenterProtocol:AnyObject {
    var router: ExamListRouterProtocol! {set get}
    var data: [ExamBean] {set get}
    func configureView()
    func logInCheck(success: Bool)
    func getExams()
    func goToAddExam()
    func deleteExam(id: Int)
    func alterExam(id: Int)
    func goToDatePicker(id: Int)
    func setExamTime(id: Int, time: Double)
    func showDelAlert(id: Int)
    func startExam(id: Int)
    func showStartAlert(id: Int)
    func postFBToken()
    func goToExam(id: Int)
}
