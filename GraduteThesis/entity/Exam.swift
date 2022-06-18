//
//  Exam.swift
//  DiplomaTeacherApp
//
//  Created by Иван Суслов on 23.03.2022.
//

import Foundation
struct ExamBean: Codable{
    let id: Int
    let name: String
    let disciplineId: Int
    let groupId: Int
    let oneGroup: Bool
    let start: Int
    let end: Int
    let state: ExamState
    
    private enum CodingKeys: String, CodingKey{
        case id = "id"
        case name = "name"
        case disciplineId = "disciplineId"
        case groupId = "groupId"
        case oneGroup = "oneGroup"
        case start = "start"
        case end = "end"
        case state = "state"
    }
}


enum ExamState: String, Codable{
    case REDACTION = "REDACTION"
    case TIME_SET = "TIME_SET"
    case READY = "READY"
    case PROGRESS = "PROGRESS"
    case FINISHED = "FINISHED"
    case CLOSED = "CLOSED"
}

struct FullExam: Codable{
    let exam: ExamBean
    let tickets: [Ticket]
    
    private enum CodingKeys: String, CodingKey{
        case exam = "exam"
        case tickets = "tickets"
    }
}
