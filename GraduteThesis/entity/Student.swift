//
//  Student.swift
//  DiplomaTeacherApp
//
//  Created by Иван Суслов on 23.03.2022.
//

import Foundation

struct Student: Codable{
    let id: Int
    let account: Account
    
    private enum CodingKeys: String, CodingKey{
        case id = "id"
        case account = "account"
    }
}

struct StudentRating: Codable{
    let id: Int
    let semesterRating: Int
    let questionRating: Int
    let exerciseRating: Int
    let examId: Int
    let studentId: Int
    let groupRatingId: Int
    
    private enum CodingKeys: String, CodingKey{
        case id = "id"
        case semesterRating = "semesterRating"
        case questionRating = "questionRating"
        case exerciseRating = "exerciseRating"
        case examId = "examId"
        case studentId = "studentId"
        case groupRatingId = "groupRatingId"
    }
}

struct FullStudent: Codable{
    let student: Student
    
    private enum CodingKeys: String, CodingKey{
        case student = "student"
    }
}
