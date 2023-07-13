//
//  BaseAuthService.swift
//  homeWork3.5
//
//  Created by Islam Erlan Uulu on 13/7/23.
//

import Foundation

class BaseAuthorization {
    
    private let keychain = KeychainStorage.shared
    
    func saveSession() {
        let minuteLater = Calendar.current.date(bySetting: .minute, value: 3, of: Date())!
        let encoder = JSONEncoder()
        encoder.dateEncodingStrategy = .secondsSince1970
        let data = try! encoder.encode(minuteLater)
        do {
            try self.keychain.save(
                service:
                    Constants
                    .Authorization
                    .service,
                account:
                    Constants
                    .Authorization
                    .account,
                data: data
            )
        }  catch {
            print(error.localizedDescription)
        }
    }
}
