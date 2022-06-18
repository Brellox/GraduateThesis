//
//  MainData.swift
//  DiplomaTeacherApp
//
//  Created by Иван Суслов on 22.03.2022.
//

import Foundation
import UIKit


class MainData {
    
    static var shared: MainData = {
        let instance = MainData()
        return instance
    }()
    
    private var current_user: Account? = nil
    
    let storegeManager = StorageManager()
    
    var current_session: String?
    
    var device_token: String?
    
    var loginBase: String?
    
    var currentVC: UIViewController?
    let token = ""
    
    
    var access_token: String? {
        get {
            return StorageManager.shared.access_token
        }
    }
    
    var current_user_id: String? {
        get{
            return StorageManager.shared.user_id
        }
    }
    
    var currentUser: Account? {
        set{
            SocketClient.shared.connectToWebSocket()
            self.current_user = newValue
        }
        get{
            return self.current_user
        }
    }
}
