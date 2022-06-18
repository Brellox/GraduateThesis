//
//  ExamApiDelegate.swift
//  GraduteThesis
//
//  Created by Иван Суслов on 05.06.2022.
//

import Foundation

protocol ExamApiDelegate: AnyObject {
    func examList(list: [ExamBean])
    func showResult(success: Bool, message: String?)
}

extension ExamApiDelegate {
    func examList(list: [ExamBean]){}
    func showResult(success: Bool, message: String?){}
    
}
