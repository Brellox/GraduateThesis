//
//  AlterExamInteractor.swift
//  GraduteThesis
//
//  Created by Иван Суслов on 05.06.2022.
//

import Foundation

class AlterExamInteractor: AlterExamInteractorProtocol {
    weak var presenter: AlterExamPresenterProtocol!
    var apiManager: AddExamApiModule?
    
    required init(presenter: AlterExamPresenterProtocol) {
        self.presenter = presenter
    }
    
    func getGroups(){
        self.apiManager?.getGroups()
    }
    
    func getDisciplines(){
        self.apiManager?.getDisciplines()
    }
    
    func getExam(id: Int){
        self.apiManager?.getExam(id: id)
    }
    
    func updateExam(name: String, discipline: Int, groups: [Int]){
        self.apiManager?.updateExam(name: name, discipline: discipline, groups: groups)
    }
    
    func updateExamState(id: Int){
        self.apiManager?.updateExamState(id: id)
    }
}
