//
//  ExamListInteractor.swift
//  DiplomaTeacherApp
//
//  Created by Иван Суслов on 23.03.2022.
//

import Foundation

class ExamListInteractor: ExamListInteractorProtocol {
    
    var apiManager: ExamApiModule?
    weak var presenter: ExamListPresenterProtocol!
    
    required init(presenter: ExamListPresenterProtocol) {
        self.presenter = presenter
    }
    
    func getExams() {
        self.apiManager?.getExamList()
    }
    func deleteExam(id: Int) {
        self.apiManager?.deleteExam(id: id)
    }
    
    func setExamTime(id: Int, time: Int){
        self.apiManager?.setExamTime(id: id, start: time)
    }
    
    func startExam(id: Int){
        self.apiManager?.startExam(id: id)
    }
    func postFBToken(){
        self.apiManager?.postFBToken()
    }
}
