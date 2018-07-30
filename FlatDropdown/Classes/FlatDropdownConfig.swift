//
//  FlatDropdownConfig.swift
//  FlatDropdown
//
//  Created by Ampe on 7/30/18.
//

import Foundation

public struct FlatDropdownConfig {
    public let flatFieldHeight: CGFloat
    public let numberOfResults: Int
    public let cellReuseIdenfier: String
    
    public init(flatFieldHeight: CGFloat,
                numberOfResults: Int,
                cellReuseIdenfier: String = FlatDropdownConfig.default.cellReuseIdenfier) {
        
        self.flatFieldHeight = flatFieldHeight
        self.numberOfResults = numberOfResults
        self.cellReuseIdenfier = cellReuseIdenfier
    }
    
    public static let `default` = FlatDropdownConfig(flatFieldHeight: 50, numberOfResults: 5, cellReuseIdenfier: "FlatDropdownCell")
}
