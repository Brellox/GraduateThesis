//
//  AddExamPresenterProtocol.swift
//  GraduteThesis
//
//  Created by Иван Суслов on 05.06.2022.
//

import Foundation
protocol AddExamPresenterProtocol: AnyObject {
    var router: AddExamRouterProtocol! {set get}
    var disciplines: [Discipline] {set get}
    var groups: [GroupModel]{set get}
    var selectedDiscipline: Int?{set get}
    func configureView()
    func getGroups()
    func getDisciplines()
    func goToPicker()
    func postExam(name: String, discipline: Int)
    func goBack()
}
