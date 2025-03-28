//
//  KeychainHelper.swift
//  MVVMWithCoordinator
//
//  Created by waqas ahmed on 16/03/2025.
//

import Foundation
class KeychainHelper{
    static let shared = KeychainHelper()
        private let service = "com.mvvmwithcoordinator.pinService"

        private func getKeychainQuery(for key: String) -> [String: Any] {
            return [
                kSecClass as String: kSecClassGenericPassword,
                kSecAttrService as String: service,
                kSecAttrAccount as String: key,
                kSecAttrAccessible as String: kSecAttrAccessibleWhenUnlocked
            ]
        }

        /// **Save PIN securely in Keychain**
        func savePIN(_ pin: String, forKey key: String) {
            let data = pin.data(using: .utf8)!
            var query = getKeychainQuery(for: key)
            
            SecItemDelete(query as CFDictionary) // Delete existing item
            
            query[kSecValueData as String] = data
            SecItemAdd(query as CFDictionary, nil)
        }

        /// **Retrieve PIN from Keychain**
        func getPIN(forKey key: String) -> String? {
            var query = getKeychainQuery(for: key)
            query[kSecMatchLimit as String] = kSecMatchLimitOne
            query[kSecReturnData as String] = kCFBooleanTrue
            
            var dataTypeRef: AnyObject?
            let status = SecItemCopyMatching(query as CFDictionary, &dataTypeRef)
            
            if status == errSecSuccess, let data = dataTypeRef as? Data {
                return String(data: data, encoding: .utf8)
            }
            return nil
        }

        /// **Delete PIN from Keychain**
        func deletePIN(forKey key: String) {
            let query = getKeychainQuery(for: key)
            SecItemDelete(query as CFDictionary)
        }
}
