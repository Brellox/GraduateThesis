//
//  Answer.swift
//  GraduteThesis
//
//  Created by Иван Суслов on 11.06.2022.
//

import Foundation
struct AnswerBean: Codable{
    let id: Int
    let taskId: Int
    let rating: Int
    let studentRatingId: Int
    let number: Int
    let state: AnswerState
    
    private enum CodingKeys: String, CodingKey{
        case id = "id"
        case taskId = "taskId"
        case rating = "rating"
        case studentRatingId = "studentRatingId"
        case number = "number"
        case state = "state"
    }
}


enum AnswerState: String, Codable{
    case NO_ANSWER = "NO_ANSWER"
    case IN_PROGRESS = "IN_PROGRESS"
    case SENT = "SENT"
    case CHECKING = "CHECKING"
    case RATED = "RATED"
    case NO_RATING = "NO_RATING"
}

struct FullAnswer: Codable{
    let answer: AnswerBean
    let task: FullTask
    
    private enum CodingKeys: String, CodingKey{
        case answer = "answer"
        case task = "task"
    }
}

struct Answer{
    let id: Int
    let student: String
    let taskType: TaskType
    let answerState: AnswerState
}
