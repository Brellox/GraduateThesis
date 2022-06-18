//
//  StringExtension.swift
//  DiplomaTeacherApp
//
//  Created by Иван Суслов on 23.03.2022.
//

import Foundation
extension String {
    /**Emply value for String*/
    static let valEmpty: String = ""
    
    var toDate: Date?{
        get{
            let dateFormatter = DateFormatter()
            dateFormatter.locale = Locale(identifier: "en_US_POSIX") // set locale to reliable US_POSIX
            dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
            return dateFormatter.date(from:self)
        }
    }
    
    var imEmail: Bool {
        get{
            let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
            let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
            return emailPred.evaluate(with: self)
        }
    }
    
    func fromBase64() -> String? {
            guard let data = Data(base64Encoded: self) else {
                return nil
            }

            return String(data: data, encoding: .utf8)
        }

        func toBase64() -> String {
            return Data(self.utf8).base64EncodedString()
        }
}
