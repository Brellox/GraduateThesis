//
//  Ticket.swift
//  DiplomaTeacherApp
//
//  Created by Иван Суслов on 23.03.2022.
//

import Foundation

struct Ticket: Codable{
    let studentRating: StudentRating
    let answers: [FullAnswer]
    let student: FullStudent

    private enum CodingKeys: String, CodingKey{
        case studentRating = "studentRating"
        case answers = "answers"
        case student = "student"
    }
}
