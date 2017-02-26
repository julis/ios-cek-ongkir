//
//  Constants.swift
//  Cek Ongkir
//
//  Created by julis on 2/24/17.
//  Copyright © 2017 julis. All rights reserved.
//

import Foundation

struct OngkirAPI {
    static let baseURL = "http://api.rajaongkir.com/starter"
    static let provinceURL = baseURL + "/province"
    static let cityURL = baseURL + "/city"

}

struct Key {
    static let apiKeyName = "key"
    static let apiKeyValue = "36a1815566bac43450ce5a1bb76f1975"
    static let apiIOSKeyName = "ios-key"
    static let apiIOSKeyValue = "id.julis.ios.Cek-Ongkir"
}
