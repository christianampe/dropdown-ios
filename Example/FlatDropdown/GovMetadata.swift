//
//  GovMetadata.swift
//  tutor
//
//  Created by Ampe on 3/28/18.
//  Copyright © 2018 tutor. All rights reserved.
//

import Foundation

class GovMetadata {
    let totalItems: Int
    let itemsPerPage: Int
    let currentPage: Int
    
    init(items: Int, itemsPerPage: Int, currentPage: Int) {
        self.totalItems = items
        self.itemsPerPage = itemsPerPage
        self.currentPage = currentPage
    }
    
    convenience init?(dict: [String: Any]) {
        guard
            let totalItems = dict[JSONKeys.total.rawValue] as? Int,
            let itemsPerPage = dict[JSONKeys.perPage.rawValue] as? Int,
            let currentPage = dict[JSONKeys.page.rawValue] as? Int
        else {
            return nil
        }
        
        self.init(items: totalItems, itemsPerPage: itemsPerPage, currentPage: currentPage)
    }
    
    enum JSONKeys: String {
        case total = "total"
        case perPage = "per_page"
        case page = "page"
    }
}
