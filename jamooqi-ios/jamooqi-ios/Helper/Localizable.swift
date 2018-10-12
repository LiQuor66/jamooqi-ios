//
//  Localizable.swift
//  jamooqi-ios
//
//  Created by Patsita on 10/12/18.
//  Copyright © 2018 jamooqi. All rights reserved.
//

import Foundation

func LS(_ key: String) -> String {
    
    return NSLocalizedString(key, tableName: nil, bundle: bundleForCurrentLanguage(), value: "", comment: "")
}
