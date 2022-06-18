//
//  ExamListRouterProtocol.swift
//  DiplomaTeacherApp
//
//  Created by Иван Суслов on 23.03.2022.
//

import Foundation

protocol ExamListRouterProtocol:AnyObject {
    func logInCheck(success: Bool)
    func goToAddExam()
    func alterExam(id: Int)
    func goToDatePicker(id: Int)
    func showDelAlert(id: Int)
    func showStartAlert(id: Int)
    func goToExam(id: Int)
}
