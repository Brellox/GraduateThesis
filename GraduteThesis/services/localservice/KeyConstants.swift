//
//  KeyConstants.swift
//  DiplomaTeacherApp
//
//  Created by Иван Суслов on 22.03.2022.
//

import Foundation


fileprivate struct Urls{
    static let prod = "http://217.71.129.139:4502"
    static let home = ""
    
}


struct Keys {
    
    static let current_mod: StartMod = .PROD
    
    struct url_s{
        static var main_url: String
        {
            get{
                return Keys.current_mod == .PROD ? Urls.prod : Urls.home
            }
        }

    }

    struct error{
        static let error = "error"
        static let connect_fail = "http connection failed"
    }
    struct data{
        static let data = "data"
        static let session = "session"
    }
}

enum StartMod {
case PROD
case DEV
}
