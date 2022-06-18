//
//  AddExamInteractor.swift
//  GraduteThesis
//
//  Created by Иван Суслов on 05.06.2022.
//

import Foundation
class AddExamInteractor: AddExamInteractorProtocol {
    weak var presenter: AddExamPresenterProtocol!
    var apiManager: AddExamApiModule?
    
    required init(presenter: AddExamPresenterProtocol) {
        self.presenter = presenter
    }
    
    func getGroups(){
        self.apiManager?.getGroups()
    }
    
    func getDisciplines(){
        self.apiManager?.getDisciplines()
    }
    
    func postExam(name: String, discipline: Int, groups: [Int]){
        self.apiManager?.postExam(name: name, discipline: discipline, groups: groups)
    }
}
