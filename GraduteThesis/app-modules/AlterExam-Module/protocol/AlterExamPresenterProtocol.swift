//
//  AlterExamPresenterProtocol.swift
//  GraduteThesis
//
//  Created by Иван Суслов on 05.06.2022.
//

import Foundation
protocol AlterExamPresenterProtocol: AnyObject {
    var router: AlterExamRouterProtocol! {set get}
    var disciplines: [Discipline] {set get}
    var groups: [GroupModel]{set get}
    var selectedDiscipline: Int?{set get}
    func configureView()
    func getGroups()
    func getDisciplines()
    func goToPicker()
    func goBack()
    func getExam(id: Int)
    func updateExam(name: String, discipline: Int)
    func updateExamState(id: Int)
}
