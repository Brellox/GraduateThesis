//
//  AddExamApiDelegate.swift
//  GraduteThesis
//
//  Created by Иван Суслов on 06.06.2022.
//

import Foundation


protocol AddExamApiDelegate: AnyObject {
    func groupList(list: [Group])
    func disciplineList(list: [Discipline])
    func postExamResult(success: Bool)
    func showExam(exam: ExamBean)
}

extension AddExamApiDelegate {
    func groupList(list: [Group]){}
    func disciplineList(list: [Discipline]){}
    func postExamResult(success: Bool){}
    func showExam(exam: ExamBean){}
    
}
