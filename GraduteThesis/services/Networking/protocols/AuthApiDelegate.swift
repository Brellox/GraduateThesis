//
//  AuthApiDelegate.swift
//  DiplomaTeacherApp
//
//  Created by Иван Суслов on 23.03.2022.
//

import Foundation


protocol AuthApiDelegate: AnyObject {
    func loginResult(success: Bool, error_message: String?)
}

extension AuthApiDelegate {
    func loginResult(success: Bool, error_message: String?){}
    
}
