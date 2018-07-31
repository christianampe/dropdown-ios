//
//  FlatDropdownDataSource.swift
//  FlatDropdown
//
//  Created by Ampe on 7/30/18.
//

import Foundation

public protocol FlatDropdownDataSource {
    // MARK: Storage
    var data: [[String]] { get set }
    
    // MARK: Get Methods
    func text(for index: IndexPath) -> String
    
    // MARK: Set Methods
}
