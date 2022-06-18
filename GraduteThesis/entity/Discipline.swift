//
//  Discipline.swift
//  DiplomaTeacherApp
//
//  Created by Иван Суслов on 23.03.2022.
//

import Foundation

struct Discipline: Codable{
    let id: Int
    let name: String
    
    private enum CodingKeys: String, CodingKey{
        case id = "id"
        case name = "name"
    }
}

