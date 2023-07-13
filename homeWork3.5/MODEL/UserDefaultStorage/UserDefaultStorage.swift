//
//  UserDefaultStorage.swift
//  homeWork3.5
//
//  Created by Islam Erlan Uulu on 13/7/23.
//

import Foundation

class UserDefaultStorage {
    
    enum UserDefaultKeys: String {
        case temporarykey
    }
    
    static let shared = UserDefaultStorage()
    private let userDefault = UserDefaults.standard
    
    func save<T: Any>(data: T, key: UserDefaultKeys) {
        userDefault.set(data, forKey: key.rawValue)
    }
    
    func retrieveString( key: UserDefaultKeys) ->  Any? {
        return userDefault.object(forKey: key.rawValue)
    }
}
