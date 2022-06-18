//
//  MessageEntity.swift
//  DiplomaTeacherApp
//
//  Created by Иван Суслов on 23.03.2022.
//

import Foundation

struct ChatMessage: Codable {
    
    let id: String
    let dialog_id: String
    //check if should be acc or another
    let sender: Account
    let text: String
    let isRead: Bool
    //TODO: - сделать вложения
//    let attachments: [Content]?
    let datetime: String
    

    private enum CodingKeys: String, CodingKey {
        case id = "id"
        case dialog_id = "dialog_id"
        case sender = "sender"
        case text = "text"
        case isRead = "isRead"
//        case attachments
        case datetime = "date"
    }
}

struct SearchMessage: Codable {
    let items: [ChatMessage]
}
