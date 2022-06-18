//
//  AddExamPresenter.swift
//  GraduteThesis
//
//  Created by Иван Суслов on 05.06.2022.
//

import Foundation

class AddExamPresenter: AddExamPresenterProtocol{
    weak var view: AddExamViewProtocol!
    var interactor: AddExamInteractorProtocol!
    var router: AddExamRouterProtocol!
    var disciplines: [Discipline] = []
    var groups: [GroupModel] = []
    var selectedDiscipline: Int?
    
    required init(view: AddExamViewProtocol){
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
    
    func postExam(name: String, discipline: Int){
        var selectedGroups: [Int] = []
        for group in self.groups {
            if group.isSelected{
                selectedGroups.append(group.id)
            }
        }
        self.interactor.postExam(name: name, discipline: discipline, groups: selectedGroups)
    }
    
    func goBack(){
        self.router.goBack()
    }
}
