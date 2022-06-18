//
//  RequestDelegate.swift
//  DiplomaTeacherApp
//
//  Created by Иван Суслов on 23.03.2022.
//

import Foundation

protocol RequestManagerDelegate: AnyObject {
    func error_back(message: String)
    func result_data(data: Data)
}
