//
//  AnyError.swift
//  DiplomaTeacherApp
//
//  Created by Иван Суслов on 23.03.2022.
//

import Foundation

struct AnyError: Error {

    let error: Error

    init(_ error: Error) {
        self.error = error
    }
}

