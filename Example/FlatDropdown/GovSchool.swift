//
//  GovSchool.swift
//  tutor
//
//  Created by Ampe on 3/27/18.
//  Copyright © 2018 tutor. All rights reserved.
//

import Foundation

class GovSchool {
    let id: Int
    let name: String
    
    init(id: Int, name: String) {
        self.id = id
        self.name = name
    }
    
    convenience init?(dict: [String: Any]) {
        guard
            let id = dict[JSONKeys.id.rawValue] as? Int,
            let name = dict[JSONKeys.name.rawValue] as? String
        else {
            return nil
        }
        
        self.init(id: id, name: name)
    }
    
    enum JSONKeys: String {
        case id = "id"
        case name = "school.name"
    }
}
