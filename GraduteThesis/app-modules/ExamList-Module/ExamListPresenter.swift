//
//  ExamListPresenter.swift
//  DiplomaTeacherApp
//
//  Created by Иван Суслов on 23.03.2022.
//

import Foundation
class ExamListPresenter: ExamListPresenterProtocol {
    
    weak var view: ExamListViewProtocol!
    var interactor: ExamListInteractorProtocol!
    var router: ExamListRouterProtocol!
    
    var data: [ExamBean] = []
    
    required init(view: ExamListViewProtocol){
        self.view = view
    }
    
    func configureView() {
        
    }
    func logInCheck(success: Bool)
    {
        self.router.logInCheck(success: success)
    }
    
    func getExams() {
        self.interactor.getExams()
    }
    
    func goToAddExam(){
        self.router.goToAddExam()
    }
    func deleteExam(id: Int) {
        self.interactor.deleteExam(id: id)
    }
    
    func alterExam(id: Int){
        self.router.alterExam(id: id)
    }
    
    func goToDatePicker(id: Int){
        self.router.goToDatePicker(id: id)
    }
    func setExamTime(id: Int, time: Double){
        self.interactor.setExamTime(id: id, time: Int(time))
    }
    func showDelAlert(id: Int){
        self.router.showDelAlert(id: id)
    }
    func showStartAlert(id: Int){
        self.router.showStartAlert(id: id)
    }
    func startExam(id: Int){
        self.interactor.startExam(id: id)
    }
    func postFBToken(){
        self.interactor.postFBToken()
    }
    func goToExam(id: Int){
        self.router.goToExam(id: id)
    }
}
