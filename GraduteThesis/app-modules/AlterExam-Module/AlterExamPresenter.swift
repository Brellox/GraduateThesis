//
//  AlterExamPresenter.swift
//  GraduteThesis
//
//  Created by Иван Суслов on 05.06.2022.
//

import Foundation

class AlterExamPresenter: AlterExamPresenterProtocol{
    weak var view: AlterExamViewProtocol!
    var interactor: AlterExamInteractorProtocol!
    var router: AlterExamRouterProtocol!
    var disciplines: [Discipline] = []
    var groups: [GroupModel] = []
    var selectedDiscipline: Int?
    
    required init(view: AlterExamViewProtocol){
        self.view = view
    }
    
    func configureView() {
        
    }
    
    func goToPicker(){
        self.router.goToPicker()
    }
    
    func getGroups(){
        self.interactor.getGroups()
    }
    func getDisciplines(){
        self.interactor.getDisciplines()
    }
    
    func goBack(){
        self.router.goBack()
    }
    
    func getExam(id: Int){
        self.interactor.getExam(id: id)
    }
    func updateExam(name: String, discipline: Int){
        var selectedGroups: [Int] = []
        for group in self.groups {
            if group.isSelected{
                selectedGroups.append(group.id)
            }
        }
        self.interactor.updateExam(name: name, discipline: discipline, groups: selectedGroups)
    }
    func updateExamState(id: Int){
        self.interactor.updateExamState(id: id)
    }
}
