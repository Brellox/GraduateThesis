//
//  StorageManager.swift
//  DiplomaTeacherApp
//
//  Created by Иван Суслов on 22.03.2022.
//

import Foundation

class StorageManager{
    
    public static let shared = StorageManager()
    let defaults = UserDefaults.standard
    private let accessTokenKey = "access_token"
    private let currentUserId = "user_id"
    
    init(){
        
    }
    
    
    
    var access_token: String? {
        set{
            if newValue == nil {
                defaults.removeObject(forKey: accessTokenKey)
            }  else {
                defaults.set(newValue, forKey: accessTokenKey)
            }
        }
        get{
            return defaults.string(forKey: accessTokenKey)
        }
    }
    
    var user_id: String? {
        set{
            if newValue == nil {
                defaults.removeObject(forKey: currentUserId)
            }  else {
                defaults.set(newValue, forKey: currentUserId)
            }
        }
        get{
            return defaults.string(forKey: currentUserId)
        }
    }
}
