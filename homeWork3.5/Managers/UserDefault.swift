//
//  UserDefault.swift
//  homeWork3.5
//
//  Created by Islam Erlan Uulu on 30/6/23.
//

import Foundation

final class UserDefaultService{
    enum UserDefaultkeys: String{
        case color
    }
   
    static let shared = UserDefaultService()
    private let userDefault = UserDefaults.standard
    
    private init() { }
    
    func save(_ item: Any, forKey key: UserDefaultkeys){
        userDefault.set(item, forKey: key.rawValue)
    }
    func string(forKey key: UserDefaultkeys) -> String? {
        userDefault.string(forKey: key.rawValue)
    }
}
