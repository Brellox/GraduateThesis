//
//  RequestInit.swift
//  DiplomaTeacherApp
//
//  Created by Иван Суслов on 23.03.2022.
//

import Foundation

extension URLRequest {

    init(url: URL, method: String, headers: HTTPHeaders?) {
        self.init(url: url)
        httpMethod = method

        if let headers = headers {
            headers.forEach {
                setValue($0.1, forHTTPHeaderField: $0.0)
            }
        }
    }
}
