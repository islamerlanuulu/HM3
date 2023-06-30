//
//  KeyChain.swift
//  homeWork3.5
//
//  Created by Islam Erlan Uulu on 30/6/23.
//

import Security
import Foundation

class KeychainManager {
    static let shared = KeychainManager()
    
    private init() {}
    
    func saveValue(service: String, account: String, value: String) -> Bool {
        if let data = value.data(using: .utf8) {
            let keychainQuery: [String: Any] = [
                kSecClass as String: kSecClassGenericPassword,
                kSecAttrService as String: service,
                kSecAttrAccount as String: account,
                kSecValueData as String: data
            ]
            
            SecItemDelete(keychainQuery as CFDictionary)
            
            let status = SecItemAdd(keychainQuery as CFDictionary, nil)
            return status == errSecSuccess
        }
        
        return false
    }
    
    func loadValue(service: String, account: String) -> String? {
        let keychainQuery: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrService as String: service,
            kSecAttrAccount as String: account,
            kSecMatchLimit as String: kSecMatchLimitOne,
            kSecReturnData as String: kCFBooleanTrue!
        ]
        
        var result: AnyObject?
        let status = SecItemCopyMatching(keychainQuery as CFDictionary, &result)
        
        if status == errSecSuccess, let data = result as? Data {
            return String(data: data, encoding: .utf8)
        }
        
        return nil
    }
    
    
    func removeValue(service: String, account: String) -> Bool {
        let keychainQuery: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrService as String: service,
            kSecAttrAccount as String: account
        ]
        
        let status = SecItemDelete(keychainQuery as CFDictionary)
        return status == errSecSuccess
    }
}

