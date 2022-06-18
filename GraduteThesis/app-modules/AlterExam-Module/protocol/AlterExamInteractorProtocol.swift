//
//  AlterExamInteractorProtocol.swift
//  GraduteThesis
//
//  Created by Иван Суслов on 05.06.2022.
//

import Foundation
protocol AlterExamInteractorProtocol: AnyObject {
    var apiManager: AddExamApiModule?{set get}
    func getGroups()
    func getDisciplines()
    func getExam(id: Int)
    func updateExam(name: String, discipline: Int, groups: [Int])
    func updateExamState(id: Int)
}
