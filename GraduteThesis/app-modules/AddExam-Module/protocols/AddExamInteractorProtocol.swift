//
//  AddExamInteractorProtocol.swift
//  GraduteThesis
//
//  Created by Иван Суслов on 05.06.2022.
//

import Foundation
protocol AddExamInteractorProtocol: AnyObject {
    var apiManager: AddExamApiModule?{set get}
    func getGroups()
    func getDisciplines()
    func postExam(name: String, discipline: Int, groups: [Int])
}
