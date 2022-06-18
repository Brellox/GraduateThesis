//
//  Task.swift
//  GraduteThesis
//
//  Created by Иван Суслов on 11.06.2022.
//

import Foundation

struct Task: Codable{
    let id: Int
    let text: String
    let taskType: TaskType
    
    private enum CodingKeys: String, CodingKey{
        case id = "id"
        case text = "text"
        case taskType = "taskType"
    }
}

enum TaskType: String, Codable{
    case QUESTION = "QUESTION"
    case EXERCISE = "EXERCISE"
}

struct FullTask: Codable{
    let task: Task
    
    private enum CodingKeys: String, CodingKey{
        case task = "task"
    }
}
