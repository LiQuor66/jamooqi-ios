//
//  PersistantService.swift
//  jamooqi-ios
//
//  Created by Patsita on 10/12/18.
//  Copyright © 2018 jamooqi. All rights reserved.
//
import Foundation
protocol IPersistentService {
    
    func saveStandard(value: Any?, key: String)
    func loadStandard(key: String) -> Any?
    func removeStandard(key: String)
    
    //for storing model objects
    func save<T: Codable>(_ object: T, key: String)
    func load<T: Codable>(key: String) -> T?
    func remove<T: Codable>(_ type: T.Type, key: String)
}

final class PersistentService: IPersistentService {
    
    func saveStandard(value: Any?, key: String) {
        
        UserDefaults.standard.set(value, forKey: key)
    }
    
    func loadStandard(key: String) -> Any? {
        
        return UserDefaults.standard.object(forKey: key)
    }
    
    func removeStandard(key: String) {
        
        UserDefaults.standard.removeObject(forKey: key)
    }
    
    func load<T>(key: String) -> T? where T : Decodable, T : Encodable {
        
        return Defaults.shared.get(for: Key<T>(key))
    }
    
    func save<T>(_ object: T, key: String) where T : Decodable, T : Encodable {
        
        Defaults.shared.set(object, for: Key<T>(key))
    }
    
    func remove<T>(_ type: T.Type, key: String) where T : Decodable, T : Encodable {
        
        Defaults.shared.clear(Key<T>(key))
    }
}
