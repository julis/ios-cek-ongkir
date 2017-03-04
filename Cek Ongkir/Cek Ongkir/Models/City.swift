//
//  City.swift
//  Cek Ongkir
//
//  Created by julis on 3/2/17.
//  Copyright © 2017 julis. All rights reserved.
//

import Foundation

struct City {
    var id: Int = 0
    var name: String = ""
    var postalCode: String = ""
    var province: String = ""
    var provinceId: Int = 0
    var type: String = ""
    
    
    
    static func create (from json: JSON) -> City {
        var city = City()
        city.id = json["city_id"].intValue
        city.name = json["city_name"].stringValue
        city.postalCode = json["postal_code"].stringValue
        city.province = json["province"].stringValue
        city.provinceId = json["province_id"].intValue
        city.type = json["type"].stringValue
        
        return city
    }
    
}
