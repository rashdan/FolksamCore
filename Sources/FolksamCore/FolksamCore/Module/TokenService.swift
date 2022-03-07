//
//  TokenService.swift
//  FolksamCore
//
//  Created by Johan Torell on 2021-02-15.
//

import Foundation
import Security

enum SecureStoreError: Error {
    case string2DataConversionError
    case itemUpdateError
    case itemAddError
    case unknownError
    case itemNotFound
}

class TokenService {
    let tag = "com.folksam.bankidtoken".data(using: .utf8)!

    func setValue(for value: String) throws {
        guard let value = value.data(using: .utf8) else { throw SecureStoreError.string2DataConversionError }
        let addquery: [String: Any] = [kSecClass as String: kSecClassGenericPassword, kSecValueData as String: value, kSecAttrService as String: tag]
        //        let getquery: [String: Any] = [kSecClass as String: kSecClassGenericPassword, kSecAttrApplicationTag as String: tag, kSecReturnRef as String: value]

        var status = SecItemCopyMatching(addquery as CFDictionary, nil)

        switch status {
        case errSecSuccess:
            let attributesToUpdate: [String: Any] = [kSecValueData as String: value]
            status = SecItemUpdate(addquery as CFDictionary, attributesToUpdate as CFDictionary)
            guard status == errSecSuccess else { throw SecureStoreError.itemUpdateError }
        case errSecItemNotFound:
            status = SecItemAdd(addquery as CFDictionary, nil)
            guard status == errSecSuccess else { throw SecureStoreError.itemAddError }
        default:
            throw SecureStoreError.unknownError
        }
    }

    func getValue() -> String? {
        var item: CFTypeRef?
        let tag = "com.folksam.bankidtoken".data(using: .utf8)!
        let getquery: [String: Any] = [kSecClass as String: kSecClassGenericPassword, kSecAttrService as String: tag, kSecReturnData as String: true]
        let status = SecItemCopyMatching(getquery as CFDictionary, &item)
        guard status == errSecSuccess else { return nil }
        guard let data = item as? Data else { return nil }
        let token = String(decoding: data, as: UTF8.self)
        return token
    }
}
