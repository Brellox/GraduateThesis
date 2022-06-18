//
//  Group.swift
//  GraduteThesis
//
//  Created by Иван Суслов on 06.06.2022.
//

import Foundation

struct Group: Codable{
    let id: Int
    let name: String
    
    private enum CodingKeys: String, CodingKey{
        case id = "id"
        case name = "name"
    }
}

struct GroupModel: Codable{
    let id: Int
    let name: String
    var isSelected = false
    
    private enum CodingKeys: String, CodingKey{
        case id = "id"
        case name = "name"
    }
    
    init(from group: Group) {
        self.id = group.id
        self.name = group.name
    }
}
