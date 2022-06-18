//
//  Teacher.swift
//  DiplomaTeacherApp
//
//  Created by Иван Суслов on 23.03.2022.
//

import Foundation

struct Teacher: Codable{
    let id: Int
    let account: Account
    let discipline: [Discipline]
    
    private enum CodingKeys: String, CodingKey{
        case id = "id"
        case account = "account"
        case discipline = "disciplineBeans"
    }
}
