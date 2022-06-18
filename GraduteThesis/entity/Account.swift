//
//  Account.swift
//  DiplomaTeacherApp
//
//  Created by Иван Суслов on 23.03.2022.
//

import Foundation

struct Account: Codable{
    let id: Int
    let name: String
    let surname: String
    
    private enum CodingKeys: String, CodingKey{
        case id = "id"
        case name = "name"
        case surname = "surname"
    }
}
