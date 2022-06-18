//
//  APIClient.swift
//  DiplomaTeacherApp
//
//  Created by Иван Суслов on 22.03.2022.
//

import Foundation

class APIClientBase{
    
    let decoder: JSONDecoder = JSONDecoder()
    
    func setDecoderBase64() {
        decoder.dataDecodingStrategy = .base64
    }
    
}
